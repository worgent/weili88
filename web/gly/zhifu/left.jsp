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
            <div class="box sub-nav"><h3>支付审核</h3>
                <ul class="ui-list">
                    <li class="nav_opt<c:if test="${p==0}"> active</c:if>">
                        <a href="/gly/zhifu/list.do?sh=0" title="未审核的记录">未审核的记录</a>
                    </li>
                    <li class="nav_opt<c:if test="${p==1}"> active</c:if>">
                        <a href="/gly/zhifu/list.do?sh=1" title="审核通过的记录">审核通过的记录</a>
                    </li>
                    <li class="nav_opt<c:if test="${p==2}"> active</c:if>">
                        <a href="/gly/zhifu/list.do?sh=2" title="已付款的记录">已付款的记录</a>
                    </li>
                    <li class="nav_opt<c:if test="${p==3}"> active</c:if>">
                        <a href="/gly/zhifu/list.do?sh=3" title="审核不通过的记录">审核不通过的记录</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
