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
    <title>我的问题</title>
    <script type="text/javascript">
        function detail(id,reload) {
            var url = "/user/message/detail.do?id=" + id;
            var obj = openDialog(url, 1000, 650, "yes");
            if (reload) {
                location.reload();
            }
        }
    </script>
</head>

<body>
<div id="Holder">
    <div id="MainPage">
        <jsp:include page="/user/common/head.jsp">
            <jsp:param name="p" value="8"/>
        </jsp:include>
        <div id="MainBody" class="layout-full-width">
            <jsp:include page="left.jsp">
                <jsp:param name="p" value="1"/>
            </jsp:include>
            <div id="CooperationMain" class="layout-main box clear-fix">
                <div class="layout-block-header"><h2>我的问题</h2></div>
                <%--<jsp:include page="common/wdxx_top.jsp">--%>
                    <%--<jsp:param name="p" value="1"/>--%>
                <%--</jsp:include>--%>
                <div id="AdposListTableBar">
                    <div class="ui-table-body">
                        <table class="tableList" width="100%" cellpadding="0" cellspacing="0">
                            <tbody>
                            <tr>
                                <th style="width:80px">
                                    ID
                                </th>
                                <th>
                                    标题
                                </th>
                                <th style="width: 500px;text-align: center;">
                                    回复
                                </th>
                                <th style="width: 120px;text-align: center;">
                                    创建时间
                                </th>
                            </tr>
                            <c:forEach var="item" items="${list}" varStatus="status">
                            <tr>
                                <td>
                                  ${item.id}
                                </td>
                                <td>
                                    <a href="#" onclick="detail(${item.id},${item.readTime==null});return false;">${item.title}</a>
                                </td>
                                <td>
                                    ${item.back2}
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