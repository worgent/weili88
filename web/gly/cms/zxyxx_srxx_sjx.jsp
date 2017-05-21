<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.xiaoshuocity.com/commonTag" prefix="commonTag" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <link href="/css/list.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/css/page.css"/>
    <title>资讯与消息</title>
</head>

<body>
<div id="Holder">
<div id="MainPage">
    <jsp:include page="../common/head.jsp">
        <jsp:param name="p" value="8"/>
    </jsp:include>

    <div id="MainBody" class="layout-full-width">
    <jsp:include page="../message/left.jsp">
    <jsp:param name="p" value="11"/>
</jsp:include>

<div id="CooperationMain" class="layout-main box clear-fix">
<div class="layout-block-header">

    <h2><a style="color: #333" href="zxyxx_srxx_sjx.jsp" title="未读的私人消息">未读的私人消息</a>
    </h2>
</div>
    <jsp:include page="../../guanliyuan/common/zxyxx_srxx_sjx_top.jsp">
        <jsp:param name="p" value="0"/>
    </jsp:include>
<div id="AdposListTableBar">
    <div style="width: 1153px;" class="ui-table-body">
        <table class="tableList" width="100%" cellpadding="0" cellspacing="0">
            <tbody>
            <tr>
                <th style="width: 60px;">
                    ID号
                </th>
                <th>
                    标题
                </th>
                <th style="width: 150px;">
                    发件人
                </th>
                <th style="width: 150px;">
                    发件人类型
                </th>
                <th style="width: 150px;">
                    发送时间
                </th>
            </tr>

            <%
                for (int i = 0; i < 12; i++) {
            %>
            <tr>
                <td>
                    <%=100+i%>
                </td>
                <td>
                    <a href="zxyxx_srxx_sjx_detail.jsp">您的帐户信息不正确,影响财务给您打款</a>
                </td>
                <td>
                    <%
                        if(i%2==0){
                    %>
                    <a href="zxyxx_srxx_sjx.jsp#" onclick="previewGgz('<%=i%>');return false;">广告主_<%=i%></a>
                    <%
                        }else{
                    %>
                    <a href="zxyxx_srxx_sjx.jsp#" onclick="previewWxz('<%=i%>');return false;">微信主_<%=i%></a>
                    <%
                        }
                    %>
                </td>
                <td>
                    <%
                        if(i%2==0){
                    %>
                    广告主
                    <%
                        }else{
                    %>
                    微信主
                    <%
                        }
                    %>
                </td>
                <td>
                    2014-10-8 13:12:12
                </td>
            </tr>
            <%
                }
            %>

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

</body>
</html>