<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <link href="/css/esui.css" rel="stylesheet" type="text/css">
    <link href="/css/union.css" rel="stylesheet" type="text/css">
    <link href="/css/build.css" rel="stylesheet" type="text/css">
    <link href="/css/uploadify.css" rel="stylesheet" type="text/css">
    <style>
        body {
            min-width: 984px;
        }
    </style>
    <title>微利-微聚利量</title>
</head>

<body>
<script type="text/javascript">
    function msg_detail(id,xin) {
        var url = "/user/message/detail.do?id=" + id;
        var obj = openDialog(url, 1000, 450, "yes");
        if (xin) {
             location.reload();
        }
    }
    function ad_order_detail(id) {
        var url = "/user/ad/detail.do?id=" + id;
        openDialog(url, 1000, 650, "yes");
    }

</script>

<div id="Holder">
<div id="MainPage">
<jsp:include page="/gly/common/head.jsp"/>
<div id="MainBody" class="layout-full-width">
<div class="hidden" id="ValidateWarn"><q id="ValidateWarnCloseBtn">关闭</q></div>
<jsp:include page="left.jsp">
    <jsp:param name="p" value="0"/>
</jsp:include>
<div id="OverviewMain" class="clear-fix">
<div class="layout-main">
    <style>
        .wxtable th {
            padding: 10px 9px;
            text-align: center;
            background-color: #f0f2f6;
        }

        .wxtable td {
            padding: 10px 9px;
            text-align: center
        }
    </style>


    <div style="margin-top:2px;" class="box">
        <div class="ui-table">
            <div class="ui-table-head">
                <table class="wxtable" cellpadding="0" cellspacing="0">
                    <tbody>
                    <tr>
                        <td style="text-align: left;width:150px">
                            您好：<b><a href="">${user.chineseName}</a></b>
                        </td>
                        <td style="text-align: left;">
                            广告主：<b>${countUserGgz}</b>
                        </td>
                        <td style="text-align: left;">
                            微信主：<b>${countUserWxz}</b>
                        </td>
                        <td style="text-align: left;">
                            软文广告：<b>${countAdTiepian}</b>
                        </td>
                        <td style="text-align: left;">
                            贴片广告：<b>${countAdRuanwen}</b>
                        </td>
                        <td style="text-align: left;">
                            微信互推：<b>${countAdWxht}</b>
                        </td>
                        <td style="text-align: left;">
                            今日充值：<b>￥${sumMoneyToday}</b>元
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

<div class="box" style="clear:both;">
    <h3>我的消息<a class="more" href="/gly/message/xtxx_list.do" target="_blank">更多</a></h3>

    <div id="OverviewOptimizeAdvice" style="height:116px;padding-left:25px;">
        <div class="content" id="OptimizeAdviceContent">
            <style>
                .content .ui-list li {
                    float: left;
                    width: 450px;
                    list-style-type: disc;
                }

                .ui-list after{
                    clear:both;
                }
            </style>
            <ul class="ui-list">
                <c:forEach var="item" items="${messageList}" varStatus="status">
                <li class="grade-2">
                    <a href="#" onclick="msg_detail('${item.id}',${empty item.readTime});return false;">
                        <c:choose>
                            <c:when test="${empty item.readTime}">
                                <b><c:out value="${fn:substring(item.title,0,35)}"/></b><img src="/img/weidu.jpg"/>
                            </c:when>
                            <c:otherwise>
                                <c:out value="${fn:substring(item.title,0,35)}"/>
                            </c:otherwise>
                        </c:choose>
                    </a>
                </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>

<div style="margin-top:2px;" class="box">
    <h3>接单记录</h3>
    <div class="ui-table">
        <div class="ui-table-head">
            <table class="tableList wxtable" cellpadding="0" cellspacing="0">
                <tbody>
                <tr>
                    <th style="width:50px">订单ID</th>
                    <th style="width:120px">微信名称</th>
                    <th>广告名称</th>
                    <th style="width:70px">广告类型</th>
                    <th style="width:100px">费用</th>
                    <th style="width:100px">计划发布日期</th>
                    <th style="width:110px">状态</th>
                </tr>

                <c:forEach var="item" items="${adOrderList}" varStatus="status">
                <tr>
                    <td>
                       ${item.id}
                    </td>
                    <td>
                        <a href="index.jsp#" onclick="previewWx('${item.userWxzId}',0,400);return false;">${item.user.chineseName}</a>
                    </td>
                    <td>
                        <a href="#" onclick="ad_order_detail('${item.adId}');return false;">
                            ${item.ad.title}
                        </a>
                    </td>
                    <td>
                       ${item.ad.typeStr}
                    </td>
                    <td>
                        ${item.amountStr}
                    </td>
                    <td>
                        <fmt:formatDate value="${item.planDay}" pattern="yyyy-MM-dd"/>
                    </td>
                    <td>
                         ${item.statusStr}
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

</div>
</div>
﻿
</div>

<jsp:include page="/user/common/foot.jsp"/>

</div>
</div>

</body>
</html>