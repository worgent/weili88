package base.jsptag;

//import com.koolearn.rest.taglib.*;
//import com.koolearn.rest.template.ContainsMapKeyMethod;
//import com.koolearn.rest.template.GetMapValueMethod;
//import com.koolearn.rest.template.SetMapValueMethod;
//import com.koolearn.rest.template.TemplateSelector;
//import com.koolearn.rest.util.I18n;
//import freemarker.ext.beans.BeansWrapper;

import freemarker.ext.beans.BeansWrapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.Writer;
import java.security.SecurityPermission;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;


public abstract class FreeMarkerTag extends TagSupport {
	private String template;
	
	private String charset = "UTF-8";
	
	private String path = "/jsptag";

	
	public int doStartTag() throws JspException 
	{
		try {
			Map context = new HashMap();
			prepareContext( context );
			
			printTemplate( context );
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return super.doStartTag();
	}
	
	
	protected abstract void prepareContext( Map context ) throws Exception;
	
	
	private void printTemplate( Map context ) throws Exception {
		String vm = getTemplate();

		if ( vm == null || (vm=vm.trim()).length()==0 ) {
//            String configId = (String) pageContext.getAttribute("configId");
//            String configFile = (String) pageContext.getAttribute("configFile");
//
//            System.out.println("--------------------------------------");
//            System.out.println("configId=" + configId + ", configFile=" + configFile);
//            System.out.println("vm=" + vm);
//
//            HttpServletRequest request = (HttpServletRequest) this.pageContext.getRequest();
//            String quereyString = request.getQueryString();
//            String requestUrl = request.getRequestURL().toString();
//            System.out.println("requestUrl=" + requestUrl + ", quereyString=" + quereyString);
//			throw new Exception("Null Template Exception..." + vm);

            return;
		}

        if(vm.endsWith("none")){
            return;
        }
		
		String resourcePath = getPath();

		JspWriter out = pageContext.getOut();
		mergeContext( out, context, resourcePath, vm, charset );
	}
	

	private void mergeContext( Writer writer, Map context, String resourcePath, String vm, String charset) throws Exception 
	{
		HttpServletRequest request = (HttpServletRequest) this.pageContext.getRequest();
		
		Map requestMap = new HashMap();
    	requestMap.put("contentLength", String.valueOf(request.getContentLength()) );
    	requestMap.put("contentType", request.getContentType() );
    	requestMap.put("contextPath", request.getContextPath() );
    	requestMap.put("localAddr", request.getLocalAddr() );
    	requestMap.put("localName", request.getLocalName() );
    	requestMap.put("localPort", String.valueOf(request.getLocalPort()) );
    	requestMap.put("method", request.getMethod() );
    	requestMap.put("pathInfo", request.getPathInfo());
    	requestMap.put("protocol", request.getProtocol() );
    	requestMap.put("queryString", request.getQueryString() );
    	requestMap.put("remoteAddr", request.getRemoteAddr() );
    	requestMap.put("remoteHost", request.getRemoteHost() );
    	requestMap.put("remotePort", String.valueOf(request.getRemotePort()) );
    	requestMap.put("remoteUser", request.getRemoteUser() );
    	requestMap.put("sessionId", request.getSession().getId() );
    	requestMap.put("requestURI", request.getRequestURI() );
    	requestMap.put("requestURL", request.getRequestURL().toString() );
    	requestMap.put("serverName", request.getServerName() );
    	requestMap.put("serverPort", String.valueOf(request.getServerPort()) );
    	requestMap.put("servletPath", request.getServletPath() );
    	
    	context.put( "request", requestMap );
        //作用 在 ftl 中可以调用 java静态方法
        context.put("statics", BeansWrapper.getDefaultInstance().getStaticModels());


//		I18n i18n = I18n.getInstance();
//		context.put( "I18n", i18n );
//		context.put( "getMapValue", new GetMapValueMethod() );
//		context.put( "setMapValue", new SetMapValueMethod() );
//		context.put( "containsKey", new ContainsMapKeyMethod() );
//		context.put( "kooPager", new PagerDirective() );
//		context.put( "kooTree", new TreeDirective() );
//		context.put( "kooList", new ListDirective() );
//		context.put( "kooImageTextList", new ImageTextListDirective() );
//		context.put( "kooTable", new TableDirective() );
//		context.put( "kooTr", new TrDirective() );
//		context.put( "kooBlock", new BlockDirective() );
//		context.put( "kooDraggedWin", new DraggedWinDirective() );
//		context.put( "kooPopWin", new PopWinDirective() );
//		context.put( "kooTab", new TabDirective() );
//		context.put( "kooNav", new NavDirective() );
//
//    	if ( request.getAttribute(TemplateSelector.REQ_ATTR_STATICS)==null ) {
//    		request.setAttribute(TemplateSelector.REQ_ATTR_STATICS, BeansWrapper.getDefaultInstance().getStaticModels());
//    	}
    	
		Properties prop = new Properties();
		prop.setProperty( "path", resourcePath );
		prop.setProperty( "encode", charset );
		prop.setProperty( "number_format", "#" );
		TemplateConfiguration.mergeTemplate( prop, vm, context, writer );
	}
	
	
	
	public String getTemplate() {
		return template;
	}
	
	
	public void setTemplate(String template) {
		this.template = template;
	}


	public String getCharset() {
		return charset;
	}


	public void setCharset(String charset) {
		this.charset = charset;
	}


	public String getPath() {
		return path;
	}


	public void setPath(String path) {
		this.path = path;
	}
	
	
	
	
}
