package cn.taiqiu8.action;

import cn.taiqiu8.factory.UserFactory;
import cn.taiqiu8.model.User;
import cn.taiqiu8.model.UserAssist;
import cn.taiqiu8.model.UserCustomer;
import cn.taiqiu8.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;

/**
 * User: liuwentao
 * Time: 15-1-20 上午9:31
 */
public class BaseController {
    @Autowired
    private UserService userService;

    /**
     * 得到登录用户
     *
     * @param request
     * @return
     */
    protected User getLoginUser(HttpServletRequest request) {
        User user = (User)request.getSession().getAttribute("user");
        if(user == null){
            user = new User();
        }
//        if(user!=null){
//            return user;
//        }
//        int userId = BaseIntUtil.getInt(request, "userId");
//        if (userId == 0) {
//            userId = 30;
//        }
//        user = UserFactory.selectById(userId);
//        request.getSession().setAttribute("user", user);
        return user;
    }

    /**
     * 得到登录用户ID
     *
     * @param request
     * @return
     */
    protected int getLoginUserId(HttpServletRequest request) {
        User user = this.getLoginUser(request);
        return user.getId();
    }

    protected UserCustomer getUserCustomer(HttpServletRequest request) {
        User user = getLoginUser(request);
        UserCustomer userCustomer = UserFactory.getUserCustomer(user.getId());
        return userCustomer;
    }

    protected UserAssist getUserAssist(HttpServletRequest request) {
        User user = getLoginUser(request);
        UserAssist userAssist = UserFactory.getUserAssist(user.getId());
        return userAssist;
    }

//    protected UserAdmin getUserAdmin(HttpServletRequest request) {
//        User user = getLoginUser(request);
//        UserAdmin userAdmin = UserFactory.getUserAdmin(user.getId());
//        return userAdmin;
//    }

}
