<%@ page import="base.util.BaseIntUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.xiaoshuocity.com/commonTag" prefix="commonTag" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <title>${msg}</title>
    <script type="text/javascript" src="/js/jquery/jquery-1.8.1.min.js"></script>
    <script src="/js/layer/layer.min.js"></script>
</head>

<body>

<script type="text/javaScript">
    $(document).ready(function () {
        layer.alert("${msg}");
        self.opener.location.reload();
        window.close();
    });
</script>
</body>
</html>