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
    <title>未完成充值的订单</title>
</head>

<body>
<div id="Holder">
<div id="MainPage">
<jsp:include page="/gly/common/head.jsp">
    <jsp:param name="p" value="3"/>
</jsp:include>

<div id="MainBody" class="layout-full-width">
<jsp:include page="left.jsp">
    <jsp:param name="p" value="1"/>
</jsp:include>

<div id="CooperationMain" class="layout-main box clear-fix">
<div class="layout-block-header">
    <h2>未完成充值的订单</h2>
</div>
<div id="AdposListTableBar">
    <div class="ui-table-body">
        <table class="tableList" width="100%" cellpadding="0" cellspacing="0">
            <tbody>
            <tr>
                <th style="width: 80px;">
                    订单号
                </th>
                <th style="width: 150px;">
                    广告主账户
                </th>
                <th>
                    广告主名称
                </th>
                <th style="width: 120px;">
                    充值金额
                </th>
                <th style="width: 120px;">
                    状态
                </th>
                <th style="width: 120px;">
                    充值时间
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
                    ${item.user.englishName}
                </td>
                <td>
                    ${item.user.chineseName}
                </td>
                <td>
                    ${item.money}
                </td>
                <td>
                    ${item.statusStr}
                </td>
                <td>
                    <fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </td>
                <td>
                    <a href="#"
                       onclick="sgkt('${item.id}','${item.user.chineseName}','${item.money}');return false;">手工开通</a>
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
    function sgkt(id,chineseName,money) {
        layer.confirm("确认要手工开通：" + chineseName + " 的 ￥" + money + "元充值订单吗 ？", function(index) {
            var url = "/gly/chongzhi/sgkt.do";
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