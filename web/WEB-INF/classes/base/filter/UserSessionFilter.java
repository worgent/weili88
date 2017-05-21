package base.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * User: liuwentao@kongzhong.com
 * Time: 12-6-26 上午10:51
 */
public class UserSessionFilter implements Filter {
	//登陆超时
	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest re=(HttpServletRequest)request;
		//session超时处理
		String path=re.getRequestURL().toString();
		HttpSession session = re.getSession();
		Object o= session.getAttribute("uid");
		if(o!=null||path.indexOf("login.tbao")>-1 || path.indexOf("againLogin.tbao")>-1 || path.indexOf("loginOut.tbao")>-1 || path.indexOf("toModifypassWord.tbao")>-1
				|| path.indexOf("updatePass.tbao")>-1 || path.indexOf("getInitPass.tbao")>-1){
			chain.doFilter(request, response);
		}else{
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+re.getContextPath();
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
		 	StringBuffer bf=new StringBuffer();//
		 	bf.append("<script type='text/javascript' src='"+basePath+"/js/com/login_dialog.js'></script>");
	    	bf.append("<script language='javascript'>");
	    	bf.append("againLogin();");
	    	bf.append("</script>");
			out.print(bf.toString());
		}
	}

	public void init(FilterConfig filterConfig) throws ServletException {
	}
}
