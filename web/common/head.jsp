<%@ page import="base.util.BaseIntUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    int p = BaseIntUtil.getInt(request, "p");
    pageContext.setAttribute("p",p);
%>
<style>
    a {
    color: #3d3d3d;
    text-decoration: none;
}
</style>
<link href="/css/cwq_style.css" rel="stylesheet" media="screen" type="text/css">
<link rel="stylesheet" type="text/css" href="/css/button.css"/>
<script type="text/javascript" src="/js/jquery/jquery-1.8.1.min.js"></script>
<script language="javascript" src="/js/com.js"></script>
<script language="javascript" src="/js/preview.js"></script>
<script src="/js/layer/layer.min.js"></script>

<div class="body_menu">
    <div class="new_header" id="header">
        <div class="header_box">
            <div class="logo"><a href="index.jsp" class="png" title="微利广告平台" style="cursor:pointer;"></a>
            </div>
            <div class="logotxt">微聚利量</div>
            <div class="newcwq_menu">
                <ul>
                    <li class="png<c:if test="${p==0}"> nav_cur</c:if>"><a href="/index.jsp" title="网站首页" class="png">网站首页</a></li>
                    <li class="png<c:if test="${p==1}"> nav_cur</c:if>"><a href="/wxht.jsp" class="png">微信互推</a></li>
                    <li class="png<c:if test="${p==2}"> nav_cur</c:if>"><a href="/tpgg.jsp" class="png">贴片广告</a></li>
                    <li class="png<c:if test="${p==3}"> nav_cur</c:if>"><a href="/rwgg.jsp" class="png">软文广告</a></li>
                    <%--<li class="png<c:if test="${p==4}"> nav_cur</c:if>"><a href="/demo4.jsp" class="png">成功案例</a></li>--%>
                    <li class="png<c:if test="${p==5}"> nav_cur</c:if>"><a href="/jslc.jsp" class="png">结算流程</a></li>
                    <%--<li class="png<c:if test="${p==6}"> nav_cur</c:if>"><a href="/demo6.jsp" class="png">微信大号</a></li>--%>
                    <li class="png<c:if test="${p==7}"> nav_cur</c:if>"><a href="/gywm.jsp" class="png">关于我们</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
