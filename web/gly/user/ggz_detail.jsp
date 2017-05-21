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
    <title>广告主详情</title>
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
        <th>
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
            累计消费:
        </th>
        <td>
            ${userGgz.moneyOutput}
        </td>
        <th>
            冻结金额:
        </th>
        <td>
            ${userGgz.moneyOutputLock}
        </td>
        <th>
            帐户余额:
        </th>
        <td>
            ${userGgz.leftMoney}
        </td>
    </tr>
    </tbody>
</table>
<table class="sonTable" width="100%" border="0" cellspacing="0" cellpadding="5">
<caption>广告列表:</caption>
    <tbody>
    <tr>
        <th style="width: 60px;">
            ID
        </th>
        <th>
            广告名称
        </th>
        <th style="width: 80px;">
            广告类型
        </th>
        <th style="width: 100px;">
            报价/千粉
        </th>
        <th style="width: 100px;">
            粉丝数要求
        </th>
        <th style="width: 100px;">
            创建时间
        </th>
        <th style="width: 80px;">
             状态
        </th>
    </tr>
    <c:forEach var="item" items="${adList}" varStatus="status">
    <tr>
        <td>
            ${item.id}
        </td>
        <td>
              ${item.title}
        </td>
        <td>
            ${item.typeStr}
        </td>
        <td>
            ${item.priceStr}
        </td>
        <td>
            ${item.fans}
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