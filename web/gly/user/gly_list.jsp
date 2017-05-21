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
    <title>管理员列表</title>
</head>

<body>
<div id="Holder">
<div id="MainPage">
<jsp:include page="/gly/common/head.jsp">
    <jsp:param name="p" value="1"/>
</jsp:include>

<div id="MainBody" class="layout-full-width">
<jsp:include page="/gly/user/left.jsp">
    <jsp:param name="p" value="30"/>
</jsp:include>

<div id="CooperationMain" class="layout-main box clear-fix">
<%--<div class="layout-block-header">--%>
    <%--<h2>管理员列表</h2>--%>
<%--</div>--%>
    <div class="layout-block-content" style="padding:10px;float:right;">
        <button id="b1" class="button orange medium">新增管理员</button>
    </div>

<div id="AdposListTableBar">
    <div class="tableList" class="ui-table-body">
        <table width="100%" cellpadding="0" cellspacing="0">
            <tbody>
            <tr>
                <th style="width: 60px;">
                    ID
                </th>
                <th>
                    登录帐户
                </th>
                <th style="width: 250px;">
                    真实姓名
                </th>
                <th style="width: 120px;">
                    创建时间
                </th>
                <th style="width: 120px;">
                    状态
                </th>
                <th style="width: 60px;">
                    操作
                </th>
            </tr>

            <c:forEach var="item" items="${list}" varStatus="status">
            <tr>
                <td>
                    ${item.id}
                </td>
                <td>
                    ${item.englishName}
                </td>
                <td>
                    ${item.chineseName}
                </td>
                <td>
                    <fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </td>
                <td>
                    ${item.statusStr}
                </td>
                <td>
                    <a href="#"
                       onclick="updateStauts('${item.id}','${item.englishName}','${item.status}');return false;">
                        <c:choose>
                            <c:when test="${item.status==1}">
                                冻结
                            </c:when>
                            <c:otherwise>
                                解冻
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
</div>
</div>

<jsp:include page="/user/common/foot.jsp"/>

</div>
</div>

<script type="text/javascript">
    function updateStauts(id, englishName,status) {
        var operate = "解冻";
        if(status==1){
          operate = "冻结";
        }
        layer.confirm("确认" + operate + "《" + englishName + "》吗？", function(index) {
            var url = "/gly/user/ajax_status.do?id=" + id;
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

    $(document).ready(function () {
        $("#b1").click(function(e) {
            var url = "/gly/user/gly_insert.jsp";
            openDialog(url, 800, 450, "yes");
        });
    });
</script>

</body>
</html>