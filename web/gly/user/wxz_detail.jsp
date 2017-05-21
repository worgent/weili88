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
    <title>微信主详情</title>
    <link href="/css/table.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/css/page.css"/>
</head>

<body>
<table class="infoTable" width="100%" cellspacing="0" cellpadding="5">
    <caption>基本信息:</caption>
    <tbody>
    <tr>
        <th>
            用户ID:
        </th>
        <td>
            ${user2.id}
        </td>
        <th>
            登录帐户:
        </th>
        <td>
            ${user2.englishName}
        </td>
        <th style="width:100px;">
            真实姓名:
        </th>
        <td>
            ${user2.chineseName}
        </td>
    </tr>
    <tr>
        <th>
            手机号:
        </th>
        <td>
            ${user2.phone}
        </td>
        <th>
            QQ:
        </th>
        <td>
            ${user2.qq}
        </td>
        <th>
            电子邮件:
        </th>
        <td>
            ${user2.email}
        </td>
    </tr>
    <tr>
        <th>
            粉丝数:
        </th>
        <td>
            ${userWxz.numFans}
        </td>
        <th>
            行业:
        </th>
        <td>
            ${userWxz.industry}
        </td>
        <th>
            地域:
        </th>
        <td>
            ${userWxz.area}
        </td>
    </tr>
    <tr>
        <th>
            未支付(税前)::
        </th>
        <td>
            ${userWxz.wzfMoney}
        </td>
        <th>
            支付中(税前)::
        </th>
        <td>
            ${userWxz.moneyZhifuLock}
        </td>
        <th>
            完成支付(税后):
        </th>
        <td>
            ${userWxz.moneyZhifuReal}
        </td>
    </tr>

    </tbody>
</table>
<table class="sonTable" width="100%" border="0" cellspacing="0" cellpadding="5">
<caption>接单列表:</caption>
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
            金额
        </th>
        <th style="width: 120px;">
            粉丝数
        </th>
        <th style="width: 120px;">
            创建时间
        </th>
        <th style="width: 150px;">
             状态
        </th>
    </tr>
    <c:forEach var="item" items="${adList}" varStatus="status">
    <tr>
        <td>
            ${item.id}
        </td>
        <td>
              ${item.ad.title}
        </td>
        <td>
            ${item.ad.typeStr}
        </td>
        <td>
            ${item.amountStr}
        </td>
        <td>
            ${item.numFans}
        </td>
        <td>
            <fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd"/>
        </td>
        <td>
             ${item.statusStr}
        </td>
    </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>