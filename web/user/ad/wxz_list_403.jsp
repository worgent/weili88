<%@ page import="base.bean.PageBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.xiaoshuocity.com/commonTag" prefix="commonTag" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <link href="/css/list.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/css/page.css"/>
    <title>${typeName}广告列表</title>
</head>

<body>
<div id="Holder">
<div id="MainPage">
<jsp:include page="/user/common/head.jsp">
    <jsp:param name="p" value="2"/>
</jsp:include>
<div id="MainBody" class="layout-full-width">
<jsp:include page="wxz_left.jsp">
    <jsp:param name="p" value="${param.type}"/>
</jsp:include>
<div id="CooperationMain" class="layout-main box clear-fix">
<div class="layout-block-header"><h2>${typeName}广告列表</h2></div>

<div id="AdposListTableBar">
    <style>
        .center{ MARGIN-RIGHT: auto;
MARGIN-LEFT: auto;
height:400px;
width:400px;
vertical-align:middle;
line-height:400px;
    font-size: 18px;
    </style>

<div class="center">

抱歉,只有${role}用户才能访问此页面!

</div>

<div class="pageblk" style="padding-top:15px;padding-bottom:15px;">
    <commonTag:page limit="5" pageBean="${pageBean}" urlString="${urlString}" anchor="m1"/>
</div>

</div>
</div>

<jsp:include page="/user/common/foot.jsp"/>

</div>
</div>
<script type="text/javascript">
    function updateStauts(id, title,status) {
        var operate = "启用";
        if(status==1){
          operate = "关闭";
        }
        layer.confirm("确认" + operate + "《" + title + "》吗？", function(index) {
            var url = "/user/ad/ggz_ajax_status.do?id=" + id;
            jQuery.post(url, {id:id}, function(jsonobj) {
                if (jsonobj.code == "200") {
                    layer.msg(jsonobj.msg);
                    location.reload();
                } else {
                    layer.alert("操作失败了:" + jsonobj.msg);
                }
            }, "json");

        });
    }
</script>

</body>
</html>