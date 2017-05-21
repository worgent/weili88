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
    <title>粉丝数认证</title>
</head>

<body>
<div id="Holder">
    <div id="MainPage">
        <jsp:include page="/gly/common/head.jsp">
            <jsp:param name="p" value="8"/>
        </jsp:include>

        <div id="MainBody" class="layout-full-width">
            <jsp:include page="/gly/renzheng/left.jsp">
                <jsp:param name="p" value="${param.status}"/>
            </jsp:include>

            <div id="CooperationMain" class="layout-main box clear-fix">
                <div class="layout-block-header">
                    <h2>认证申请</h2>
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
                                    粉丝数
                                </th>
                                <th style="width: 100px;">
                                    行业
                                </th>
                                <th style="width: 100px;">
                                    地区
                                </th>
                                <th style="width: 120px;">
                                    申请时间
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
                                        <a href="#" onclick="detail('${item.user.id}');return false;">${item.user.englishName}</a>
                                    </td>
                                    <td>
                                        <a href="#" onclick="detail('${item.user.id}');return false;">${item.user.chineseName}</a>
                                    </td>
                                    <td>
                                            ${item.numFans}
                                    </td>
                                    <td>
                                            ${item.industry}
                                    </td>
                                    <td>
                                            ${item.area}
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

<script type="text/javascript">
    function detail(id) {
        var url = "/gly/user/detail.do?id=" + id;
        openDialog(url, 1000, 450, "yes");
    }

    function sh(id){
        var url = "/gly/renzheng/sh_load.do?id=" + id;
        openDialog(url, 900, 550, "yes");
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