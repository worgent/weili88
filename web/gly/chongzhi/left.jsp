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
            <div class="box sub-nav"><h3>充值订单</h3>
                <ul class="ui-list">
                    <li class="nav_opt<c:if test="${p==0}"> active</c:if>">
                        <a href="/gly/chongzhi/list.do" title="完成充值的订单">完成充值的订单</a>
                    </li>
                    <li class="nav_opt<c:if test="${p==1}"> active</c:if>">
                        <a href="/gly/chongzhi/list.do?status=1" title="未完成充值的订单">未完成充值的订单</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

</div>
