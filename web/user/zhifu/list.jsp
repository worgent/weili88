<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.xiaoshuocity.com/commonTag" prefix="commonTag" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <link href="/css/list.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/css/page.css"/>

    <title>支付记录</title>
</head>

<body>
<div id="Holder">
<div id="MainPage">
<jsp:include page="/user/common/head.jsp">
    <jsp:param name="p" value="5"/>
</jsp:include>
<div id="MainBody" class="layout-full-width">
    <table class="tableList" width="100%" cellpadding="0" cellspacing="0">
    <tbody>
    <tr>
        <th style="width: 80px;">
            ID
        </th>
        <th>
            结算金额
        </th>
        <th style="width: 160px;">
            实际支付金额（税前）
        </th>
        <th style="width: 160px;">
            平台手续费
        </th>
        <th style="width: 160px;">
            代扣税
        </th>
        <th style="width: 160px;">
            实际支付金额（税后）
        </th>
        <th style="width: 160px;">
            状态
        </th>
    </tr>

    <c:forEach var="item" items="${list}" varStatus="status">
    <tr>
        <td>
            ${item.id}
        </td>
        <td>
            ${item.money}
        </td>
        <c:choose>
            <c:when test="${item.status==61}">
                <td>
                   - -
                </td>
                <td>
                    - -
                </td>
                <td>
                    - -
                </td>
                <td>
                    - -
                </td>
            </c:when>
            <c:otherwise>
                <td>
                    ${item.moneyTaxBefore}
                </td>
                <td>
                   ${item.moneySxf}
                </td>
                <td>
                   ${item.moneyTax}
                </td>
                <td>
                   ${item.moneyTaxAfter}
                </td>

            </c:otherwise>
        </c:choose>
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

</div>

<jsp:include page="/user/common/foot.jsp"/>

</div>
</div>

</body>
</html>