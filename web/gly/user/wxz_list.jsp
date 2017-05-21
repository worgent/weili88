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
    <title>微信主列表</title>
</head>

<body>
<div id="Holder">
    <div id="MainPage">
        <jsp:include page="/gly/common/head.jsp">
            <jsp:param name="p" value="1"/>
        </jsp:include>

        <div id="MainBody" class="layout-full-width">
            <jsp:include page="/gly/user/left.jsp">
                <jsp:param name="p" value="20"/>
            </jsp:include>

            <div id="CooperationMain" class="layout-main box clear-fix">
                <div class="layout-block-header">
                    <h2>微信主列表</h2>
                </div>

                <div id="AdposListTableBar">
                    <div class="tableList" class="ui-table-body">
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tbody>
                            <tr>
                                <th style="width: 60px;">
                                    ID
                                </th>
                                <th style="width: 150px;">
                                    微信账户
                                </th>
                                <th style="width: 150px;">
                                    微信名称
                                </th>
                                <th style="width: 100px;">
                                    手机
                                </th>
                                <th style="width: 100px;">
                                    QQ
                                </th>
                                <th style="width: 100px;">
                                    邮箱
                                </th>
                                <th style="width: 120px;">
                                    创建时间
                                </th>
                                <th style="width: 100px;">
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
                                        <a href="#" onclick="detail('${item.id}');return false;">${item.englishName}</a>
                                    </td>
                                    <td>
                                        <a href="#" onclick="detail('${item.id}');return false;">${item.chineseName}</a>
                                    </td>
                                    <td>
                                            ${item.phone}
                                    </td>
                                    <td>
                                            ${item.qq}
                                    </td>
                                    <td>
                                            ${item.email}
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
                                                <c:when test="${item.status==-1}">
                                                    解冻
                                                </c:when>
                                                <c:otherwise>
                                                    冻结
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
    function updateStauts(id, englishName, status) {
        var operate = "解冻";
        if (status == 1) {
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

    function detail(id) {
        var url = "/gly/user/detail.do?id=" + id;
        openDialog(url, 1000, 450, "yes");
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