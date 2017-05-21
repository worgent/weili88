package base.jsptag;

import base.SystemGlobal;
import freemarker.cache.CacheStorage;
import freemarker.cache.MruCacheStorage;
import freemarker.template.Configuration;
import freemarker.template.Template;
import org.apache.commons.lang.StringUtils;

import java.io.File;
import java.io.StringWriter;
import java.io.Writer;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;

public class TemplateConfiguration {
	
	private static Configuration configuration = null;
	
	private static final String ENCODEING = "utf-8";
	
	
	public static synchronized Configuration getConfiguration()
	{
		if ( configuration==null ) {
			configuration = new Configuration();
			configuration.setEncoding( new Locale("zh_CN"), "utf-8" );
			configuration.setDefaultEncoding("utf-8");
			configuration.setCacheStorage( new MruCacheStorage(500, 800) );
			configuration.setClassForTemplateLoading( TemplateConfiguration.class, "/template" );
			configuration.setTemplateUpdateDelay(7200);
		}
		
		return configuration;
	}
	
	
	public static String mergeTemplate( String templateName, Map rootMap ) throws Exception 
	{
		Writer writer = new StringWriter();
		mergeTemplate( templateName, rootMap, writer );
		return writer.toString();
	}

	
	public static void mergeTemplate( String templateName, Map rootMap, Writer writer ) throws Exception 
	{
		Configuration config = TemplateConfiguration.getConfiguration();
		mergeTemplate( config, templateName, rootMap, writer );
	}
	
	
	private static void mergeTemplate( Configuration config, String templateName, Map rootMap, Writer writer ) throws Exception
	{
		Template template = config.getTemplate( templateName, ENCODEING );
		if ( template==null ) throw new Exception( "模板不存在：" + templateName + ", com.koolearn.rest.taglib" );
		template.process( rootMap, writer );
		writer.flush();
	}
	
	
	public static void mergeTemplate( Properties prop, String templateName, Map rootMap, Writer writer ) throws Exception
	{
		String encode = prop.getProperty("encode");
		if ( StringUtils.isBlank(encode) ) encode = "utf-8";
		
		String path = prop.getProperty("path");
		if ( path==null ) path = "/jsptag";
		path = SystemGlobal.getWebRoot() + path;
		
		Configuration config = new Configuration();
		config.setEncoding( new Locale("zh_CN"), encode );
		config.setDefaultEncoding( encode );
		config.setTemplateUpdateDelay(7200);
		config.setDirectoryForTemplateLoading( new File(path) );
		
		CacheStorage storage = new MruCacheStorage( 500, 500 );
		config.setCacheStorage( storage );
		
		String numberFormat = prop.getProperty( "number_format" );
		if ( StringUtils.isBlank(numberFormat) ) numberFormat = "#";
		config.setNumberFormat( numberFormat );
				
		mergeTemplate( config, templateName, rootMap, writer );
	}
}
