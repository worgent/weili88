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
    <title>确认通过的记录</title>
</head>

<body>
<div id="Holder">
    <div id="MainPage">
        <jsp:include page="/user/common/head.jsp">
            <jsp:param name="p" value="4"/>
        </jsp:include>

        <div id="MainBody" class="layout-full-width">
            <jsp:include page="ggz_zxqr_left.jsp">
                <jsp:param name="p" value="3"/>
            </jsp:include>

            <div id="CooperationMain" class="layout-main box clear-fix">

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

            </div>
        </div>

        <jsp:include page="/user/common/foot.jsp"/>

    </div>
</div>

</body>
</html>