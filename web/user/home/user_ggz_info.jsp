<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.xiaoshuocity.com/commonTag" prefix="commonTag" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <link href="/css/list.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/css/page.css"/>
    <link href="/css/form.css" rel="stylesheet" type="text/css">
    <title>账户信息</title>
</head>

<body>
<div id="Holder">
    <div id="MainPage">
        <jsp:include page="/user/common/head.jsp">
            <jsp:param name="p" value="0"/>
        </jsp:include>

        <div id="MainBody" class="layout-full-width">
            <jsp:include page="left.jsp">
                <jsp:param name="p" value="1"/>
            </jsp:include>

            <div id="CooperationMain" class="layout-main box clear-fix" style="height:500px;">
                <%--<div class="layout-block-header">--%>

                    <%--&lt;%&ndash;<h2><a style="color: #333" href="../user/gly_insert.jsp" title="新增管理员">新增管理员</a>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</h2>&ndash;%&gt;--%>
                <%--</div>--%>
                <div class="layout-block-content" style="float:right;padding:10px;">
                    <button id="b1" class="button orange medium">修改密码</button>
                </div>

                <style>
                    #accountTable tr{height: 40px;}
                </style>

                <table style="margin-top:25px;" class="formTable" id="accountTable" width="60%" border="0" cellspacing="0" cellpadding="0">
                    <tbody>
                        <tr>
                            <td style="width: 150px;text-align: right;"  >
                                登录帐号 :
                            </td>
                            <td style="text-align: left;padding-left:10px;">
                                ${user.englishName}
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 150px;text-align: right;">
                                真实姓名:
                            </td>
                            <td style="text-align: left;padding-left:10px;    ">
                                ${user.chineseName}
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 150px;text-align: right;">
                                手机号:
                            </td>
                            <td style="text-align: left;padding-left:10px;    ">
                                ${user.phone}
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 150px;text-align: right;">
                                QQ:
                            </td>
                            <td style="text-align: left;padding-left:10px;    ">
                                ${user.qq}
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 150px;text-align: right;">
                                Email:
                            </td>
                            <td style="text-align: left;padding-left:10px;    ">
                                ${user.email}
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 150px;text-align: right;">
                                累计充值:
                            </td>
                            <td style="text-align: left;padding-left:10px;    ">
                                ${userGgz.moneyInput}
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 150px;text-align: right;">
                                累计消费:
                            </td>
                            <td style="text-align: left;padding-left:10px;    ">
                                ${userGgz.moneyOutput}
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 150px;text-align: right;">
                                消费锁定:
                            </td>
                            <td style="text-align: left;padding-left:10px;    ">
                                ${userGgz.moneyOutputLock}
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 150px;text-align: right;">
                                账户余额:
                            </td>
                            <td style="text-align: left;padding-left:10px;    ">
                                ${userGgz.leftMoney}
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 150px;text-align: right;">
                                注册时间:
                            </td>
                            <td style="text-align: left;padding-left:10px;    ">
                                <fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                            </td>
                        </tr>
                    </tbody>
                </table>

            </div>
        </div>

        <jsp:include page="/user/common/foot.jsp"/>

    </div>
</div>
<script type="text/javascript">
$(document).ready(function () {
    $("#b1").click(function(e) {
        var url = "/login/user_pwd.jsp";
        openDialog(url, 800, 450, "yes");
    });
});
</script>

</body>
</html>