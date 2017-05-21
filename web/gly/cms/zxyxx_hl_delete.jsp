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
    <jsp:param name="p" value="6"/>
</jsp:include>

<div id="MainBody" class="layout-full-width">
<jsp:include page="left.jsp">
    <jsp:param name="p" value="1"/>
</jsp:include>

<div id="CooperationMain" class="layout-main box clear-fix">
<div class="layout-block-header">

    <h2><a style="color: #333" href="zxyxx_hl_delete.jsp" title="已删除的画廊">已删除的画廊</a>
    </h2>
</div>
    <jsp:include page="../../guanliyuan/common/zxyxx_hl_top.jsp">
        <jsp:param name="p" value="2"/>
    </jsp:include>
<div id="AdposListTableBar">
    <div style="width: 1153px;" class="ui-table-body">
        <table class="tableList" width="100%" cellpadding="0" cellspacing="0">
            <tbody>
            <tr>
                <th style="width: 60px;">
                    ID号
                </th>
                <th style="width: 120px;">
                    操作
                </th>
                <th style="width: 100px;">
                    分类
                </th>
                <th style="width: 300px;">
                    缩略图
                </th>
                <th>
                    链接地址
                </th>
                <th style="width: 100px;">
                    删除时间
                </th>
            </tr>

            <%
                for (int i = 0; i < 5; i++) {
            %>
            <tr>
                <td>
                   <%=100+i%>
                </td>
                <td>
                   <a href="zxyxx_hl_delete.jsp#">恢复</a>
                </td>
                <td>
                    <%
                        if(i%2==0){
                    %>
                    首页
                    <%
                        }else{
                    %>
                    友情链接
                    <%
                        }
                    %>
                </td>
                <td>
                    <img src="http://www.weili88.cn/news_skin/images/banner/about_banner.jpg" width="300" height="120"/>
                </td>
                <td>
                    http://www.weili88.cn/member/my.php?acmy=myb
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