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
            <div class="box sub-nav"><h3>系统设置</h3>
                <ul class="ui-list">
                    <li class="nav_opt<c:if test="${p==0}"> active</c:if>">
                        <a href="/gly/setting/update_load.do" title="广告最低价格">广告最低价格</a>
                    </li>
                    <li class="nav_opt<c:if test="${p==1}"> active</c:if>">
                        <a href="/gly/setting/update_load.do?type=1" title="平台手续费">平台手续费</a>
                    </li>
                    <li class="nav_opt<c:if test="${p==2}"> active</c:if>">
                        <a href="/gly/setting/update_load.do?type=2" title="注册送积分">注册送积分</a>
                    </li>
                    <li class="nav_opt<c:if test="${p==3}"> active</c:if>">
                        <a href="/gly/setting/update_load.do?type=3" title="支付最低值">支付最低值</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

</div>
