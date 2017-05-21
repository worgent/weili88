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
    <title>系统消息</title>
    <script type="text/javascript">
        function detail(id) {
            var url = "/gly/message/detail.do?id=" + id;
            openDialog(url,1000, 350, "yes");
        }
    </script>
</head>

<body>
<div id="Holder">
<div id="MainPage">
<jsp:include page="/gly/common/head.jsp">
    <jsp:param name="p" value="6"/>
</jsp:include>

<div id="MainBody" class="layout-full-width">
<jsp:include page="/gly/message/left.jsp">
    <jsp:param name="p" value="10"/>
</jsp:include>

<div id="CooperationMain" class="layout-main box clear-fix">
<div class="layout-block-header">
    <h2>系统消息</h2>
</div>
<div id="AdposListTableBar">
    <div class="ui-table-body">
        <table class="tableList" width="100%" cellpadding="0" cellspacing="0">
            <tbody>
            <tr>
                <th style="width: 60px;">
                    ID号
                </th>
                <th>
                    标题
                </th>
                <th style="width: 150px;">
                    收件人
                </th>
                <th style="width: 150px;">
                    发件人
                </th>
                <th style="width: 120px;">
                    发送时间
                </th>
            </tr>
            <c:forEach var="item" items="${list}" varStatus="status">
            <tr>
                <td>
                   ${item.id}
                </td>
                <td>
                    <a href="#" onclick="detail('${item.id}');return false;">${item.title}</a>
                </td>
                <td>
                   ${item.receiverUser.chineseName}
                </td>
                <td>
                   ${item.senderUser.chineseName}
                </td>
                <td>
                    <fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
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

</body>
</html>