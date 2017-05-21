<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.xiaoshuocity.com/commonTag" prefix="commonTag" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <title>粉丝数认证审核</title>
    <link href="/css/table.css" rel="stylesheet" type="text/css">
    <link href="/css/button.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/css/page.css"/>
    <script type="text/javascript" src="/js/jquery/jquery-1.8.1.min.js"></script>
    <script language="javascript" src='/js/plug-in/My97DatePicker/WdatePicker.js'></script>
    <script src="/js/layer/layer.min.js"></script>
</head>

<body>


<form method="post" action="#" name="f1" id="f1">
    <table class="infoTable" width="80%" cellspacing="0" cellpadding="0">
        <tbody>
        <tr>
            <th>
                微信名称 :
            </th>
            <td style="text-align: left;padding-left:10px; ">
                ${user2.chineseName}
            </td>
            <th>
                微信帐号 :
            </th>
            <td style="text-align: left;padding-left:10px; ">
                ${user2.englishName}
            </td>
        </tr>
        </tbody>
    </table>
    <input type="hidden" name="id" id="id" value="${param.id}"/>
    <table class="infoTable" width="80%" cellspacing="0" cellpadding="0">
        <caption>粉丝数认证审核</caption>
        <tbody>
        <tr>
            <th>

            </th>
            <td style="text-align:center">
               现在的值
            </td>
            <td style="text-align:center">
               申请认证的值
            </td>
        </tr>
        <tr>
            <th>
                粉丝数 :
            </th>
            <td style="text-align:center">
                ${userWxz.numFans}
            </td>
            <td style="text-align:center">
                ${userWxzRz.numFans}
            </td>
        </tr>
        <tr>
            <th>
                行业 :
            </th>
            <td style="text-align:center">
                ${userWxz.industry}
            </td>
            <td style="text-align:center">
                ${userWxzRz.industry}
            </td>
        </tr>
        <tr>
            <th>
                地区 :
            </th>
            <td style="text-align:center">
                ${userWxz.area}
            </td>
            <td style="text-align:center">
                ${userWxzRz.area}
            </td>
        </tr>

        <tr style="height:40px;">
            <td style="width: 150px;text-align: right;">

            </td>
            <td style="text-align: left;padding-left:10px;" colspan="2">
                <input id="b1" type="button" value="审核通过" class="button blue medium"
                       style="cursor: pointer;"/>
                 <input id="b2" type="button" value="审核不通过" class="button blue medium"
                       style="cursor: pointer;"/>
            </td>
        </tr>

        </tbody>
    </table>
</form>


<script type="text/javaScript">
    $(document).ready(function () {
        $("#b1").click(function(e) {
            var url = '/gly/renzheng/sh.do?status=2';
            jQuery.post(url, $("#f1").serialize(), function(jsonobj) {
                if (jsonobj.code == "200") {
                    layer.msg("操作成功");
                    self.opener.location.reload();
                    window.close();
                } else {
                    layer.alert("操作失败了:" + jsonobj.msg);
                }
            }, "json");
        });

        $("#b2").click(function(e) {
            var url = '/gly/renzheng/sh.do?status=3';
            jQuery.post(url, $("#f1").serialize(), function(jsonobj) {
                if (jsonobj.code == "200") {
                    layer.msg("操作成功");
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