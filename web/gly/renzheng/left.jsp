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
            <div class="box sub-nav"><h3>粉丝数认证</h3>
                <ul class="ui-list">
                    <li class="nav_opt<c:if test="${p==1}"> active</c:if>">
                        <a href="/gly/renzheng/wxz_rz_list.do?status=1" title="未审核记录">未审核记录</a>
                    </li>
                    <li class="nav_opt<c:if test="${p==2}"> active</c:if>">
                        <a href="/gly/renzheng/wxz_rz_list.do?status=2" title="审核通过记录">审核通过记录</a>
                    </li>
                    <li class="nav_opt<c:if test="${p==3}"> active</c:if>">
                        <a href="/gly/renzheng/wxz_rz_list.do?status=3" title="审核不通过记录">审核不通过记录</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

</div>
