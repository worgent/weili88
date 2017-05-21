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
            <div class="box sub-nav" id="CooperationNav"><h3>账户充值</h3>
                <ul class="ui-list">
                    <li class="nav_opt<c:if test="${p==0}"> active</c:if>">
                        <a href="/user/chongzhi/order_insert_load.do" title="充值管理">我要充值</a>
                    </li>
                    <li class="nav_opt<c:if test="${p==1}"> active</c:if>">
                        <a href="/user/chongzhi/order_list.do" title="充值记录">充值记录</a>
                    </li>
                    <%--<li class="nav_opt<c:if test="${p==2}"> active</c:if>">--%>
                        <%--<a href="zhcz_list.jsp?p=2" title="已完成的充值">已完成的充值</a>--%>
                    <%--</li>--%>
                </ul>
            </div>
        </div>
    </div>
</div>
