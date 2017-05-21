<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.xiaoshuocity.com/commonTag" prefix="commonTag" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <link href="/css/list.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/css/page.css"/>
    <title>未审核的支付记录</title>
</head>

<body>
<div id="Holder">
<div id="MainPage">
<jsp:include page="/gly/common/head.jsp">
    <jsp:param name="p" value="4"/>
</jsp:include>

<div id="MainBody" class="layout-full-width">
<jsp:include page="/gly/zhifu/left.jsp">
    <jsp:param name="p" value="0"/>
</jsp:include>

<div id="CooperationMain" class="layout-main box clear-fix">
<div class="layout-block-header">

    <h2>未审核的支付记录</h2>
</div>
    <div id="AdposListTableBar">
    <div class="ui-table-body">
    <table class="tableList" width="100%" cellpadding="0" cellspacing="0">
    <tbody>
    <tr>
        <th style="width: 80px;">
            ID
        </th>
        <th style="width: 120px;">
            支付金额
        </th>
        <th style="width: 120px;">
            微信名称
        </th>
        <th style="width: 120px;">
            累计收入
        </th>
        <th style="width: 150px;">
            累计支付
        </th>
        <th style="width: 150px;">
            申请时间
        </th>
        <th>
            操作
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
        <td>
             ${item.user.chineseName}
        </td>
        <td>
           ${item.userWxz.moneyInput}
        </td>
        <td>
           ${item.userWxz.moneyZhifu}
        </td>
        <td>
            <fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
        </td>
        <td>
            <a href="#"
               onclick="sh('${item.id}');return false;">审核</a>
        </td>
    </tr>
    </c:forEach>

    </tbody>
    </table>
    </div>

    </div>

<div class="pageblk" style="padding-top:15px;padding-bottom:15px;">
    <commonTag:page limit="5" pageBean="${pageBean}" urlString="${urlString}" anchor="m1"/>
</div>
</div>
</div>

<jsp:include page="/user/common/foot.jsp"/>

</div>
</div>
<script type="text/javaScript">
    function sh(id){
        var url = "/gly/zhifu/sh_load.do?id=" + id;
        openDialog(url, 900, 550, "yes");
    }
</script>

</body>
</html>