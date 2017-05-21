<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.xiaoshuocity.com/commonTag" prefix="commonTag" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <link href="/css/list.css" rel="stylesheet" type="text/css">
    <%--<link rel="stylesheet" type="text/css" href="/css/page.css"/>--%>
    <link href="/css/form.css" rel="stylesheet" type="text/css">
    <link href="/css/button.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/css/page.css"/>
    <script type="text/javascript" src="/js/jquery/jquery-1.8.1.min.js"></script>
    <script src="/js/layer/layer.min.js"></script>
    <title>新增微信地址</title>
</head>
<body>
<div id="Holder">
    <div id="MainPage">

        <div id="MainBody" class="layout-full-width">

            <div id="CooperationMain" class="box clear-fix">
                <form method="post" action="/content/url_insert.do" name="f1" id="f1" enctype="multipart/form-data">
                    <table class="formTable" width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                        <tr>
                            <td style="width: 100px;text-align: right;">
                                密码:
                            </td>
                            <td style="text-align: left;padding-left:10px;    ">
                                <input type="text" size="20" name="pwd"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px;text-align: right;">
                                微信:
                            </td>
                            <td style="text-align: left;padding-left:10px;    ">
                                <select name="weixinId" id="weixinId">
                                    <option value="1">美女笑话</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px;text-align: right;">
                                链接地址:
                            </td>
                            <td style="text-align: left;padding-left:10px;    ">
                                <input type="text" size="124" name="url"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px;text-align: right;" valign="top">
                                简介:
                            </td>
                            <td style="text-align: left;padding-left:10px;    ">
                                <textarea name="brief" cols="120" rows="4"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px;text-align: right;">
                                上传图片:
                            </td>
                            <td style="text-align: left;padding-left:10px;    ">
                                <input type="file" name="file" id="file" size="60"/>
                            </td>
                        </tr>

                        <tr>
                            <td class="left"></td>
                            <td>
                                <input id="b1" type="button" value="提交" class="button blue medium"
                                       style="cursor: pointer;"/></td>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
        <div class="layout-full-width">

            <div class="box clear-fix">
                <div class="layout-block-header" style="text-align: right;">
                    <input id="b2" type="button" value="手工生成今日json" class="button green medium"
                                       style="cursor: pointer;"/>
                </div>
                <div id="AdposListTableBar">
                    <div class="ui-table-body">
                        <table class="tableList" width="100%" cellpadding="0" cellspacing="0">
                            <tbody>
                            <tr>
                                <th style="width: 80px;">
                                    ID号
                                </th>
                                <th >
                                    标题
                                </th>
                                <th style="width: 80px;">
                                    抓取批次
                                </th>
                            </tr>
                            <c:forEach var="item" items="${list}" varStatus="status">
                                <tr>
                                    <td>
                                        ${item.id}
                                    </td>
                                    <td>
                                        <a href="${item.url}" title="${item.title}" target="_blank">${item.title}</a>
                                    </td>
                                    <td>
                                        ${item.readDay}
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
<script type="text/javaScript">
    var url = '/content_url_insert.do';
    $(document).ready(function () {
        $("#b2").click(function(e) {
            window.location="/content/url_json.do";
        });

        $("#b1").click(function(e) {
            if ($("#url").val() == '') {
                layer.msg('连接地址不能为空!');
                return false;
            }
//            jQuery.post(url, $("#f1").serialize(), function(jsonobj) {
//                if (jsonobj.code == "200") {
//                    layer.msg(jsonobj.msg);
//                    $("#url").val('');
//                } else {
//                    layer.alert("操作失败了:" + jsonobj.msg);
//                }
//            }, "json");

            $("#f1").submit();

        });
    });
</script>

</body>
</html>