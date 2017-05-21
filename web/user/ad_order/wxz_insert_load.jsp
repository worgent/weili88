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
    <title>${ad.typeStr}广告接单</title>
    <link href="/css/table.css" rel="stylesheet" type="text/css">
    <link href="/css/button.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/jquery/jquery-1.8.1.min.js"></script>
    <script language="javascript" src='/js/plug-in/My97DatePicker/WdatePicker.js'></script>
    <script src="/js/layer/layer.min.js"></script>
</head>

<body>

<%
    int p = BaseIntUtil.getInt(request, "p");
    int status = BaseIntUtil.getInt(request, "status");
    pageContext.setAttribute("p", p);
    pageContext.setAttribute("status", status);
%>

<table class="infoTable" width="100%" cellspacing="0" cellpadding="5">
    <caption>基本信息:</caption>
    <tbody>
    <tr>
        <th>
            广告ID:
        </th>
        <td>
            ${ad.id}
        </td>
        <th>
            报价:
        </th>
        <td>
            ${ad.priceStr}/千粉
        </td>
        <th>
            粉丝数要求:
        </th>
        <td>
            ${ad.fans}
        </td>
    </tr>
    <tr>
        <th>
            ${ad.typeStr}名称:
        </th>
        <td colspan="5">
            ${ad.title}
        </td>
    </tr>

    <tr>
        <th>
            行业要求:
        </th>
        <td colspan="5">
            ${ad.industryNames}
        </td>
    </tr>
    <tr>
        <th>
            地区要求:
        </th>
        <td colspan="5">
            ${ad.areaNames}
        </td>
    </tr>
    <c:choose>
        <c:when test="${ad.type==1}">
            <tr>
                <th>
                    缩略图:
                </th>
                <td colspan="5">
                    <img src="${ad.photo}" width="50%"/>
                </td>
            </tr>
        </c:when>
        <c:when test="${ad.type==2}">
            <tr>
                <th>
                    软文效果:
                </th>
                <td colspan="5">
                    <a href="/user/ad/preview_rw.jsp" target="_blank">预览</a>
                </td>
            </tr>
        </c:when>
        <c:when test="${ad.type==10}">
            <tr>
                <th>
                    内容:
                </th>
                <td colspan="5">
                        ${ad.content}
                </td>
            </tr>
        </c:when>
    </c:choose>
    </tbody>
</table>
<form method="post" action="wxz_insert_load.jsp#" name="f1" id="f1">
    <input type="hidden" name="adId" value="${ad.id}"/>
    <table class="infoTable" width="80%" cellspacing="0" cellpadding="0">
        <caption>接单</caption>
        <tbody>
        <tr>
            <th>
                我粉丝数 :
            </th>
            <td style="text-align: left;padding-left:10px; ">
                ${userWxz.numFans}
            </td>
        </tr>
        <tr>
            <th>
                费用 :
            </th>
            <td style="text-align: left;padding-left:10px; ">
                ${amountStr}
            </td>
        </tr>
        <tr>
            <th>
                计划发布日期:
            </th>
            <td style="text-align: left;padding-left:10px;    ">
                <input type="text" class="Wdate"
                       onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{\'${dayMin}\'}',maxDate:'#F{\'${dayMax}\'}'})"
                       name="planDay" id="planDay"
                       pattern="yyyy-MM-dd"/>
            </td>
        </tr>
        <tr>
            <th>
                说明 :
            </th>
            <td style="text-align: left;padding-left:10px;line-height:175%;">
                1：费用=广告主千粉报价*微信主粉丝数<br>
                <c:choose>
                    <c:when test="${ad.type==1}">
                        2：微信主必须在计划发布日期当天的多图文中最少有4篇文章包含本贴片广告。
                    </c:when>
                    <c:when test="${ad.type==2}">
                        2：微信主必须在计划发布日期当天发布此软文广告,位置不限。
                    </c:when>
                    <c:when test="${ad.type==10}">
                        2：微信主必须在计划发布日期当天的多图文中最少有4篇文章包含本微信互推广告。
                    </c:when>
                </c:choose>
                <br>3：计划发布日期从今天开始算三天之内的某一天,未在计划发布日期内发布的无效
            </td>
        </tr>

        <tr style="height:40px;">
            <td style="width: 150px;text-align: right;">

            </td>
            <td style="text-align: left;padding-left:10px;">
                <input id="b1" type="button" value="接单" class="button blue medium"
                       style="cursor: pointer;"/></td>
            </td>
        </tr>

        </tbody>
    </table>
</form>
<script type="text/javaScript">
    var flag = 1;
    var url = '/user/ad_order/wxz_ajax_insert.do';
    $(document).ready(function () {
        $("#b1").click(function(e) {
            if ($("#planDay").val() == '') {
                flag = 1;
                layer.msg('计划发布日期不能为空!');
                return false;
            }

            if (flag != 1) {
                flag = 1;
                layer.msg('请不要重复提交!');
                return false;
            }
            flag = 0;
            jQuery.post(url, $("#f1").serialize(), function(jsonobj) {
                if (jsonobj.code == "200") {
                    flag = 1;
                    layer.msg("接单成功");
                    self.opener.location.reload();
                    window.close();
                } else {
                    flag = 1;
                    layer.alert("操作失败了:" + jsonobj.msg);
                }
            }, "json");
        });
    });
</script>
</body>
</html>