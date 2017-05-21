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
            <div class="box sub-nav" id="CooperationNav"><h3>账户首页</h3>
                <ul class="ui-list">
                    <li class="nav_opt<c:if test="${p==0}"> active</c:if>">
                        <a href="/user/home/index.do" title="贴片订单">概况</a>
                    </li>
                    <li class="nav_opt<c:if test="${p==1}"> active</c:if>">
                        <a href="/user/home/user_info.do" title="账户信息">账户信息</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div id="Hints" class="box sub-nav"><h3>帮助</h3>
        <ul class="ui-list" data-control="HintList" id="ctrllistHintList" ui="">
            <li><a href="left.jsp#" target="_blank">如何赚钱？</a></li>
            <li><a href="left.jsp#" target="_blank">申请结算流程？</a></li>
            <li><a href="left.jsp#" target="_blank">平台收取多少手续费？</a></li>
            <li><a href="left.jsp#" target="_blank">如何获得积分？</a></li>
            <li><a href="left.jsp#" target="_blank">积分可以做什么？</a></li>
        </ul>
    </div>
</div>
