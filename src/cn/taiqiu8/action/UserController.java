//package cn.taiqiu8.action;
//
//import base.MD5;
//import base.bean.PageBean;
//import base.constant.SystemGlobalConstant;
//import base.result.ResultBean;
//import base.result.ResultFactory;
//import base.util.*;
//import cn.weili88.enums.UserStatusEnum;
//import cn.weili88.enums.UserTypeEnum;
//import cn.weili88.enums.UserWxzRzStatusEnum;
//import cn.weili88.model.*;
//import cn.weili88.service.AdOrderService;
//import cn.weili88.service.AdService;
//import cn.weili88.service.MessageService;
//import cn.weili88.service.UserService;
//import cn.weili88.util.EmailUtil;
//import org.apache.commons.logging.Log;
//import org.apache.commons.logging.LogFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.List;
//
///**
// * User: liuwentao
// * Time: 15-1-16 上午11:56
// */
//@Controller
//public class UserController extends BaseController{
//    private static final Log log = LogFactory.getLog(UserController.class);
//
//    @Autowired
//    private UserService userService;
//    @Autowired
//    private AdService adService;
//    @Autowired
//    private AdOrderService adOrderService;
//    @Autowired
//    private MessageService messageService;
//
//    //------------------------------------------read------------------------------
//
//    /**
//     *
//     * @param request
//     * @param response
//     * @return
//     * @throws Exception
//     */
//    @RequestMapping(value = "/gly/user/user_list", method = RequestMethod.GET)
//    public String user_list(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        User user = super.getLoginUser(request);
//        if (!user.isGly()) {
//            response.sendRedirect("/index.jsp");
//            return null;
//        }
//
//        int type = BaseIntUtil.getInt(request, "type");
//
//        List<User> list = new ArrayList<User>();
//        if(type == UserTypeEnum.GLY.getValue()){
//            list = userService.getGlyList();
//            request.setAttribute("list", list);
//            return "/gly/user/gly_list";
//        }
//
//        PageBean pageBean = BasePageBeanUtil.getPageBean(request);
//        list = userService.getList((short)type,pageBean);
//        request.setAttribute("list", list);
//        request.setAttribute("pageBean", pageBean);
//
//        //广告主
//        if(type == UserTypeEnum.GGZ.getValue()){
//            return "/gly/user/ggz_list";
//        }
//
//        //微信主
//        return "/gly/user/wxz_list";
//    }
//
//    /**
//     *
//     * @param request
//     * @param response
//     * @return
//     * @throws Exception
//     */
//    @RequestMapping(value = "/gly/user/detail", method = RequestMethod.GET)
//    public String wxz_detail(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        User user = super.getLoginUser(request);
//        if (!user.isGly()) {
//            response.sendRedirect("/index.jsp");
//            return null;
//        }
//
//        int id = BaseIntUtil.getInt(request, "id");
//        User user2 = userService.selectById(id);
//        request.setAttribute("user2", user2);
//
//        if(user2.isWxz()){
//            UserWxz userWxz = userService.getUserWxz(user2.getId());
//            request.setAttribute("userWxz", userWxz);
//
//            List<AdOrder> adOrderList = adOrderService.getForWxz(id);
//            request.setAttribute("adOrderList", adOrderList);
//            return "/gly/user/wxz_detail";
//        }else if(user2.isGgz()){
//            UserGgz userGgz = userService.getUserGgz(user2.getId());
//            request.setAttribute("userGgz", userGgz);
//
//            List<Ad> adList = adService.getForGgz(id);
//            request.setAttribute("adList", adList);
//
//            return "/gly/user/ggz_detail";
//        }
//
//        request.setAttribute("error","id=" + id + "既不是广告主也不是微信主");
//        return "/error";
//    }
//
//    @RequestMapping(value = "/gly/renzheng/wxz_rz_list", method = RequestMethod.GET)
//    public String wxz_rz_list(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        User user = super.getLoginUser(request);
//        if (!user.isGly()) {
//            response.sendRedirect("/index.jsp");
//            return null;
//        }
//        int status = BaseIntUtil.getInt(request, "status");
//        PageBean pageBean = BasePageBeanUtil.getPageBean(request);
//
//List<UserWxzRz> list = userService.getPageUserWxzRz((short)status,pageBean);
//        request.setAttribute("list", list);
//        request.setAttribute("pageBean", pageBean);
//
//        //微信主
//        return "/gly/renzheng/wxz_rz_list";
//    }
//
//
//    //------------------------------------------remove------------------------------
//
//    /**
//     *
//     * @param request
//     * @param response
//     */
//    @RequestMapping(value = "/gly/user/ajax_status", method = RequestMethod.POST)
//    public void ajax_status(HttpServletRequest request, HttpServletResponse response) {
//        User user = super.getLoginUser(request);
//        if(!user.isGly()){
//            BaseResponseUtil.responseAjaxJson(response, "403", "不是管理员不能进行此操作");
//            return;
//        }
//        int id = BaseIntUtil.getInt(request, "id");
//        User user2 = userService.selectById(id);
//        if(BaseIntUtil.isBlank(user2.getId())){
//            BaseResponseUtil.responseAjaxJson(response, "404", "记录不存在");
//            return;
//        }
//
//        ResultBean resultBean = userService.updateStatus(id);
//        BaseResponseUtil.responseAjaxJson(response, resultBean.getCode(), resultBean.getMsg());
//    }
//
//    @RequestMapping(value = "/gly/user/gly_insert", method = RequestMethod.POST)
//    public void gly_insert(HttpServletRequest request, HttpServletResponse response) {
//        User user = super.getLoginUser(request);
//        if(!user.isGly()){
//            BaseResponseUtil.responseAjaxJson(response, "403", "不是管理员不能进行此操作");
//            return;
//        }
//        String englishName = request.getParameter("englishName");
//        String chineseName = request.getParameter("chineseName");
//        String pwd = request.getParameter("pwd");
//        if(BaseStringUtil.isBlank(englishName)){
//            BaseResponseUtil.responseAjaxJson(response, "500", "登录帐户字段不能为空");
//            return;
//        }
//        if(BaseStringUtil.isBlank(chineseName)){
//            BaseResponseUtil.responseAjaxJson(response, "500", "真实姓名字段不能为空");
//            return;
//        }
//        if(BaseStringUtil.isBlank(pwd)){
//            BaseResponseUtil.responseAjaxJson(response, "500", "密码字段不能为空");
//            return;
//        }
//        englishName = englishName.trim();
//        chineseName = chineseName.trim();
//        pwd = pwd.trim();
//
//        User user2 = userService.selectByEnglishName(englishName,UserTypeEnum.GLY.getValue());
//        if(user2!=null){
//            BaseResponseUtil.responseAjaxJson(response, "user", "管理员身份的 " + englishName + "已经存在,请换个登录帐户");
//            return;
//        }
//
//        //插入user表
//        user2 = new User();
//        user2.setEnglishName(englishName);
//        user2.setPwd(new MD5().calcMD5(pwd));
//        user2.setChineseName(chineseName);
//        user2.setType(UserTypeEnum.GLY.getValue());
//
//        user2 = userService.insert(user2);
//
//        Integer userId2 = user2.getId();
//
//        //插入 user_admin 表
//        UserAdmin userAdmin = new UserAdmin();
//        userAdmin.setUserId(userId2);
//        userAdmin.setRoleCommon((short) 1);
//        userAdmin.setRoleFinancial((short)1);
//        userAdmin.setRoleSuper((short)1);
//
//        userService.insert(userAdmin);
//
//        ResultBean resultBean = ResultFactory.getSuccessResultBean();
//        BaseResponseUtil.responseAjaxJson(response, resultBean.getCode(), resultBean.getMsg());
//    }
//
//    /**
//     *
//     * @param request
//     * @param response
//     */
//    @RequestMapping(value = "/user/user/pwd_update", method = RequestMethod.POST)
//    public void pwd_update(HttpServletRequest request, HttpServletResponse response) {
//        User user = super.getLoginUser(request);
//        Integer userId = user.getId();
//        String pwdOld = request.getParameter("pwd_old");
//        String pwdNew = request.getParameter("pwd_new");
//
//        ResultBean resultBean = userService.updatePwd(userId,pwdOld,pwdNew);
//        BaseResponseUtil.responseAjaxJson(response, resultBean.getCode(), resultBean.getMsg());
//    }
//
//    @RequestMapping(value = "/user/user/logout", method = RequestMethod.POST)
//    public void logout(HttpServletRequest request, HttpServletResponse response) {
//        request.getSession().invalidate();
//        BaseResponseUtil.responseAjaxJsonOk(response);
//    }
//
//    @RequestMapping(value = "/login/gly", method = RequestMethod.POST)
//    public void login_gly(HttpServletRequest request, HttpServletResponse response) {
//        boolean randImg = BaseRequestUtil.validateRequestRandImg(request, response);
//        if (!randImg) {
//            return;
//        }
//        String userName = request.getParameter("userName");
//        String pwd = request.getParameter("pwd");
//
//        if (BaseStringUtil.isBlank(userName)) {
//            BaseResponseUtil.responseAjaxJson(response, SystemGlobalConstant.ERROR_USERNAME, "用户名不能为空");
//            return;
//        }
//        if (BaseStringUtil.isBlank(pwd)) {
//            BaseResponseUtil.responseAjaxJson(response, SystemGlobalConstant.ERROR_PWD, "密码不能为空");
//            return;
//        }
//
//        User user = userService.selectByEnglishName(userName, UserTypeEnum.GLY.getValue());
//        if(user!=null){
//            String pwdDb = user.getPwd();
//            if(new MD5().calcMD5(pwd).equals(pwdDb)){
//                request.getSession().setAttribute("user", user);
//                request.getSession().setAttribute("CKFinder_UserRole", "admin");
//
//                BaseResponseUtil.responseAjaxJsonOk(response);
//                return;
//            }
//        }
//        BaseResponseUtil.responseAjaxJson(response, SystemGlobalConstant.ERROR_USERNAME_PWD, "用户名密码错误");
//    }
//
//    @RequestMapping(value = "/login/wxz", method = RequestMethod.POST)
//    public void login_wxz(HttpServletRequest request, HttpServletResponse response) {
//        boolean randImg = BaseRequestUtil.validateRequestRandImg(request, response);
//        if (!randImg) {
//            return;
//        }
//        String userName = request.getParameter("userName");
//        String pwd = request.getParameter("pwd");
//
//        if (BaseStringUtil.isBlank(userName)) {
//            BaseResponseUtil.responseAjaxJson(response, SystemGlobalConstant.ERROR_USERNAME, "用户名不能为空");
//            return;
//        }
//        if (BaseStringUtil.isBlank(pwd)) {
//            BaseResponseUtil.responseAjaxJson(response, SystemGlobalConstant.ERROR_PWD, "密码不能为空");
//            return;
//        }
//
//        User user = userService.selectByEnglishName(userName, UserTypeEnum.WXZ.getValue());
//        if(user!=null){
//            String pwdDb = user.getPwd();
//            if(new MD5().calcMD5(pwd).equals(pwdDb)){
//                request.getSession().setAttribute("user", user);
//
//                BaseResponseUtil.responseAjaxJsonOk(response);
//                return;
//            }
//        }
//        BaseResponseUtil.responseAjaxJson(response, SystemGlobalConstant.ERROR_USERNAME_PWD, "用户名密码错误");
//    }
//
//    @RequestMapping(value = "/login/ggz", method = RequestMethod.POST)
//    public void login_ggz(HttpServletRequest request, HttpServletResponse response) {
//        String userName = request.getParameter("userName");
//        String pwd = request.getParameter("pwd");
//
//        if (BaseStringUtil.isBlank(userName)) {
//            BaseResponseUtil.responseAjaxJson(response, SystemGlobalConstant.ERROR_USERNAME, "用户名不能为空");
//            return;
//        }
//        if (BaseStringUtil.isBlank(pwd)) {
//            BaseResponseUtil.responseAjaxJson(response, SystemGlobalConstant.ERROR_PWD, "密码不能为空");
//            return;
//        }
//
//        User user = userService.selectByEnglishName(userName, UserTypeEnum.GGZ.getValue());
//        if(user!=null){
//            String key = user.getEnglishName()+"_" + user.getPwd() + "_liuwentao";
//            key = new MD5().calcMD5(key);
//
//            String key2 = BaseCookieUtil.getCookieValue(request, "userName_key");
//
//            String pwdDb = user.getPwd();
//
//            if(key.equals(key2) || new MD5().calcMD5(pwd).equals(pwdDb)){
//                String remember = request.getParameter("remember");
//                if("1".equals(remember)){
//                    //记住密码
//                    BaseCookieUtil.setCookie(request, response, "userName", user.getEnglishName(), -1);
//                    BaseCookieUtil.setCookie(request, response, "userName_key", key, -1);
//                }else{
//                    BaseCookieUtil.deleteCookie(request, response, "userName");
//                    BaseCookieUtil.deleteCookie(request, response, "userName_key");
//                }
//
//                request.getSession().setAttribute("user", user);
//                BaseResponseUtil.responseAjaxJsonOk(response);
//                return;
//            }
//        }
//        BaseResponseUtil.responseAjaxJson(response, SystemGlobalConstant.ERROR_USERNAME_PWD, "用户名密码错误");
//    }
//
//    /**
//     *
//     * @param request
//     * @param response
//     */
//    @RequestMapping(value = "/guest/ggz_insert", method = RequestMethod.POST)
//    public void ggz_insert(HttpServletRequest request, HttpServletResponse response) {
//        String englishName = request.getParameter("englishName");
//        String pwd = request.getParameter("pwd");
//        String email = request.getParameter("email");
//        String phone = request.getParameter("phone");
//        String qq = request.getParameter("qq");
//        if(BaseStringUtil.isBlank(englishName)){
//            BaseResponseUtil.responseAjaxJson(response, "500", "登录帐户字段不能为空");
//            return;
//        }
//        if(BaseStringUtil.isBlank(pwd)){
//            BaseResponseUtil.responseAjaxJson(response, "500", "密码字段不能为空");
//            return;
//        }
//        if(BaseStringUtil.isBlank(email)){
//            BaseResponseUtil.responseAjaxJson(response, "500", "email字段不能为空");
//            return;
//        }
//        if(BaseStringUtil.isBlank(phone)){
//            BaseResponseUtil.responseAjaxJson(response, "500", "电话字段不能为空");
//            return;
//        }
//        if(BaseStringUtil.isBlank(qq)){
//            BaseResponseUtil.responseAjaxJson(response, "500", "qq字段不能为空");
//            return;
//        }
//        englishName = englishName.trim();
//        pwd = pwd.trim();
//
//        User user = userService.selectByEnglishName(englishName,UserTypeEnum.GGZ.getValue());
//        if(user!=null){
//            BaseResponseUtil.responseAjaxJson(response, "user", englishName + "已经存在,请换个会员名");
//            return;
//        }
//
//        //插入user表
//        user = new User();
//        user.setEnglishName(englishName);
//        user.setPwd(pwd);
//        user.setType(UserTypeEnum.GGZ.getValue());
//        user.setPhone(phone);
//        user.setEmail(email);
//        user.setQq(qq);
//        user.setStatus(UserStatusEnum.DJH.getValue());
//
//        user = userService.insert(user);
//
//        Integer userId2 = user.getId();
//
//        //插入 user_admin 表
//        UserGgz userGgz = new UserGgz();
//        userGgz.setUserId(userId2);
//
//        userService.insert(userGgz);
//
//        request.getSession().setAttribute("email", user.getEmail());
//
//        try {
//            String content = "请在24小时之内,点击下面链接,完成激活<br> " + EmailUtil.getActiveEmailUrl(user.getId());
//            MailSendUtil.SendMailQM(email, "微利广告主账户激活", content);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        ResultBean resultBean = ResultFactory.getSuccessResultBean();
//        BaseResponseUtil.responseAjaxJson(response, resultBean.getCode(), resultBean.getMsg());
//    }
//
//    @RequestMapping(value = "/guest/wxz_insert", method = RequestMethod.POST)
//    public void wxz_insert(HttpServletRequest request, HttpServletResponse response) {
//        String englishName = request.getParameter("englishName");
//        String chineseName = request.getParameter("chineseName");
//        int userId = BaseIntUtil.getInt(request, "userId");
////        String pwd = request.getParameter("pwd");
//        String email = request.getParameter("email");
//        String phone = request.getParameter("phone");
//        String qq = request.getParameter("qq");
//        if(BaseStringUtil.isBlank(englishName)){
//            BaseResponseUtil.responseAjaxJson(response, "500", "微信号字段不能为空");
//            return;
//        }
//        if(BaseStringUtil.isBlank(chineseName)){
//            BaseResponseUtil.responseAjaxJson(response, "500", "微信名称字段不能为空");
//            return;
//        }
////        if(BaseStringUtil.isBlank(pwd)){
////            BaseResponseUtil.responseAjaxJson(response, "500", "密码字段不能为空");
////            return;
////        }
//        if(BaseStringUtil.isBlank(email)){
//            BaseResponseUtil.responseAjaxJson(response, "500", "email字段不能为空");
//            return;
//        }
//        if(BaseStringUtil.isBlank(phone)){
//            BaseResponseUtil.responseAjaxJson(response, "500", "电话字段不能为空");
//            return;
//        }
//        if(BaseStringUtil.isBlank(qq)){
//            BaseResponseUtil.responseAjaxJson(response, "500", "qq字段不能为空");
//            return;
//        }
//        englishName = englishName.trim();
////        pwd = pwd.trim();
//
//        User user = userService.selectByEnglishName(englishName,UserTypeEnum.WXZ.getValue());
//        if(user==null){
//            BaseResponseUtil.responseAjaxJson(response, "user", englishName + "不存在,请确认通过微信第三方平台进行登录");
//            return;
//        }
//
//
////        user.setEnglishName(englishName);
////        user.setChineseName(chineseName);
////        user.setPwd(pwd);
////        user.setType(UserTypeEnum.WXZ.getValue());
//        user.setPhone(phone);
//        user.setEmail(email);
//        user.setQq(qq);
//        user.setStatus(UserStatusEnum.DRZ.getValue());
//        user.setStatus(UserStatusEnum.ENABLE.getValue());
//        userService.update(user);
//
////        Integer userId2 = user.getId();
////
////        //插入 user_admin 表
////        UserWxz userWxz = new UserWxz();
////        userWxz.setUserId(userId2);
////
////        userService.insert(userWxz);
//
//        request.getSession().setAttribute("user", user);
//
//        ResultBean resultBean = ResultFactory.getSuccessResultBean();
//        BaseResponseUtil.responseAjaxJson(response, resultBean.getCode(), resultBean.getMsg());
//    }
//
//    @RequestMapping(value = "/guest/wxz_sh_insert", method = RequestMethod.POST)
//    public void wxz_sh_insert(HttpServletRequest request, HttpServletResponse response) {
//        Integer userId = super.getLoginUserId(request);
//        if(BaseIntUtil.isBlank(userId)){
//            BaseResponseUtil.responseAjaxJson(response, "403", "会话过期");
//            return;
//        }
//
//        int numFans = BaseIntUtil.getInt(request, "numFans");
//        int industryId = BaseIntUtil.getInt(request, "industryId");
//        int areaId = BaseIntUtil.getInt(request, "areaId");
//
//        if(numFans==0){
//            BaseResponseUtil.responseAjaxJson(response, "500", "粉丝数不能为空或者0");
//            return;
//        }
//        if(industryId==0){
//            BaseResponseUtil.responseAjaxJson(response, "500", "行业不能为空");
//            return;
//        }
//
//        UserWxzRz userWxzRz = new UserWxzRz();
//
//        userWxzRz.setUserId(userId);
//        userWxzRz.setNumFans(numFans);
//        userWxzRz.setIndustryId(industryId);
//        userWxzRz.setAreaId(areaId);
//        userWxzRz.setCreateTime(new Date());
//
//        userService.insertUserWxzRz(userWxzRz);
//
//        User user = userService.selectById(userId);
//        if(user.getStatus().equals(UserStatusEnum.DJH.getValue())){
//            user.setStatus(UserStatusEnum.DRZ.getValue());
//            userService.update(user);
//            request.getSession().setAttribute("user", user);
//        }
//
//        //发站内消息
//        messageService.insertWxzRz(user);
//
//        ResultBean resultBean = ResultFactory.getSuccessResultBean();
//        BaseResponseUtil.responseAjaxJson(response, resultBean.getCode(), resultBean.getMsg());
//    }
//
//    /**
//     *
//     * @param request
//     * @param response
//     * @return
//     */
//    @RequestMapping(value = "/active_email", method = RequestMethod.GET)
//    public String active_email(HttpServletRequest request, HttpServletResponse response) {
//        int userId = BaseIntUtil.getInt(request, "userId");
//        String time = request.getParameter("time");
//        String key = request.getParameter("key");
//
//        Date time2 = BaseDateUtil.getDateByFormatString(time, "yyyy-MM-dd");
//        String key2 = EmailUtil.getKey(time,userId);
//
//        ResultBean resultBean = new ResultBean();
//
//        if (BaseDateUtil.getDiffDay(time2, new Date()) > 1) {
//            resultBean.setMsg("链接过期");
//            resultBean.setCode("201");
//        } else if (!key2.equals(key)) {
//            resultBean.setMsg("链接错误");
//            resultBean.setCode("202");
//        } else {
//            userService.activeUser(userId);
//            resultBean.setCode("200");
//        }
//        request.setAttribute("resultBean", resultBean);
//        return "/success";
//    }
//
//
//
//    /**
//     * @param request
//     * @param response
//     * @return
//     * @throws Exception
//     */
//    @RequestMapping(value = "/gly/renzheng/sh_load", method = RequestMethod.GET)
//    public String sh_load(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        User user = super.getLoginUser(request);
//        if (!user.isGly()) {
//            request.setAttribute("error", "只有管理员才能进行只操作");
//            return "/error";
//        }
//
//        int id = BaseIntUtil.getInt(request, "id");
//
//        UserWxzRz userWxzRz = userService.getUserWxzRz(id);
//        Integer userId = userWxzRz.getUserId();
//
//        User user2 = userService.selectById(userId);
//        UserWxz userWxz = userService.getUserWxz(userId);
//
//        request.setAttribute("user2", user2);
//        request.setAttribute("userWxz", userWxz);
//        request.setAttribute("userWxzRz", userWxzRz);
//
//        return "/gly/renzheng/sh_load";
//    }
//
//    @RequestMapping(value = "/gly/renzheng/sh", method = RequestMethod.POST)
//    public void sh(HttpServletRequest request, HttpServletResponse response) {
//        User user = super.getLoginUser(request);
//        if(!user.isGly()){
//            BaseResponseUtil.responseAjaxJson(response, "403", "不是管理员不能进行此操作");
//            return;
//        }
//        int id = BaseIntUtil.getInt(request, "id");
//        int status = BaseIntUtil.getInt(request, "status");
//
//        UserWxzRz userWxzRz = userService.getUserWxzRz(id);
//        if(status== 2){
//            //认证通过
//            userWxzRz.setStatus(UserWxzRzStatusEnum.TG.getValue());
//        }else{
//            //认证不通过
//            userWxzRz.setStatus(UserWxzRzStatusEnum.BTG.getValue());
//        }
//
//        messageService.insertWxzRzSh(userWxzRz.getUserId(),userWxzRz.getStatus());
//
//        ResultBean resultBean = userService.updateUserWxzRz(userWxzRz);
//        BaseResponseUtil.responseAjaxJson(response, resultBean.getCode(), resultBean.getMsg());
//    }
//
//
//}
