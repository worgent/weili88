<%@ page import="base.util.BaseIntUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.xiaoshuocity.com/commonTag" prefix="commonTag" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <title>新增管理员</title>
    <link href="/css/table.css" rel="stylesheet" type="text/css">
    <link href="/css/button.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/jquery/jquery-1.8.1.min.js"></script>
    <script src="/js/layer/layer.min.js"></script>
</head>

<body>

<form method="post" action="#" name="f1" id="f1">
    <table class="infoTable" width="80%" cellspacing="0" cellpadding="0">
        <caption>新增管理员</caption>
        <tbody>
        <tr>
            <td style="width: 150px;text-align: right;"  >
                登录帐号:
            </td>
            <td style="text-align: left;padding-left:10px;">
                <input type="text" name="englishName" size="50"/>
            </td>
        </tr>
        <tr>
            <td style="width: 150px;text-align: right;">
                密码:
            </td>
            <td style="text-align: left;padding-left:10px;">
                <input type="text" name="pwd" size="50"/>
            </td>
        </tr>
        <tr>
            <td style="width: 150px;text-align: right;"  >
                真实姓名:
            </td>
            <td style="text-align: left;padding-left:10px;">
                <input type="text" name="chineseName" size="50"/>
            </td>
        </tr>
        <%--<tr>--%>
            <%--<td style="width: 150px;text-align: right;">--%>
                <%--拥有角色:--%>
            <%--</td>--%>
            <%--<td style="text-align: left;padding-left:10px;    ">--%>
                <%--<input type="checkbox" name="role" value="1"/>普通管理员--%>
                <%--&nbsp;&nbsp;&nbsp;&nbsp;--%>
                <%--<input type="checkbox" name="role" value="2"/>财务管理员--%>
            <%--</td>--%>
        <%--</tr>--%>

        <tr style="height:40px;">
            <td style="width: 150px;text-align: right;">

            </td>
            <td style="text-align: left;padding-left:10px;">
                <input id="b1" type="button" value="提交" class="button blue medium"
                       style="cursor: pointer;"/></td>
            </td>
        </tr>

        </tbody>
    </table>
</form>
<script type="text/javaScript">
    var url = '/gly/user/gly_insert.do';
    $(document).ready(function () {
        $("#b1").click(function(e) {
            jQuery.post(url, $("#f1").serialize(), function(jsonobj) {
                if (jsonobj.code == "200") {
                    layer.msg("申请成功");
                    self.opener.location.reload();
                    window.close();
                } else {
                    layer.alert("操作失败了:" + jsonobj.msg);
                }
            }, "json");
        });
    });
</script>
</body>
</html>