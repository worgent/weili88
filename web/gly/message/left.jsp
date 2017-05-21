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
            <div class="box sub-nav"><h3>系统消息</h3>
                <ul class="ui-list">
                    <li class="nav_opt <c:if test="${p==10}">active</c:if>">
                        <a href="/gly/message/xtxx_list.do" title="系统消息">系统消息</a>
                    </li>
                    <li class="nav_opt<c:if test="${p==11}"> active</c:if>">
                        <a href="/gly/message/xtxx_insert.jsp" title="私人消息发件箱">新增系统消息</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div>
        <div class="ui-unmenu">
            <div class="box sub-nav"><h3>问题咨询</h3>
                <ul class="ui-list">
                    <li class="nav_opt<c:if test="${p==0}"> active</c:if>">
                        <a href="/gly/message/wtzx_list.do" title="未回复问题">未回复问题<c:if test="${wtzxCountUnBack>0}">(${wtzxCountUnBack})</c:if></a>
                    </li>
                    <li class="nav_opt<c:if test="${p==1}"> active</c:if>">
                        <a href="/gly/message/wtzx_list.do?back=1" title="已回复问题">已回复问题</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

</div>
