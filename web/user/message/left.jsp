<%@ page import="base.util.BaseIntUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    int p = BaseIntUtil.getInt(request, "p");
    pageContext.setAttribute("p", p);
%>

<div class="layout-sidebar">
    <div>
        <div class="ui-unmenu">
            <div class="box sub-nav"><h3>系统消息</h3>
                <ul class="ui-list">
                    <li class="nav_opt<c:if test="${p==0}"> active</c:if>">
                        <a href="/user/message/xtxx_list.do" title="系统消息">
                            系统消息
                            <c:if test="${unReadCountXtxx>0}">
                                (${unReadCountXtxx})
                            </c:if>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div>
        <div class="ui-unmenu">
            <div class="box sub-nav"><h3>问题咨询</h3>
                <ul class="ui-list">
                    <li class="nav_opt<c:if test="${p==1}"> active</c:if>">
                        <a href="/user/message/wtzx_list.do" title="我的问题">
                            我的问题
                        </a>
                    </li>
                    <li class="nav_opt<c:if test="${p==2}"> active</c:if>">
                        <a href="/user/message/wtzx_insert.jsp" title="创建问题">创建问题</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
