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
    <title>已审核的记录</title>
</head>

<body>
<div id="Holder">
    <div id="MainPage">
        <jsp:include page="/gly/common/head.jsp">
            <jsp:param name="p" value="4"/>
        </jsp:include>

        <div id="MainBody" class="layout-full-width">
            <jsp:include page="/gly/zhifu/left.jsp">
                <jsp:param name="p" value="1"/>
            </jsp:include>

            <div id="CooperationMain" class="layout-main box clear-fix">
                <div class="layout-block-header">

                    <h2>已审核的记录</h2>
                </div>
                <div id="AdposListTableBar">
                    <div class="ui-table-body">
                        <table class="tableList" width="100%" cellpadding="0" cellspacing="0">
                            <tbody>
                            <tr>
                                <th style="width: 80px;">
                                    ID
                                </th>
                                <th style="width: 150px;">
                                    支付金额
                                </th>
                                <th style="width: 150px;">
                                    实际支付金额（税前）
                                </th>
                                <th style="width: 150px;">
                                    实际支付金额（税后）
                                </th>
                                <th style="width: 150px;">
                                    微信名称
                                </th>
                                <th style="width: 150px;">
                                    支付宝账户
                                </th>
                                <th style="width: 120px;">
                                    操作
                                </th>
                            </tr>

                            <c:forEach var="item" items="${list}" varStatus="status">
                                <tr>
                                    <td>
                                            ${item.id}
                                    </td>
                                    <td>
                                            ${item.money}
                                    </td>
                                    <td>
                                            ${item.moneyTaxBefore}
                                    </td>
                                    <td>
                                            ${item.moneyTaxAfter}
                                    </td>
                                    <td>
                                            ${item.user.chineseName}
                                    </td>
                                    <td>
                                            ${item.userWxz.zfbAccount}
                                    </td>
                                    <td>
                                        <a href="#"
                                           onclick="fk('${item.id}','${item.moneyTaxAfter}','${item.userWxz.zfbAccount}');return false;">标记为已付款</a>
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
    function fk(id,moneyAfter,zfbAcount) {
        layer.confirm("确认完成了对支付宝账户：<br>" + zfbAcount + " 充值 ￥" + moneyAfter + "元的 操作吗？", function(index) {
            var url = "/gly/zhifu/fk.do";
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