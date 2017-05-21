package base.jsptag;

import base.MD5;
import base.jsptag.FreeMarkerTag;
import base.jsptag.factory.JspTagFactory;
import base.repository.engine.CacheEngine;
import base.repository.engine.CacheEngineFactory;
import base.util.BaseCookieUtil;
import base.util.BaseIntUtil;
import base.util.BaseStringUtil;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspException;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public abstract class BaseTag extends FreeMarkerTag {
    protected Log log = LogFactory.getLog(getClass());
    protected String TAG_NAME;
    protected String remoteInterface;
    protected String remoteOperation;
    private boolean local = true; //是否跨应用
    private boolean cache = false; //是否使用缓存
    protected boolean cache2 = true; //是否保存数据进缓存
    protected Map configMap = new HashMap();
    protected String configId;
    protected String configFile;

    protected void setRequestAttribute(String key, Object value) {
        if (value == null) {
            return;
        }
        pageContext.getRequest().setAttribute(key, value);
    }

    protected Object getRequestAttribute(String key) {
        if (BaseStringUtil.isBlank(key)) {
            return null;
        }
        return pageContext.getRequest().getAttribute(key);
    }

    protected int getRequestAttributeInt(String key) {
        Object obj = getRequestAttribute(key);
        return BaseIntUtil.getInt(obj);
    }

    protected String getRequestParameter(String key){
        if (BaseStringUtil.isBlank(key)) {
            return null;
        }
        return pageContext.getRequest().getParameter(key);
    }

    protected int getRequestParameterInt(String key){
        String value = this.getRequestParameter(key);
        return BaseIntUtil.getInt(value);
    }


    protected String getCookieValue(String key) {
        if (BaseStringUtil.isBlank(key)) {
            return null;
        }
        HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();

        String value = BaseCookieUtil.getCookieValue(request, key);

        return value;
    }

    protected void setCookieValue(String key, String value,int maxAge) {
        if (value == null || BaseStringUtil.isBlank(key)) {
            return;
        }
        HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
        HttpServletResponse response = (HttpServletResponse) pageContext.getResponse();

        BaseCookieUtil.setCookie(request,response,key,value,maxAge);
    }

    /**
     * 标签结束
     * 修正 配置文件中属性 优先级高于 标签属性 BUG
     *
     * @return
     * @throws javax.servlet.jsp.JspException
     */
    @Override
    public int doEndTag() throws JspException {
        this.setConfigId(null);
        this.setTemplate(null);
        this.reset();
        log.debug("---------------------------------------------------------");
        return super.doEndTag();
    }

    protected String getKey(String queryString)  {
        String key = this.getSimpleName() + queryString;
        MD5 m = new MD5();
        key = m.calcMD5(key);
        return key;
    }

    @Override
    protected void prepareContext(Map context) throws Exception {
        //加载xml配置文件
        ConfigBean configBean = this.loadCoinfig();
        configMap = configBean.getProperties();
        this.init();
        Object result = null;

        String key = this.getKey(this.getQueryString());
        String keyBak = key + "_bak";// 最后一次正确的值
        String keyRead = key + "_read";//读的次数 超过3次不再继续读

        if (!this.isCache()) {
            //未使用缓存
            log.debug("!!!! " + this.getSimpleName() + " not use cache...");
            result = loadData();
            //上一次未使用缓存的值 失效
            setCacheValue(key, null);
            setCacheValue(keyBak, null);
            setCacheValue(keyRead, 0);
        } else {
            log.debug(this.getSimpleName() + " use cache...");
            result = getCacheValue(key);
            if (result != null) {
                log.debug("get " + this.getSimpleName() + " data from cache.... key=" + key);
            } else {
                int loadNum = 0;
                Object loadNumObj = getCacheValue(keyRead);
                if (loadNumObj != null) {
                    loadNum = (Integer) getCacheValue(keyRead);
                }
                log.debug(this.getSimpleName() + " read null more than " + loadNum + " times");

                if (loadNum >= 3) {
                    //log.warn(this.getSimpleName() + " read null more than " + loadNum + " times no read any more");
                } else {
                    try {
                        result = loadData();
                    } catch (Exception e) {
                        e.printStackTrace();
                        result = null;
                    }

                    if (result == null) {
                        //读的次数加1
                        loadNum++;
                        setCacheValue(keyRead, loadNum);
                        log.debug(this.getSimpleName() + " loadData() == null,loadNum=" + loadNum);
                        //取上一次正确的值
                        result = getCacheValueBak(keyBak);
                        if (result != null) {
                            log.debug("get " + this.getSimpleName() + " data from cachebak.... key=" + keyBak);
                        }
                    } else {
                        setCacheValue(keyRead, 0);
                    }

                    if (result != null) {
                        //把结果存入缓存
                        setCacheValue(key, result);
                        log.debug("set " + this.getSimpleName() + " data to cache.... key=" + key);
                        //更新上一次正确的值
                        setCacheValueBak(keyBak, result);
                    }
                }
            }
        }
        context.put("data", result);
        beforeRender(context);
    }

    private Object loadData() throws Exception {
        Object data = null;
        if (this.isLocal()) {
            log.debug("loadDataLocal() .....");
            data = loadDataLocal();
        } else {
            log.debug("loadDataRemote() .....");
            data = loadDataRemote();
        }
        return data;
    }

    private ConfigBean loadCoinfig() {
        if (this.getConfigId() == null) {
            return new ConfigBean();
        }
        String configFile = this.getConfigFile();
        String cacheKey = getSimpleName() + "_" + configFile + "_" + this.getConfigId();
        cacheKey = new MD5().calcMD5(cacheKey);

        //从缓存读，防止每次都读配置文件
        ConfigBean configBean = JspTagFactory.getConfigBean(cacheKey);
        if (configBean != null) {
//            Map<String, Object> map = configBean.getProperties();
//            if(KoolearnBooleanUtils.getValue(map.get("cache"))){
            // System.out.println("4++find configBean from cache for cacheKey=" + cacheKey);
            return configBean;
//            }
        }
        // System.out.println("4--not find configBean from cache for cacheKey=" + cacheKey);
        configBean = new ConfigBean();
        SAXReader reader = new SAXReader();
        OutputFormat format = OutputFormat.createPrettyPrint();
        format.setEncoding("UTF-8");// 设置XML文件的编码格式

        HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
        ServletContext context = request.getSession().getServletContext();
        String filePath = context.getRealPath("/jsptag/config") + "/" + configFile;
        Element root = null;

        File file = new File(filePath);
        if (file.exists()) {
            Document document = null;// 读取XML文件
            try {
                document = reader.read(file);
            } catch (DocumentException e) {
                e.printStackTrace();
                return configBean;
            }
            root = document.getRootElement();// 得到根节点
        }

        if (root == null) {
            //log.error("this.getRootElement(" + filePath + ")=null");
            return configBean;
        }


        for (Iterator i = root.elementIterator("config"); i.hasNext(); ) {
            Element element = (Element) i.next();
            String id = element.attributeValue("id");
            if (this.getConfigId().equals(id)) {
                configBean.setConfigId(id);
                Map<String, Object> properties = new HashMap<String, Object>();
                for (Iterator k = element.elementIterator("property"); k.hasNext(); ) {
                    Element element2 = (Element) k.next();
                    String name = element2.attributeValue("name");
                    String value = element2.getTextTrim();
                    properties.put(name, value);
                }
                configBean.setProperties(properties);
                JspTagFactory.setConfigBean(cacheKey, configBean);
                return configBean;
            }
        }
        //log.error("not find configId=" + this.getConfigId() + " in " + filePath);
        JspTagFactory.setConfigBean(cacheKey, configBean);
        return configBean;
    }

    private Object getCacheValue(String key) {
        CacheEngine cacheEngine = CacheEngineFactory.getEngine();
        if (key == null || cacheEngine == null) {
            return null;
        }
        return cacheEngine.get(getCacheName(), key);
    }

    private Object getCacheValueBak(String key) {
        CacheEngine cacheEngine = CacheEngineFactory.getEngine();
        if (key == null || cacheEngine == null) {
            return null;
        }
        return cacheEngine.get("bak", key);
    }

    private void setCacheValue(String key, Object value) {
        CacheEngine cacheEngine = CacheEngineFactory.getEngine();
        log.debug("#cacheEngine=" + cacheEngine.getClass().getSimpleName());
        if (key == null || cacheEngine == null) {
            return;
        }
        cacheEngine.add(getCacheName(), key, value);
    }

    private void setCacheValueBak(String key, Object value) {
        CacheEngine cacheEngine = CacheEngineFactory.getEngine();
        if (key == null || cacheEngine == null) {
            return;
        }
        cacheEngine.add("bak", key, value);
    }

    /**
     * @param obj
     * @return
     */
    protected int getInt(Object obj) {
        return BaseIntUtil.getInt(obj);
    }

    protected String encode(String name) {
        try {
            return URLEncoder.encode(name, "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "";
    }

    protected void init() {
        if (configMap == null || configMap.isEmpty()) {
            return;
        }

        //方便freemarker 报错时候打印
        pageContext.setAttribute("configId",configId);
        pageContext.setAttribute("configFile",configFile);




        String template = this.getTemplate() == null ? (String) configMap.get("template") : this.getTemplate();
        if (StringUtils.isBlank(template)) {
            template = "ftl/" + this.getSimpleName() + ".ftl";
        } else {
            template = "ftl/" + template;
        }

        this.setTemplate(template.trim());

        String c = (String) configMap.get("cache");
        if (!StringUtils.isBlank(c)) {
            if ("false".equals(c.trim().toLowerCase())) {
                this.setCache(false);
            } else {
                this.setCache(true);
            }
        }
        String loc = (String) configMap.get("local");
        if (!StringUtils.isBlank(loc)) {
            if ("false".equals(loc.trim().toLowerCase())) {
                this.setLocal(false);
            } else {
                this.setLocal(true);
            }
        }

    }

    /**
     * 得到 config 文件
     *
     * @return
     */
    protected String getConfigFile() {
        if (configFile == null || "".equals(configFile)) {
            return this.getSimpleName() + ".xml";
        }
        configFile = configFile.trim();
        if (!configFile.endsWith(".xml")) {
            configFile += ".xml";
        }
        return configFile;
    }

    public String getCacheName() {
        return "b_" + this.getSimpleName();
    }

    //==================================需要子类实现的抽象方法===================================

    public abstract String getSimpleName();

    protected abstract String getQueryString();

    public abstract void beforeRender(Map context);

    protected abstract Object loadDataRemote() throws Exception;

    protected abstract Object loadDataLocal() throws Exception;

    protected abstract void reset();

    //===============================get/set方法===========================================

    public String getRemoteInterface() {
        return remoteInterface;
    }

    public void setRemoteInterface(String remoteInterface) {
        this.remoteInterface = remoteInterface;
    }

    public String getRemoteOperation() {
        return remoteOperation;
    }

    public void setRemoteOperation(String remoteOperation) {
        this.remoteOperation = remoteOperation;
    }

    public boolean isLocal() {
        return local;
    }

    public void setLocal(boolean local) {
        this.local = local;
    }

    public boolean isCache() {
        return cache;
    }

    public void setCache(boolean cache) {
        this.cache = cache;
    }

    public Map getConfigMap() {
        return configMap;
    }

    public void setConfigMap(Map configMap) {
        this.configMap = configMap;
    }

    public String getConfigId() {
        return configId;
    }

    public void setConfigId(String configId) {
        this.configId = configId;
    }

    public void setConfigFile(String configFile) {
        this.configFile = configFile;
    }

    public boolean isCache2() {
        return cache2;
    }

    public void setCache2(boolean cache2) {
        this.cache2 = cache2;
    }
}
