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
    <title>充值记录</title>
</head>

<body>
<div id="Holder">
    <div id="MainPage">
        <jsp:include page="/user/common/head.jsp">
            <jsp:param name="p" value="5"/>
        </jsp:include>
        <div id="MainBody" class="layout-full-width">
            <jsp:include page="left.jsp">
                <jsp:param name="p" value="1"/>
            </jsp:include>
            <div id="CooperationMain" class="layout-main box clear-fix">
                <div class="layout-block-header"><h2>充值记录</h2></div>
                <%--<jsp:include page="common/zhcz_top.jsp">--%>
                    <%--<jsp:param name="p" value="${p}"/>--%>
                <%--</jsp:include>--%>
                <div id="AdposListTableBar">
                    <div class="ui-table-body">
                        <table class="tableList" width="100%" cellpadding="0" cellspacing="0">
                            <tbody>
                            <tr>
                                <th style="width: 100px;">
                                    订单号
                                </th>
                                <th>
                                    充值金额
                                </th>
                                <th style="width: 150px;">
                                    充值方式
                                </th>
                                <th style="width: 150px;">
                                    充值时间
                                </th>
                                <th style="width: 200px;">
                                    状态
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
                                    ￥${item.money}元
                                </td>
                                <td>
                                    支付宝
                                </td>
                                <td>
                                    <fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                </td>
                                <td>
                                    ${item.statusStr}
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${item.status<10}">
                                            <a href="#" onclick="zhifu(${item.id});return false;">重新支付</a>
                                        </c:when>
                                        <c:otherwise>
                                            - -
                                        </c:otherwise>
                                    </c:choose>

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
<form id="f1" name="alipayment" action="/user/chongzhi/order_insert.do" method="post" target="_blank">
    <input type="hidden" name="id" id="id"/>

</form>

<script type="text/javascript">
    function zhifu(id) {
        $("#id").val(id);
        $("#f1").submit();
        $.layer({
                    shade: [0],
                    area: ['auto','auto'],
                    dialog: {
                        msg: '支付完成前，请不要关闭此支付验证窗口。 支付完成后，请根据您支付的情况点击下面按钮。',
                        btns: 2,
                        type: 7,
                        btn: ['遇到问题','支付完成'],
                        yes: function() {
                            layer.alert('请重新进行支付或联系客服');
                        }, no: function() {
                            window.location.href = "/user/chongzhi/order_list.do";
                        }
                    }
                });
    }
</script>

</body>
</html>