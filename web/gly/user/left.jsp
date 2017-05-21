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
            <div class="box sub-nav"><h3>账户管理</h3>
                <ul class="ui-list">
                    <li class="nav_opt<c:if test="${p==10}"> active</c:if>">
                        <a href="/gly/user/user_list.do?type=10" title="广告主">广告主</a>
                    </li>
                    <li class="nav_opt<c:if test="${p==20}"> active</c:if>">
                        <a href="/gly/user/user_list.do?type=20" title="微信主">微信主</a>
                    </li>
                    <li class="nav_opt<c:if test="${p==30}"> active</c:if>">
                        <a href="/gly/user/user_list.do?type=30" title="管理员">管理员</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

</div>
