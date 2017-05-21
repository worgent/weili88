package base.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * User: liuwentao@kongzhong.com
 * Time: 12-6-26 上午10:50
 */
public class EncodingFilter implements Filter {

	/** 默认字符集	 */
	private String targetEncoding = "UTF-8";

	/** 过滤器上下文	 */
	public FilterConfig filterConfig;

    /**
     * 过滤器初始化方法
     * @param arg0
     * @throws ServletException
     */
	public void init(FilterConfig arg0) throws ServletException {
		this.filterConfig = arg0;
		this.targetEncoding = arg0.getInitParameter("encoding");
	}

    /**
     * 过滤器初始化方法
     * @param request
     * @param response
     * @param filterChain
     * @throws IOException
     * @throws ServletException
     */
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterChain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		req.setCharacterEncoding(targetEncoding);
		resp.setCharacterEncoding(targetEncoding);
		filterChain.doFilter(req, resp);
	}

    /**
     * 过滤器实例销毁方法
     */
	public void destroy() {
		this.filterConfig = null;
	}

    /**
     * 加载上下文
     * @param filterConfig
     */
	public void setFilterConfig(final FilterConfig filterConfig) {
		this.filterConfig = filterConfig;
	}
}
