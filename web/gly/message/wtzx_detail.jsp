<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <link href="/css/list.css" rel="stylesheet" type="text/css">
    <link href="/css/form.css" rel="stylesheet" type="text/css">
    <link href="/css/button.css" rel="stylesheet" type="text/css">
    <title>${message.title}</title>
    <script type="text/javascript" src="/js/jquery/jquery-1.8.1.min.js"></script>
    <script language="javascript" src="/js/com.js"></script>
    <script src="/js/layer/layer.min.js"></script>
</head>

<body>
<table class="formTable" width="100%" border="0" cellspacing="0" cellpadding="0">
    <tbody>
    <tr>
        <td class="tdl">
            标题 :
        </td>
        <td class="tdr">
            ${message.title}
        </td>
        <td class="tdl">
            发送时间 :
        </td>
        <td class="tdr">
            <fmt:formatDate value="${message.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
        </td>
    </tr>
    <tr>
        <td class="tdl">
            发件人 :
        </td>
        <td class="tdr">
            ${message.senderUser.chineseName}
        </td>
        <td class="tdl">
            发件人类型 :
        </td>
        <td class="tdr">
            ${message.senderUser.typeName}
        </td>
    </tr>
    <tr>
        <td class="tdl">
            内容2 :
        </td>
        <td colspan="3" class="tdr" style="line-height: 175%">
            ${message.content}
        </td>
    </tr>
    <c:choose>
        <c:when test="${not empty message.back}">
            <tr>
                <td class="tdl">
                    回复
                </td>
                <td class="tdr">
                        ${message.back2}
                </td>
                <td class="tdl">
                    回复时间 :
                </td>
                <td class="tdr">
                    <fmt:formatDate value="${message.backTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </td>
            </tr>
        </c:when>
        <c:otherwise>
            <form method="post" action="#" name="f1" id="f1">
                <input type="hidden" name="id" value="${message.id}"/>
                <tr>
                    <td class="tdl">
                        回复
                    </td>
                    <td class="tdr" colspan="3">
                        <input type="text" width="120" size="80" name="back"/>
                        <input id="b1" type="button" value="提交" class="button blue medium"
                               style="cursor: pointer;"/></td>

                    </td>
                </tr>
            </form>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>

<script type="text/javaScript">
    var flag = 1;
    var url = '/gly/message/wtzx_back.do';
    $(document).ready(function () {
        $("#b1").click(function(e) {
            if ($("#back").val() == '') {
                flag = 1;
                layer.msg('回复内容不能为空!');
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
                    layer.msg(jsonobj.msg);
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