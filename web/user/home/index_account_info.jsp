<%@ page import="base.bean.PageBean" %>
<%@ page import="base.util.BaseIntUtil" %>
<%@ page import="base.util.BaseStringUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <link href="/css/list.css" rel="stylesheet" type="text/css">
    <link href="/css/form.css" rel="stylesheet" type="text/css">

    <title>账户信息</title>

    <%
        int p = BaseIntUtil.getInt(request, "p");
        pageContext.setAttribute("p",p);
    %>
</head>

<body>
<div id="Holder">
    <div id="MainPage">
        <jsp:include page="/user/common/head.jsp">
            <jsp:param name="p" value="0"/>
        </jsp:include>
        <div id="MainBody" class="layout-full-width">
        <jsp:include page="left.jsp">
            <jsp:param name="p" value="1"/>
        </jsp:include>

        <div id="CooperationMain" class="layout-main box clear-fix" style="height:500px;">
        <div class="layout-block-header" style="padding-top: 14px;padding-bottom: 14px;padding-left: 20px">
            <h2>账户信息</h2>
        </div>
            <table class="formTable" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tbody>
                <tr>
                    <td class="tdl">
                        用户名 :
                    </td>
                    <td class="tdr">
                        weixinzhu_0
                    </td>
                </tr>
                <tr>
                    <td class="tdl">
                        手机 :
                    </td>
                    <td class="tdr">
                        15652627725
                    </td>
                </tr>
                <tr>
                    <td class="tdl">
                        QQ :
                    </td>
                    <td class="tdr">
                        357656849
                    </td>
                </tr>
                <tr>
                    <td class="tdl">
                        邮箱 :
                    </td>
                    <td class="tdr">
                        357656849@qq.com
                    </td>
                </tr>
                <tr>
                    <td class="tdl">
                        支付宝账户 :
                    </td>
                    <td class="tdr">
                        357656849@qq.com
                    </td>
                </tr>
                <tr>
                    <td class="tdl">
                        账户类型 :
                    </td>
                    <td class="tdr">
                        订阅号
                    </td>
                </tr>
                <tr>
                    <td class="tdl">
                        介绍 :
                    </td>
                    <td class="tdr">
                        每天发布小说，笑话，美女
                    </td>
                </tr>
                <tr>
                    <td class="tdl">
                        行业分类 :
                    </td>
                    <td class="tdr">
                        时尚
                    </td>
                </tr>
                <tr>
                    <td class="tdl">
                        粉丝所在地区 :
                    </td>
                    <td class="tdr">
                        全国
                    </td>
                </tr>
                <tr>
                    <td class="tdl">
                        粉丝数 :
                    </td>
                    <td class="tdr">
                        6226
                    </td>
                </tr>
                <tr>
                    <td class="tdl">
                        阅读率 :
                    </td>
                    <td class="tdr">
                        0.3
                    </td>
                </tr>
                </tbody>
            </table>
            </div>
        </div>

        <jsp:include page="/user/common/foot.jsp"/>

    </div>
</div>

</body>
</html>