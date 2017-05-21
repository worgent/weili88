package cn.taiqiu8.filter;

//import cn.taiqiu8.enums.UserStatusEnum;
//import cn.taiqiu8.enums.UserTypeEnum;
//import cn.taiqiu8.model.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * User: liuwentao
 * Time: 15-2-4 下午12:55
 */
public class UserFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpSession httpSession = httpServletRequest.getSession();

//        User user = (User) httpSession.getAttribute("user");
//        if (user == null) {
//            HttpServletResponse httpServletResponse = (HttpServletResponse) response;
//            httpServletResponse.sendRedirect("/index.jsp");
//            return;
//        }
//
//        if(user.getType().equals(UserTypeEnum.WXZ.getValue())){
//            if(user.getStatus().equals(UserStatusEnum.DJH.getValue())){
//                HttpServletResponse httpServletResponse = (HttpServletResponse) response;
//                httpServletResponse.sendRedirect("/wxz_sh_insert.jsp");
//                return;
//            }
//        }

        chain.doFilter(request, response);
    }

    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

}
