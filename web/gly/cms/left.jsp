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
            <div class="box sub-nav"><h3>内容管理</h3>
                <ul class="ui-list">
                    <li class="nav_opt<c:if test="${p==0}"> active</c:if>">
                        <a href="/gly/cms/cms_list.do" title="资讯管理">有效记录</a>
                    </li>
                    <li class="nav_opt<c:if test="${p==1}"> active</c:if>">
                        <a href="/gly/cms/cms_list.do?status=-1" title="画廊管理">无效记录</a>
                    </li>
                    <li class="nav_opt<c:if test="${p==2}"> active</c:if>">
                        <c:choose>
                            <c:when test="${not empty param.id && p==2}">
                                <a href="/gly/cms/content_insert_load.do" title="修改">修改</a>
                            </c:when>
                            <c:otherwise>
                                <a href="/gly/cms/content_insert_load.do" title="增加">增加</a>
                            </c:otherwise>
                        </c:choose>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div>
        <div class="ui-unmenu">
            <div class="box sub-nav"><h3>画廊管理</h3>
                <ul class="ui-list">
                    <li class="nav_opt<c:if test="${p==10}"> active</c:if>">
                        <a href="/gly/cms/cms_list.do?type=2" title="资讯管理">有效记录</a>
                    </li>
                    <li class="nav_opt<c:if test="${p==11}"> active</c:if>">
                        <a href="/gly/cms/cms_list.do?type=2&status=-1" title="画廊管理">无效记录</a>
                    </li>
                    <li class="nav_opt<c:if test="${p==12}"> active</c:if>">
                        <c:choose>
                            <c:when test="${not empty param.id && p==12}">
                                <a href="/gly/cms/photo_insert_load.do" title="修改">修改</a>
                            </c:when>
                            <c:otherwise>
                                <a href="/gly/cms/photo_insert_load.do" title="增加">增加</a>
                            </c:otherwise>
                        </c:choose>
                    </li>
                </ul>
            </div>
        </div>
    </div>


</div>
