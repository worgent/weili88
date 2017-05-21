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
    <title>广告详情</title>
    <link href="/css/table.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/css/page.css"/>
</head>

<body>
<table class="infoTable" width="100%" cellspacing="0" cellpadding="5">
    <caption>基本信息:</caption>
    <tbody>
    <tr>
        <th>
            广告ID:
        </th>
        <td>
            ${ad.id}
        </td>
        <th>
            报价:
        </th>
        <td>
            ${ad.priceStr}
        </td>
        <th>
            粉丝数要求:
        </th>
        <td>
            ${ad.fans}
        </td>
    </tr>
    <tr>
        <th>
            ${ad.typeStr}名称:
        </th>
        <td colspan="5">
            ${ad.title}
        </td>
    </tr>

    <tr>
        <th>
            行业要求:
        </th>
        <td colspan="5">
            ${ad.industryNames}
        </td>
    </tr>
    <tr>
        <th>
            地区要求:
        </th>
        <td colspan="5">
            ${ad.areaNames}
        </td>
    </tr>
    <c:choose>
        <c:when test="${ad.type==1}">
            <tr>
                <th>
                    缩略图:
                </th>
                <td colspan="5">
                    <img src="${ad.photo}" width="50%"/>
                </td>
            </tr>
        </c:when>
        <c:when test="${ad.type==2}">
            <tr>
                <th>
                    软文效果:
                </th>
                <td colspan="5">
                    <a href="/user/ad/preview_rw.jsp" target="_blank">预览</a>
                </td>
            </tr>
        </c:when>
        <c:when test="${ad.type==10}">
            <tr>
                <th>
                    内容:
                </th>
                <td colspan="5">
                        ${ad.content}
                </td>
            </tr>
        </c:when>
    </c:choose>
    </tbody>
</table>
<table class="sonTable" width="100%" border="0" cellspacing="0" cellpadding="5">
<caption>相关订单:</caption>
    <tbody>
    <tr>
        <th style="width: 60px;">
            ID
        </th>
        <th>
            微信名称
        </th>
        <th style="width: 120px;">
            微信号
        </th>
        <th style="width: 120px;">
            费用
        </th>
        <th style="width: 120px;">
            计划发布日期
        </th>
        <th style="width: 120px;">
            对账申请时间
        </th>
        <th style="width: 150px;">
             对账申请状态
        </th>
    </tr>
    <c:forEach var="item" items="${list}" varStatus="status">
    <tr>
        <td>
            ${item.id}
        </td>
        <td>
              ${item.user.chineseName}
        </td>
        <td>
            ${item.user.englishName}
        </td>
        <td>
            ${item.amountStr}
        </td>
        <td>
            <fmt:formatDate value="${item.planDay}" pattern="yyyy-MM-dd"/>
        </td>
        <td>
            <c:choose>
                <c:when test="${empty item.applyTime}">
                    - -
                </c:when>
                <c:otherwise>
                    <fmt:formatDate value="${item.applyTime}" pattern="yyyy-MM-dd"/>
                </c:otherwise>
            </c:choose>
        </td>
        <td>
             ${item.statusStr}
        </td>
    </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pageblk" style="padding-top:15px;padding-bottom:15px;">
    <commonTag:page limit="5" pageBean="${pageBean}" urlString="${urlString}" anchor="m1"/>
</div>
</body>
</html>