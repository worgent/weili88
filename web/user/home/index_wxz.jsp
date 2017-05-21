<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <link href="/css/esui.css" rel="stylesheet" type="text/css">
    <link href="/css/union.css" rel="stylesheet" type="text/css">
    <link href="/css/build.css" rel="stylesheet" type="text/css">
    <link href="/css/uploadify.css" rel="stylesheet" type="text/css">
    <style>
        body {
            min-width: 984px;
        }
    </style>
    <title>微利-微聚利量</title>
</head>

<body>
<script type="text/javascript">
    function msg_detail(id,xin) {
        var url = "/user/message/detail.do?id=" + id;
        var obj = openDialog(url, 1000, 450, "yes");
        if (xin) {
             location.reload();
        }
    }
    function ad_order_detail(id) {
        var url = "/user/ad/detail.do?id=" + id;
        openDialog(url, 1000, 650, "yes");
    }
    function dzsq(id, title) {
        layer.confirm("确认进行《" + title + "》的对账申请吗？", function(index) {
            var url = "/user/ad_order/wxz_ajax_dzsq.do?id=" + id;
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

<div id="Holder">
<div id="MainPage">
<jsp:include page="/user/common/head.jsp"/>
<div id="MainBody" class="layout-full-width">
<div class="hidden" id="ValidateWarn"><q id="ValidateWarnCloseBtn">关闭</q></div>
<jsp:include page="left.jsp">
    <jsp:param name="p" value="0"/>
</jsp:include>
<div id="OverviewMain" class="clear-fix">
<div class="layout-main">
    <style>
        .wxtable th {
            padding: 10px 9px;
            text-align: center;
            background-color: #f0f2f6;
        }

        .wxtable td {
            padding: 10px 9px;
            text-align: center
        }
    </style>


    <div style="margin-top:2px;" class="box">
        <div class="ui-table">
            <div class="ui-table-head">
                <table class="wxtable" cellpadding="0" cellspacing="0">
                    <tbody>
                    <tr>
                        <td style="text-align: left;width:150px">
                            <h6>您好:<a href="">${user.chineseName}</a></h6>
                        </td>


                        <c:choose>
                            <c:when test="${user.status==1}">
                                <td style="text-align: left;">

                                    <button id="b2" class="button blue medium">认证粉丝数</button>
                                </td>
                                <td style="text-align: left;">
                                    剩余积分:<br>￥${userWxz.leftJifen}微币
                                </td>
                                <%--<td style="text-align: left;">--%>
                                    <%--总收入(税前):<br>￥${userWxz.moneyInput-userWxz.moneyZhifuRefuse}元--%>
                                <%--</td>--%>
                                <td style="text-align: left;">
                                    未支付(税前):<br>￥${userWxz.wzfMoney}元
                                </td>
                                <td>
                                    <button id="b1" class="button orange medium">申请支付</button>
                                </td>
                                <td style="text-align: left;">
                                    支付中(税前):<br>￥${userWxz.moneyZhifuLock}元
                                </td>
                                <td style="text-align: left;">
                                    完成支付(税后):<br>￥${userWxz.moneyZhifuReal}元
                                </td>
                            </c:when>
                            <c:otherwise>
                                <td style="text-align: left;">
                                    ${user.statusStr}
                                </td>
                            </c:otherwise>
                        </c:choose>

                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

<div class="box" style="clear:both;">
    <h3>我的消息<a class="more" href="/user/message/xtxx_list.do" target="_blank">更多</a></h3>

    <div id="OverviewOptimizeAdvice" style="height:116px;padding-left:25px;">
        <div class="content" id="OptimizeAdviceContent">
            <style>
                .content .ui-list li {
                    float: left;
                    width: 450px;
                    list-style-type: disc;
                }

                .ui-list after{
                    clear:both;
                }
            </style>
            <ul class="ui-list">
                <c:forEach var="item" items="${messageList}" varStatus="status">
                <li class="grade-2">
                    <a href="#" onclick="msg_detail('${item.id}',${empty item.readTime});return false;">
                        <c:out value="${fn:substring(item.title,0,25)}"/>
                    </a><c:if test="${empty item.readTime}"><img src="/img/weidu.jpg"/></c:if>
                </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>

<div style="margin-top:2px;" class="box">
    <h3>接单记录</h3>
    <div class="ui-table">
        <div class="ui-table-head">
            <table class="tableList wxtable" cellpadding="0" cellspacing="0">
                <tbody>
                <tr>
                    <th style="width:60px">订单ID</th>
                    <th>广告名称</th>
                    <th style="width:80px">广告类型</th>
                    <th style="width:120px">费用</th>
                    <th style="width:100px">计划发布日期</th>
                    <th style="width:120px">状态</th>
                    <th style="width:80px">操作</th>
                </tr>

                <c:forEach var="item" items="${adOrderList}" varStatus="status">
                <tr>
                    <td>
                       ${item.id}
                    </td>
                    <td>
                        <a href="#" onclick="ad_order_detail('${item.adId}');return false;">
                            ${item.ad.title}
                        </a>
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
                         ${item.statusStr}
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${item.status==1}">
                                <a href="#"
                                   onclick="dzsq('${item.id}','${item.ad.title}');return false;">申请对账</a>
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
</div>

</div>
</div>
﻿
</div>

<jsp:include page="/user/common/foot.jsp"/>

</div>
</div>
<script type="text/javaScript">
    $(document).ready(function () {
        $("#b1").click(function(e) {
            if(${userWxz.wzfMoney}<${setting.minZhifu}){
                layer.alert("未支付金额满" + ${setting.minZhifu} + "元才能申请结算");
                return false;
            }
            var url = "/user/zhifu/insert_load.do";
            openDialog(url, 800, 250, "yes");
        });

        $("#b2").click(function(e) {
            var url = "/wxz_sh_insert.jsp";
            window.location=url;
        });
    });
</script>

</body>
</html>