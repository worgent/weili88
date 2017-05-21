package base.util;

import base.SystemGlobal;
import freemarker.ext.beans.BeansWrapper;
import freemarker.template.Configuration;
import freemarker.template.Template;

import javax.servlet.ServletContext;
import java.io.*;
import java.util.Locale;
import java.util.Map;

/**
 * User: liuwentao@kongzhong.com
 * Date: 2010-4-21 10:35:53
 * <p/>
 * 说明:
 */
public class BaseFreemarkerUtil {

    /**
     * 利用freemarker做静态化
     * @param context
     * @param data
     * @param templatePath
     * @param targetHtmlPath
     * @return String
     */
    public static String createHtml(ServletContext context, Map data, String templatePath, String targetHtmlPath) {
        Configuration freemarkerCfg = new Configuration();
        //加载模版
        freemarkerCfg.setServletContextForTemplateLoading(context, "/");
        freemarkerCfg.setEncoding(Locale.getDefault(), "UTF-8");
        String content = "suc";
        try {
            //指定模版路径
            Template template = freemarkerCfg.getTemplate(templatePath, "UTF-8");
            template.setEncoding("UTF-8");
            Writer out = null;
            //静态页面路径
            if (targetHtmlPath != null) {
                String htmlPath = context.getRealPath("/html") + "/" + targetHtmlPath;
                File htmlFile = new File(htmlPath);
                if (!htmlFile.getParentFile().exists()) {
                    htmlFile.getParentFile().mkdirs();
                }

                out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(htmlFile), "UTF-8"));
                template.process(data, out);
            } else {
                ByteArrayOutputStream bos = new ByteArrayOutputStream();
                // out = new OutputStreamWriter(bos, "UTF-8");
                out = new OutputStreamWriter(bos);
                template.process(data, out);
                content = bos.toString();
            }
            //处理模版
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return content;
    }
    
    
    public static Configuration configuration = null;


    public static Configuration getConfiguration() {
        if (configuration == null) {
            configuration = new Configuration();
            configuration.setEncoding(new Locale("zh_CN"), "utf-8");
            configuration.setDefaultEncoding("utf-8");
            configuration.setTemplateUpdateDelay(3600000);
            configuration.setCacheStorage(new freemarker.cache.MruCacheStorage(20, 250));
            try {
            	String path = SystemGlobal.getWebRoot();
            	path = path.substring(0,path.indexOf("WEB-INF"))+"tagTemplates";
				configuration.setDirectoryForTemplateLoading(new File(path));
			} catch (IOException e) {
				e.printStackTrace();
			}
        }
        return configuration;
    }

    public static void mergeTemplate(String t, Map rootMap, Writer writer) throws Exception {
        Template template = getConfiguration().getTemplate(t, "utf-8");
        if (template == null) {
            throw new Exception("template is null");
        } else {
            rootMap.put("statics", BeansWrapper.getDefaultInstance().getStaticModels());
            template.process(rootMap, writer);
            writer.flush();
        }
    }

}
