<%@ page import="base.util.BaseIntUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.xiaoshuocity.com/commonTag" prefix="commonTag" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <title>${ad.title}</title>
    <link rel="stylesheet" type="text/css"
          href="/css/page_mp_article2248c4.css">
</head>
<body id="activity-detail" class="zh_CN ">
<div class="rich_media ">

<%
int p = BaseIntUtil.getInt(request, "p");
pageContext.setAttribute("p",p);
%>

<div class="rich_media_inner"><h2 class="rich_media_title" id="activity-name"> ${ad.title} </h2>

<div class="rich_media_meta_list">
    <em id="post-date" class="rich_media_meta text">
        <fmt:formatDate value="${ad.createTime}" pattern="yyyy-MM-dd"/>
    </em>
</div>
<div id="page-content">
<div id="img-content">


<div class="rich_media_content" id="js_content">
    ${ad.content}
    </div>
    <script type="text/javascript">
    var first_sceen__time = (+new Date());
</script>
</div>
</div>
</div>

</div>
</body>
</html>