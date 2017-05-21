<%@ page import="base.bean.PageBean" %>
<%@ page import="base.util.BaseIntUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <link href="/css/list.css" rel="stylesheet" type="text/css">
    <link href="/css/form.css" rel="stylesheet" type="text/css">

    <title>新增私人消息</title>
</head>

<body>
<div id="Holder">
    <div id="MainPage">
        <jsp:include page="../common/head.jsp">
            <jsp:param name="p" value="8"/>
        </jsp:include>

        <div id="MainBody" class="layout-full-width">
        <jsp:include page="../message/left.jsp">
            <jsp:param name="p" value="10"/>
        </jsp:include>

        <div id="CooperationMain" class="layout-main box clear-fix">
        <div class="layout-block-header">
            <h2>新增私人消息</h2>
        </div>
            <jsp:include page="../../guanliyuan/common/zxyxx_srxx_fjx_top.jsp">
                <jsp:param name="p" value="0"/>
            </jsp:include>

                <form>
                    <table class="formTable" width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                        <tr>
                            <td style="width: 100px;text-align: right;">
                                标题:
                            </td>
                            <td style="text-align: left;padding-left:10px;    ">
                                <input type="text" width="120" size="104"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px;text-align: right;">
                                收件人:
                            </td>
                            <td style="text-align: left;padding-left:10px;    ">
                                <input type="text" width="120" size="104"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px;text-align: right;">
                                内容:
                            </td>
                            <td style="text-align: left;padding-left:10px;    ">
                                <textarea cols="100" rows="15"></textarea>
                            </td>
                        </tr>

                        <tr style="height:60px;">
                            <td style="width: 150px;text-align: right;">

                            </td>
                            <td style="text-align: left;padding-left:10px;">
                                <input type="button" value="提交"/>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </form>

            </div>
        </div>

        <jsp:include page="/user/common/foot.jsp"/>

    </div>
</div>

</body>
</html>