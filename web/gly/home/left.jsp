<%@ page import="base.util.BaseIntUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    int p = BaseIntUtil.getInt(request, "p");
    pageContext.setAttribute("p",p);
%>

<div class="layout-sidebar">
    <div>
        <div class="ui-unmenu">
            <div class="box sub-nav" id="AccountNav"><h3>我的账户</h3>
                <ul class="ui-list">
                    <li class="nav_opt <c:if test="${p==0}">active</c:if>">
                        <a href="/gly/home/index.do" title="概况">概况</a>
                    </li>
                    <li class="nav_opt <c:if test="${p==1}">active</c:if>">
                        <a href="/gly/home/user_info.do" title="账户信息">账户信息</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
