<%@ page import="base.util.BaseIntUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    int p = BaseIntUtil.getInt(request, "p");
    pageContext.setAttribute("p",p);
%>

<div class="layout-sidebar">
    <div id="SubNav">
        <div class="ui-unmenu">
            <div class="box sub-nav" id="CooperationNav"><h3>广告接单</h3>
                <ul class="ui-list">
                    <li class="nav_opt<c:if test="${p==1}"> active</c:if>">
                        <a href="/user/ad/wxz_list.do?type=1" title="贴片广告">贴片广告</a>
                    </li>
                        <li class="nav_opt<c:if test="${p==2}"> active</c:if>">
                            <a href="/user/ad/wxz_list.do?type=2" title="软文广告">软文广告</a>
                        </li>
                        <li class="nav_opt<c:if test="${p==10}"> active</c:if>">
                            <a href="/user/ad/wxz_list.do?type=10" title="微信互推">微信互推</a>
                        </li>
                </ul>
            </div>
        </div>
    </div>
</div>
