<%@ page import="demo.HttpsUtil" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="base.util.BaseDateUtil" %>
<%@ page import="java.util.Date" %>
<%@ page import="cn.taiqiu8.service.UserService" %>
<%@ page import="base.listener.MyApplicationContextAware" %>
<%@ page import="cn.taiqiu8.model.User" %>
<%@ page import="cn.taiqiu8.enums.UserStatusEnum" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://tag.weili88.com" prefix="w" %>

<%
    UserService userService = (UserService) MyApplicationContextAware.getBean("userService");
    
    System.out.println("5: authorizer_access_token ------------------------" + BaseDateUtil.getFormatSecond(new Date()));

    String component_access_token = (String) application.getAttribute("component_access_token");
    String url = "https://api.weixin.qq.com/cgi-bin/component/api_query_auth?component_access_token=" + component_access_token;

    String auth_code = request.getParameter("auth_code");
    String content = "{\"component_appid\":\"wx5580aec4eb7c013a\",\"authorization_code\":\"" + auth_code + "\"}";

    String authorization_info_Json = HttpsUtil.post(url,content);
    JSONObject jsonObject = JSONObject.fromObject(authorization_info_Json);

   if(jsonObject!=null && jsonObject.containsKey("authorization_info")){
       JSONObject jsonObject2 = jsonObject.getJSONObject("authorization_info");

       String authorizer_appid = jsonObject2.getString("authorizer_appid");
       System.out.println("<br>authorizer_appid=" + authorizer_appid);

       String authorizer_access_token = jsonObject2.getString("authorizer_access_token");
       System.out.println("<br>authorizer_access_token=" + authorizer_access_token);

       String expires_in = jsonObject2.getString("expires_in");
       System.out.println("<br>expires_in=" + expires_in);

       String authorizer_refresh_token = jsonObject2.getString("authorizer_refresh_token");
       System.out.println("<br>authorizer_refresh_token=" + authorizer_refresh_token);


       //获取授权方的公众号基本信息
       url = "https://api.weixin.qq.com/cgi-bin/component/api_get_authorizer_info?component_access_token=" + component_access_token;
       content = "{\"component_appid\":\"wx5580aec4eb7c013a\",\"authorizer_appid\":\"" + authorizer_appid + "\"}";
       String authorizer_info_Json = HttpsUtil.post(url,content);

       System.out.println("============================获得用户信息 begin ======================");
       // System.out.println("authorizer_info_Json=" + authorizer_info_Json);
       jsonObject = JSONObject.fromObject(authorizer_info_Json);


       JSONObject jsonObjectInfo = jsonObject.getJSONObject("authorizer_info");
        String chineseName = jsonObjectInfo.getString("nick_name");
        String englishName = jsonObjectInfo.getString("alias");
       System.out.println("chineseName=" + chineseName + ", englishName=" + englishName);

        User user = userService.insertWxzFirst(englishName,chineseName);
        session.setAttribute("user",user);

       System.out.println("user.getChineseName()=" + user.getChineseName() + ", user.getEnglishName()=" + user.getEnglishName());

       System.out.println("============================获得用户信息 end ======================");

       if(user.getStatus().equals(UserStatusEnum.DJH.getValue())){
           response.sendRedirect("/zhuce_wxz.jsp");
           return;
       }else{
           response.sendRedirect("/user/home/index.do");
           return;
       }


//       //获取累计用户数据
//       url = "https://api.weixin.qq.com/datacube/getusercumulate?access_token=" + authorizer_access_token;
//
//       auth_code = request.getParameter("auth_code");
//       content = "{\"begin_date\":\"2015-03-02\",\"end_date\":\"2015-03-03\"}";
//
//       String cumulate_user_Json = HttpsUtil.post(url,content);
//       jsonObject = JSONObject.fromObject(cumulate_user_Json);
//
//       if(jsonObject.containsKey("list")){
//           //能拿到数据
//
//       }else{
//           //不能拿到数据
//
//       }
   }

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">
    <title>微利：微聚利量</title>
    <meta name="description" content="微利：国内首家一站式广告平台，为您提供超10万种媒体推广资源，包括软文发稿,微信推广,微博推广,名人明星代言,自媒体营销,广告投放,网络广告,APP广告等等。">
    <meta name="keywords" content="软文发稿,微信推广,微博推广,自媒体营销,广告投放,网络广告,APP广告">
    <link href="/css/cwq_index.css" rel="stylesheet" media="screen" type="text/css">
    <script type="text/javascript" src="/js/jquery/jquery-1.8.1.min.js"></script>
    <script src="/js/layer/layer.min.js"></script>
</head>
<body>
<jsp:include page="/common/head.jsp"/>

<link rel="stylesheet" type="text/css" href="/css/register.css">
<link rel="stylesheet" type="text/css" href="/css/button.css"/>

<div class="blank20"></div>
<div class="tb-register">
    <div class="register">
        <div class="register-topbar">
            <div class="register-pos">
                当前位置: <a href="http://www.weili88.cn/">微利</a> » <a href="#">微信主</a>
            </div>
        </div>
        <div class="nav-content pt6 pb6">
        <div style="text-align:center;padding: 100px 0px;">
            <button id="b1" class="button blue bigrounded">已有微利平台账户,直接登录</button>
            <button id="b2" class="button green bigrounded">没有微利平台账户,现在注册</button>

        </div>
        </div>
    </div>
</div>
<div class="blank20"></div>

<jsp:include page="/common/foot.jsp"/>

<script type="text/javaScript">
    $("#b1").click(function(e) {
        var url = "/login/wxz.jsp";
        window.location=url;
    });
    $("#b2").click(function(e) {
        var url = "/zhuce_wxz.jsp";
        window.location=url;
    });
</script>

</body>
</html>