<%@ page import="base.bean.PageBean" %>
<%@ page import="base.util.BaseIntUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <link href="/css/list.css" rel="stylesheet" type="text/css">
    <link href="/css/form.css" rel="stylesheet" type="text/css">
    <%
        int p = BaseIntUtil.getInt(request, "p");
        pageContext.setAttribute("p", p);
       String title = "您有一条订单返款信息";
        if(p>0){
            title = "为什么钱扣了,对方没有发布";
        }
        pageContext.setAttribute("title", title);
    %>
    <title>账户充值</title>
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
            ${title}
        </td>
        <td class="tdl">
            发送时间 :
        </td>
        <td class="tdr">
            2014-12-12 12:12:12
        </td>
    </tr>
    <tr>
        <td class="tdl">
            内容 :
        </td>
        <td colspan="3" class="tdr" style="line-height: 175%">
            ${title}${title}<br>
            ${title}${title}<br>
            ${title}${title}<br>
            ${title}${title}<br>
            ${title}${title}<br>
            ${title}${title}<br>
        </td>
    </tr>
    <c:if test="${p>0}">
    <tr>
        <td class="tdl">
          回复
        </td>
        <td class="tdr">
            正在审核,确认后会将钱返回您账户
        </td>
        <td class="tdl">
            回复时间 :
        </td>
        <td class="tdr">
            2014-12-12 12:12:12
        </td>
    </tr>
        </c:if>
    </tbody>
</table>

</body>
</html>