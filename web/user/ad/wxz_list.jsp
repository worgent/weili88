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
    <title>${typeName}广告列表</title>
    <script type="text/javascript">
        function detail(id) {
            var url = "/user/ad/detail.do?id=" + id;
            openDialog(url, 1000, 650, "yes");
        }
        function insert_load(adId) {
        <c:choose>
        <c:when test="${user.status!=1}">
            layer.alert('微信账户状态为:${user.statusStr},不能进行此操作');
        </c:when>
        <c:otherwise>
            var url = "/user/ad_order/wxz_insert_load.do?id=" + adId;
            var obj = openDialog(url, 1190, 500, "yes");
            if (obj != "" && obj != null) {
                location.reload();
            }
        </c:otherwise>
        </c:choose>
        }
    </script>
</head>

<body>
<div id="Holder">
    <div id="MainPage">
        <jsp:include page="/user/common/head.jsp">
            <jsp:param name="p" value="2"/>
        </jsp:include>
        <div id="MainBody" class="layout-full-width">
            <jsp:include page="wxz_left.jsp">
                <jsp:param name="p" value="${param.type}"/>
            </jsp:include>
            <div id="CooperationMain" class="layout-main box clear-fix">
                <div class="layout-block-header"><h2>${typeName}广告列表</h2></div>

                <div id="AdposListTableBar">
                    <div class="ui-table-body">
                        <table class="tableList" width="100%" cellpadding="0" cellspacing="0">
                            <tbody>
                            <tr>
                                <th style="width:80px;">
                                    ID
                                </th>
                                <th>
                                    ${typeName}标题
                                </th>
                                <th style="width: 85px;">
                                    报价/千粉
                                </th>
                                <th style="width: 150px;">
                                    粉丝数要求
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
                                        <a href="wxz_list.jsp#"
                                           onclick="detail('${item.id}');return false;">${item.title}</a>
                                    </td>
                                    <td>
                                            ${item.priceStr}
                                    </td>
                                    <td>
                                            ${item.fans}
                                    </td>
                                    <td>
                                        <a href="#" onclick="insert_load('${item.id}');return false;">接单</a>
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
    function updateStauts(id, title, status) {
        var operate = "启用";
        if (status == 1) {
            operate = "关闭";
        }
        layer.confirm("确认" + operate + "《" + title + "》吗？", function(index) {
            var url = "/user/ad/ggz_ajax_status.do?id=" + id;
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