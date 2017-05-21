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
    <title>对账申请</title>
    <link href="/css/table.css" rel="stylesheet" type="text/css">
    <link href="/css/button.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/jquery/jquery-1.8.1.min.js"></script>
    <script language="javascript" src='/js/plug-in/My97DatePicker/WdatePicker.js'></script>
    <script src="/js/layer/layer.min.js"></script>
</head>

<body>

<table class="infoTable" width="80%" cellspacing="0" cellpadding="0">
    <caption>对账申请</caption>
</table>

<form method="post" action="/user/ad_order/wxz_dzsq.do" name="f1" id="f1" enctype="multipart/form-data">
    <input type="hidden" name="adOrderId" value="${adOrder.id}"/>

<c:forEach begin="1" end="${size}" varStatus="item">
    <table class="infoTable" width="80%" cellspacing="0" cellpadding="0">
        <tbody>
        <tr>
            <th>
                文章标题 :
            </th>
            <td style="text-align: left;padding-left:10px; ">
                <input type="text" size="80" name="title" id="title${item.index}"/>
            </td>
        </tr>
        <tr>
            <th>
                文章地址 :
            </th>
            <td style="text-align: left;padding-left:10px; ">
                <input type="text" size="80" name="url" id="url${item.index}"/>
            </td>
        </tr>
        <tr>
            <th>
                图文分析截图:
            </th>
            <td style="text-align: left;padding-left:10px;    ">
                <input type="file" name="file" id="file${item.index}" size="60"/>
            </td>
        </tr>
        </tbody>
    </table>
    <p></p>
</c:forEach>

    <table class="infoTable" width="80%" cellspacing="0" cellpadding="0">
        <tbody>

        <tr style="height:40px;">
            <td style="width: 150px;text-align: right;">

            </td>
            <td style="text-align: left;padding-left:10px;">
                <input id="b1" type="button" value="申请对账" class="button blue medium"
                       style="cursor: pointer;"/></td>
            </td>
        </tr>

        </tbody>
    </table>
</form>

<script type="text/javaScript">
    var url = '/user/ad_order/wxz_ajax_dzsq.do';
    $(document).ready(function () {
        $("#b1").click(function(e) {
            $("#f1").submit();
        });
    });
</script>

</body>
</html>