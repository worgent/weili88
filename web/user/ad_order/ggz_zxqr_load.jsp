<%@ page import="base.util.BaseIntUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.xiaoshuocity.com/commonTag" prefix="commonTag" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <title>对账申请</title>
    <link href="/css/table.css" rel="stylesheet" type="text/css">
    <link href="/css/button.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/jquery/jquery-1.8.1.min.js"></script>
    <script src="/js/layer/layer.min.js"></script>
</head>

<body>

<table class="infoTable" width="80%" cellspacing="0" cellpadding="0">
    <caption>对账申请</caption>
</table>

<form method="post" action="/user/ad_order/wxz_dzsq.do" name="f1" id="f1" enctype="multipart/form-data">
    <input type="hidden" name="adOrderId" value="${adOrder.id}"/>

<c:forEach items="${adOrderUrlList}" var="adOrderUrl" varStatus="item">
    <table class="infoTable" width="80%" cellspacing="0" cellpadding="0">
        <tbody>
        <tr>
            <th>
                文章标题 :
            </th>
            <td style="text-align: left;padding-left:10px; ">
                ${adOrderUrl.title}
            </td>
        </tr>
        <tr>
            <th>
                文章地址 :
            </th>
            <td style="text-align: left;padding-left:10px; ">
                ${adOrderUrl.url}
            </td>
        </tr>
        <tr>
            <th>
                图文分析截图:
            </th>
            <td style="text-align: left;padding-left:10px;    ">
                <img src="${adOrderUrl.photo}" width="600"/>
            </td>
        </tr>
        </tbody>
    </table>
    <p></p>
</c:forEach>

    <table class="infoTable" width="80%" cellspacing="0" cellpadding="0">
        <tbody>

        <tr style="height:40px;">
            <td style="text-align: center" colspan="2">
                <input id="b1" type="button" value="确认通过" class="button blue medium"
                       style="cursor: pointer;"/>

                <input id="b2" type="button" value="确认不通过" class="button green medium"
                       style="cursor: pointer;"/>

            </td>
            </td>
        </tr>

        </tbody>
    </table>
</form>

<script type="text/javaScript">
    var url = '/user/ad_order/wxz_ajax_dzsq.do';
    $(document).ready(function () {
        $("#b1").click(function(e) {
             tg(${adOrder.id},1) ;
        });
        $("#b2").click(function(e) {
             tg(${adOrder.id},0) ;
        });
    });

    function tg(id, status) {
        var operate = "不通过";
        if(status==1){
          operate = "通过";
        }
        layer.confirm("确认要对此广告ID=" + id + "的记录执行确认" + operate + "操作吗？", function(index) {
            var url = "/user/ad_order/ggz_ajax_zxqr.do?id=" + id + "&status=" + status;
            jQuery.post(url, {id:id}, function(jsonobj) {
                if (jsonobj.code == "200") {
                    layer.msg(jsonobj.msg);
                    self.opener.location.reload();
                    window.close();
                } else {
                    layer.alert("操作失败了:" + jsonobj.msg);
                }
            }, "json");

        });
    }

</script>

</body>
</html>