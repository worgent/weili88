<%@ page import="base.util.BaseIntUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.xiaoshuocity.com/commonTag" prefix="commonTag" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <link href="/css/list.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/css/page.css"/>
    <title>有效的内容记录</title>
</head>

<%
    int status = BaseIntUtil.getInt(request, "status");
    if (status == -1) {
        pageContext.setAttribute("p", 1);
    } else {
        pageContext.setAttribute("p", 0);
    }
%>
<body>
<div id="Holder">
    <div id="MainPage">
        <jsp:include page="/gly/common/head.jsp">
            <jsp:param name="p" value="5"/>
        </jsp:include>

        <div id="MainBody" class="layout-full-width">
            <jsp:include page="left.jsp">
                <jsp:param name="p" value="${p}"/>
            </jsp:include>

            <div id="CooperationMain" class="layout-main box clear-fix">
                <div class="layout-block-header">
                    <h2>有效的内容记录</h2>
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
                                    分类
                                </th>
                                <th style="width: 150px;">
                                    创建时间
                                </th>
                                <th style="width: 100px;">
                                    操作
                                </th>
                            </tr>
                            <c:forEach var="item" items="${list}" varStatus="status">
                                <tr>
                                    <td>
                                            ${item.id}
                                    </td>
                                    <td>
                                            ${item.title}
                                    </td>
                                    <td>
                                            ${item.categoryName}
                                    </td>
                                    <td>
                                        <fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                    </td>
                                    <td>
                                        <a href="/gly/cms/content_insert_load.do?id=${item.id}">修改</a>|
                                        <a href="#"
                                           onclick="updateStauts('${item.id}','${item.title}');return false;">
                                            <c:choose>
                                                <c:when test="${p==0}">
                                                    删除
                                                </c:when>
                                                <c:otherwise>
                                                    恢复
                                                </c:otherwise>
                                            </c:choose>
                                        </a>
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
<script type="text/javascript">
    <c:choose>
    <c:when test="${p==0}">
    var operate = "删除";
    </c:when>
    <c:otherwise>
    var operate = "恢复";
    </c:otherwise>
    </c:choose>
    function updateStauts(id, title) {
        layer.confirm("确认" + operate + "《" + title + "》吗？", function(index) {
            var url = "/gly/cms/remove.do?id=" + id;
            jQuery.post(url, {id:id}, function(jsonobj) {
                if (jsonobj.code == "200") {
                    layer.msg(jsonobj.msg);
                    location.reload();
                } else {
                    layer.alert("操作失败了:" + jsonobj.msg);
                }
            }, "json");

        });
    }
</script>
</body>
</html>