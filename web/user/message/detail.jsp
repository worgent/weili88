<%@ page import="base.util.BaseIntUtil" %>
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
            收件人 :
        </td>
        <td class="tdr">
            ${message.receiverUser.chineseName}
        </td>
        <td class="tdl">
            发件人 :
        </td>
        <td class="tdr">
            ${message.senderUser.chineseName}
        </td>
    </tr>
    <tr>
        <td class="tdl">
            内容 :
        </td>
        <td colspan="3" class="tdr" style="line-height: 175%">
            ${message.content}
        </td>
    </tr>
    
    <c:if test="${message.type<100}">
        <tr>
            <td class="tdl">
              回复
            </td>
            <c:choose>
                <c:when test="${not empty message.back}">
                    <td class="tdr">
                        ${message.back}
                    </td>
                    <td class="tdl">
                        回复时间 :
                    </td>
                    <td class="tdr">
                        <fmt:formatDate value="${message.backTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                    </td>
                </c:when>
                <c:otherwise>
                     <td class="tdr" colspan="3">
                        暂未回复
                    </td>
                </c:otherwise>
            </c:choose>
        </tr>
    </c:if>
    </tbody>
</table>

</body>
</html>