<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.xiaoshuocity.com/commonTag" prefix="commonTag" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <link href="/css/list.css" rel="stylesheet" type="text/css">
    <link href="/css/form.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
    <title>新增问题咨询</title>
</head>

<body>
<div id="Holder">
    <div id="MainPage">
        <jsp:include page="/user/common/head.jsp">
            <jsp:param name="p" value="8"/>
        </jsp:include>
        <div id="MainBody" class="layout-full-width">
        <jsp:include page="left.jsp">
            <jsp:param name="p" value="2"/>
        </jsp:include>

        <div id="CooperationMain" class="layout-main box clear-fix">
            <form method="post" action="#" name="f1" id="f1">
                <input type="hidden" name="type" value="1"/>
                    <table class="formTable" width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                        <tr>
                            <td style="width: 100px;text-align: right;">
                                标题 :
                            </td>
                            <td style="text-align: left;padding-left:10px;    ">
                                <input type="text" name="title" id="title" size="124"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="left">
                                内容:
                            </td>
                            <td>
                                <textarea rows="10" cols="40" id="content" name="content"></textarea>
                                <script type="text/javascript">
                                    var editor = CKEDITOR.replace('content', { height: '420px', width: '880px' });
                                </script>
                            </td>
                        </tr>
                        <tr>
                            <td class="left"></td>
                            <td>
                                <input id="b1" type="button" value="提交" class="button blue medium"
                                       style="cursor: pointer;"/>
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
<script type="text/javaScript">
    var flag = 1;
    var url = '/user/message/insert.do';
    $(document).ready(function () {
        $("#b1").click(function(e) {
            if ($("#title").val() == '') {
                flag = 1;
                layer.msg('标题不能为空!');
                return false;
            }
            if (editor.document.getBody().getText() == '') {
                flag = 1;
                layer.msg('内容不能为空!');
                return false;
            }
            var html = editor.document.getBody().getHtml();
            $("#content").val(html);

            if (flag != 1) {
                flag = 1;
                layer.msg('请不要重复提交!');
                return false;
            }
            flag = 0;
            jQuery.post(url, $("#f1").serialize(), function(jsonobj) {
                if (jsonobj.code == "200") {
                    flag = 1;
                    layer.msg(jsonobj.msg);
                    window.location.href = "/user/message/wtzx_list.do";
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