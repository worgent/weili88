<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.xiaoshuocity.com/commonTag" prefix="commonTag" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <title>修改密码</title>
    <link href="/css/table.css" rel="stylesheet" type="text/css">
    <link href="/css/button.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/jquery/jquery-1.8.1.min.js"></script>
    <script src="/js/layer/layer.min.js"></script>
</head>
<style>
    input {
        height: 22px;
    }
</style>
<body>
<form method="post" action="user_pwd.jsp#" name="f1" id="f1">
<table class="infoTable" width="100%" cellspacing="0" cellpadding="5">
    <caption>修改密码:</caption>
    <tbody>
    <tr>
        <td style="width: 150px;text-align: right;">
            原密码:
        </td>
        <td style="text-align: left;padding-left:10px;">
            <input type="password" name="pwd_old" id="pwd_old" size="50"/>
        </td>
    </tr>
    <tr>
        <td style="width: 150px;text-align: right;">
            新密码:
        </td>
        <td style="text-align: left;padding-left:10px;">
            <input type="password" name="pwd_new" id="pwd_new" size="50"/>
        </td>
    </tr>
    <tr>
        <td style="width: 150px;text-align: right;">
            确认新密码:
        </td>
        <td style="text-align: left;padding-left:10px;">
            <input type="password" name="pwd_new2" id="pwd_new2" size="50" height="30"/>
        </td>
    </tr>

    <tr style="height:60px;">
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
    var url = '/user/user/pwd_update.do';
    $(document).ready(function () {
        $("#b1").click(function(e) {
            if ($("#pwd_old").val() == '') {
                layer.msg('原密码不能为空!');
                return false;
            }
            if ($("#pwd_new").val() == '') {
                layer.msg('新密码不能为空!');
                return false;
            }
            if ($("#pwd_new2").val() == '') {
                layer.msg('确认新密码不能为空!');
                return false;
            }
            if ($("#pwd_new").val() != $("#pwd_new2").val()) {
                layer.msg('新密码和确认新密码不相等!');
                return false;
            }

            jQuery.post(url, $("#f1").serialize(), function(jsonobj) {
                if (jsonobj.code == "200") {
                    layer.msg("修改成功");
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