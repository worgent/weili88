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

    <title>未申请对账的记录</title>
</head>

<body>
<div id="Holder">
    <div id="MainPage">
        <jsp:include page="/user/common/head.jsp">
            <jsp:param name="p" value="3"/>
        </jsp:include>
        <div id="MainBody" class="layout-full-width">
            <jsp:include page="wxz_dzsq_left.jsp">
                <jsp:param name="p" value="0"/>
            </jsp:include>
            <div id="CooperationMain" class="layout-main box clear-fix">
                <div class="layout-block-header"><h2>未申请对账的记录</h2></div>

                <div id="AdposListTableBar">
                    <div class="ui-table-body">
                        <table class="tableList" width="100%" cellpadding="0" cellspacing="0">
                            <tbody>
                            <tr>
                                <th style="width: 60px;">
                                    广告ID
                                </th>
                                <th>
                                    广告标题
                                </th>
                                <th style="width: 120px;">
                                    广告类型
                                </th>
                                <th style="width: 120px;">
                                    金额
                                </th>
                                <th style="width: 100px;">
                                    计划发布日期
                                </th>
                                <th style="width: 120px;">
                                    接单时间
                                </th>
                                <th style="width: 120px;">
                                    操作
                                </th>
                            </tr>
                            <c:forEach var="item" items="${list}" varStatus="status">
                                <tr>
                                    <td>${item.adId}</td>
                                    <td>
                                        <a href="wxz_dzsq_list_no.jsp#" onclick="detail('${item.id}');return false;">${item.ad.title}</a>
                                    </td>
                                    <td>
                                            ${item.ad.typeStr}
                                    </td>
                                    <td>
                                            ${item.amountStr}
                                    </td>
                                    <td>
                                        <fmt:formatDate value="${item.planDay}" pattern="yyyy-MM-dd"/>
                                    </td>
                                    <td>
                                        <fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                    </td>
                                    <td>
                                        <%--<a href="#"--%>
                                           <%--onclick="dzsq('${item.id}','${item.ad.title}');return false;">申请对账</a>--%>

                                        <a href="#" onclick="dzsq_load('${item.id}');return false;">申请对账</a>
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
    function dzsq_load(adId) {
    <c:choose>
    <c:when test="${user.status!=1}">
        layer.alert('微信账户状态为:${user.statusStr},不能进行此操作');
    </c:when>
    <c:otherwise>
        var url = "/user/ad_order/wxz_dzsq_load.do?id=" + adId;
        var obj = openDialog(url, 900, 550, "yes");
        if (obj != "" && obj != null) {
            location.reload();
        }
    </c:otherwise>
    </c:choose>
    }

//    function dzsq(id, title) {
//        layer.confirm("确认进行《" + title + "》的对账申请吗？", function(index) {
//            var url = "/user/ad_order/wxz_ajax_dzsq.do?id=" + id;
//            jQuery.post(url, {id:id}, function(jsonobj) {
//                if (jsonobj.code == "200") {
//                    layer.msg(jsonobj.msg);
//                    location.reload();
//                } else {
//                    layer.alert("操作失败了:" + jsonobj.msg);
//                }
//            }, "json");
//        });
//    }
</script>
</body>
</html>