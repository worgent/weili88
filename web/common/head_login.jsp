<%@ page import="base.util.BaseIntUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="/js/slider_jquery.js"></script>
<script language="javascript">
    $(document).ready(function() {
        $.featureList(
                $(".fmenu li"),
                $("#focus_right li"), {
                    start_item    :    0
                }
        );
    });

    function commit(){
        var userName=document.getElementById("userName");
        var pwd=document.getElementById("pwd");

        if(userName.value==''){
            layer.alert("用户名不能为空")
            return;
        }
        if(pwd.value==''){
            layer.alert("密码不能为空")
            return;
        }
        var url = '/login/ggz.do';
        jQuery.post(url, $("#f1").serialize(), function(jsonobj) {
            if (jsonobj.code == "200") {
                layer.msg(jsonobj.msg);
                window.location="/user/home/index.do";
            } else {
                layer.msg(jsonobj.msg);
            }
        }, "json");
    }
</script>
<div id="banner" class="banner0">
    <div class="w1200 mto posi clearfix">
        <div class="login_nav" id="login">
            <div class="loginFunc">
                <div class="loginFuncDynPw">微信主</div>
                <div class="loginFuncNormal">广告主</div>
            </div>
            <div class="loginForm">
                <form method="post" action="index.jsp#" onsubmit="return Dcheck();">
                    <div style="padding-top:50px;padding-left:25px;">

<%
    String url = "https://mp.weixin.qq.com/cgi-bin/componentloginpage?component_appid=wx5580aec4eb7c013a&pre_auth_code=" + application.getAttribute("pre_auth_code") + "&redirect_uri=http://www.taiqiu8.cn/call_back/authorizer_access_token.jsp";
%>
                        
                        <a href="<%=url%>">
                            <img src="/img/wxdl.png"/>
                        </a>
                    </div>
                </form>
            </div>
            <div class="loginForm" style="display:none;">
                <form id="f1" name="f1" method="POST" action="#">
                    <div class="loginFormIpt showPlaceholder">
                        <b class="ico ico-uid"></b>
                        <input class="formIpt" tabindex="1" title="请输入帐号" name="userName" id="userName" maxlength="50"
                               autocomplete="off" type="text" value="${cookie.userName.value}">
                    </div>
                    <!-- 普通密码登录 -->
                    <div id="pwdInputLine" class="loginFormIpt showPlaceholder">
                        <b class="ico ico-pwd"></b>
                        <input class="formIpt" tabindex="2" title="请输入密码" id="pwd" name="pwd" type="password" value="${cookie.userName.value}">
                    </div>
                    <!-- 普通密码登录 -->
                    <div class="clear"></div>
                    <div id="normalLogin" style="display: block;">
                        <div class="loginFormCheck">
                            <div id="lfAutoLogin" class="loginFormCheckInner">

                                <label class="label_left" title="选中后 一月内不用再次登录 网吧或公共计算机请勿选">
                                    <input name="remember" value="1" id="cookietime"
                                           type="checkbox"><label for="cookietime">记住用户名</label></label>
                            </div>

                        </div>
                        <div class="loginFormBtn">
                            <input class="login_btn btn-main btn-login" name="submit" value=" 登 录 " type="button" onclick="commit();">
                            <a id="lfBtnReg" class="login_btn btn-side btn-reg"
                               href="zhuce.jsp">立即注册</a>
                        </div>
                    </div>
                    <!-- 动态密码登录 -->
                </form>

            </div>
            <div class="lophone">
                <%--<script src="js/phone.js"></script>--%>
                <span style="font-weight:bold; color:#ff0000;">4006-876-308</span></div>
        </div>

        <script language="javascript">
            $('.loginFunc div').click(function() {
                var i = $('.loginFunc div').index(this);
                if (i == 1) {
                    $("#login").addClass("tab-2");
                } else {
                    $("#login").removeClass("tab-2");
                }
                $(".loginForm").hide().eq(i).show();
            })
            ;

            <c:if test="${not empty param.type}">
            $('.loginFuncNormal').click();
            </c:if>
        </script>
        <div class="focus_right">
            <div class="focusdiv fr" id="focus_right">
                <ul class="focus_list">
                    <li style="display: list-item;"><a
                            href="index.jsp#" title=""
                            target="_blank"><img class="png" src="/img/banner/index_banner0.jpg"></a></li>
                    <li style="display: none;"><a
                            href="index.jsp#" title=""
                            target="_blank"><img class="png" src="/img/banner/index_banner1.jpg"></a></li>
                    <li style="display: none;"><a
                            href="index.jsp#" title=""
                            target="_blank"><img class="png" src="/img/banner/index_banner2.jpg"></a></li>
                    <li style="display: none;"><a
                            href="index.jsp#" title=""
                            target="_blank"><img class="png" src="/img/banner/index_banner3.jpg"></a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="inner">
        <div class="fmenu">
            <ul class="btn">
                <li></li>
                <li class=""></li>
                <li class=""></li>
                <li class=""></li>
            </ul>
        </div>
    </div>
</div>
