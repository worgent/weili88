<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.xiaoshuocity.com/commonTag" prefix="commonTag" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <title>支付审核</title>
    <link href="/css/table.css" rel="stylesheet" type="text/css">
    <link href="/css/button.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/css/page.css"/>
    <script type="text/javascript" src="/js/jquery/jquery-1.8.1.min.js"></script>
    <script language="javascript" src='/js/plug-in/My97DatePicker/WdatePicker.js'></script>
    <script src="/js/layer/layer.min.js"></script>
</head>

<body>

<form method="post" action="#" name="f1" id="f1">
    <input type="hidden" name="id" id="id" value="${param.id}"/>
    <table class="infoTable" width="80%" cellspacing="0" cellpadding="0">
        <caption>支付审核</caption>
        <tbody>
        <tr>
            <th>
                微信名称 :
            </th>
            <td style="text-align: left;padding-left:10px; ">
                ${zhifuOrder.user.chineseName}
            </td>
        </tr>
        <tr>
            <th>
                微信帐号 :
            </th>
            <td style="text-align: left;padding-left:10px; ">
                ${zhifuOrder.user.englishName}
            </td>
        </tr>
        <tr>
            <th>
                支付金额 :
            </th>
            <td style="text-align: left;padding-left:10px; ">
                ${zhifuOrder.money}元
            </td>
        </tr>
        <tr>
            <th>
                实际支付金额（税前） :
            </th>
            <td style="text-align: left;padding-left:10px; ">
                <input type="text" name="moneyTaxBefore" id="moneyTaxBefore" size="30" value="${zhifuOrder.money}" onkeyup="value=value.replace(/[^\d\.]/g,'')"/>元
            </td>
        </tr>

        <tr style="height:40px;">
            <td style="width: 150px;text-align: right;">

            </td>
            <td style="text-align: left;padding-left:10px;">
                <input id="b1" type="button" value="审核通过" class="button blue medium"
                       style="cursor: pointer;"/>
                 <input id="b2" type="button" value="审核不通过" class="button blue medium"
                       style="cursor: pointer;"/>
            </td>
        </tr>

        </tbody>
    </table>
</form>

<table class="sonTable" width="100%" border="0" cellspacing="0" cellpadding="5">
<caption>相关订单:</caption>
    <tbody>
    <tr>
        <th style="width: 60px;">
            ID
        </th>
        <th>
            广告名称
        </th>
        <th style="width: 120px;">
            广告类型
        </th>
        <th style="width: 120px;">
            费用
        </th>
        <th style="width: 120px;">
            计划发布日期
        </th>
        <th style="width: 120px;">
            粉丝数
        </th>
    </tr>
    <c:forEach var="item" items="${adOrderList}" varStatus="status">
    <tr>
        <td>
            ${item.id}
        </td>
        <td>
              ${item.ad.title}
        </td>
        <td>
            ${item.adType}
        </td>
        <td>
            ${item.amountStr}
        </td>
        <td>
            <fmt:formatDate value="${item.planDay}" pattern="yyyy-MM-dd"/>
        </td>
        <td>
             ${item.numFans}
        </td>
    </tr>
    </c:forEach>
    </tbody>
</table>

<script type="text/javaScript">
    var url = '/gly/zhifu/sh.do';
    $(document).ready(function () {
        $("#b1").click(function(e) {
            if ($("#moneyTaxBefore").val() == '') {
                layer.msg('实际支付金额（税前）不能为空!');
                return false;
            }
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
            url = "/gly/zhifu/sh.do?status=61";
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