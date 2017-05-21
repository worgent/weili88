package base.listener;

import base.SystemGlobal;
import base.bean.JndiBean;
import base.constant.SystemGlobalConstant;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.Properties;

/**
 * User: liuwentao@kongzhong.com
 * Date: 2010-3-16 Time: 15:39:35
 * <p/>
 */
public class BeforeContextLoaderListener implements javax.servlet.ServletContextListener {
    protected final Log log = LogFactory.getLog(getClass());

    /**
     * @param event
     */
    public void contextInitialized(ServletContextEvent event) {
        ServletContext context = event.getServletContext();
        //加载 SystemGlobals.properties
        SystemGlobal.loadConfig(SystemGlobalConstant.CONFIG_FILE);
        //再加载 SystemGlobals_***.properties,注意 在前面的基础上 如果存在就覆盖，不存在就增加
        this.loadConfigByJndi(SystemGlobalConstant.CONFIG_FILE);

        //顺道把 项目根的物理路径得到
        String webRoot = context.getRealPath("/");
        webRoot = webRoot.replaceAll("\\\\", "/");
        if (webRoot.endsWith("/")) {
            webRoot = webRoot.substring(0, webRoot.length() - 1);
        }
        SystemGlobal.setPreference("webRoot", webRoot);

        
    }

    public void contextDestroyed(ServletContextEvent event) {

    }

    /**
     * 加载 SystemGlobals_***.properties
     * @param configFile
     */
    private void loadConfigByJndi(String configFile) {
        try {
            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            Object jndiApp_obj = envCtx.lookup("bean/MyBeanFactory");
            JndiBean jndiBean = (JndiBean) jndiApp_obj;

            //没有配置jndi
            if(jndiBean == null){
                log.warn("not config jndi for this domain at ${tomcat}\\conf\\Catalina\\localhost");
                return;
            }

            //个性化加载 SystemGlobals_***.properties
            configFile = configFile.replace(".","_" + jndiBean.getDomain()+".");
            log.warn("配置文件：configFile = " + configFile);
            InputStream inputStream = this.getClass().getClassLoader().getResourceAsStream(configFile);

            //文件没找到
            if(inputStream == null){
                log.error("inputStream == null for configFile=" + configFile);
                return;
            }

            //覆盖或增加先前 SystemGlobals.properties
            Properties p = new Properties();
            p.load(inputStream);
            Enumeration enu = p.keys();
            String key = "";
            System.out.println(configFile + "-------------------------");
            while (enu.hasMoreElements()) {
                key = (String) enu.nextElement();
                SystemGlobal.setPreference(key, (String) p.get(key));
                System.out.println("-------------------------p.get(" + key + ")=" + p.get(key));
            }

            SystemGlobal.setPreference("jndi",jndiBean.getDomain());

            Runtime runtime = Runtime.getRuntime();
            System.out.println("TotalMemory=" + (runtime.totalMemory()/(1024*1024) + "M"));
            System.out.println("Max Memory=" + (runtime.maxMemory()/(1024*1024) + "M"));
            System.out.println("Free Memory=" + (runtime.freeMemory()/(1024*1024) + "M"));
            System.out.println("Available Processors=" + runtime.availableProcessors());

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(".....|..|.....not config jndi for this domain.");
        }
    }
}

