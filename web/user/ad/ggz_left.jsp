<%@ page import="base.util.BaseIntUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    int p = BaseIntUtil.getInt(request, "p");
    pageContext.setAttribute("p",p);
%>

<div class="layout-sidebar">
    <c:choose>
        <c:when test="${user.ggz}">
            <div>
                <div class="ui-unmenu">
                    <div class="box sub-nav"><h3>广告列表</h3>
                        <ul class="ui-list">
                            <li class="nav_opt<c:if test="${p==1}"> active</c:if>">
                                <a href="/user/ad/ggz_list_tiepian.do" title="贴片广告">贴片广告</a>
                            </li>
                            <li class="nav_opt<c:if test="${p==2}"> active</c:if>">
                                <a href="/user/ad/ggz_list_ruanwen.do" title="软文广告">软文广告</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div>
                <div class="ui-unmenu">
                    <div class="box sub-nav"><h3>广告创建</h3>
                        <ul class="ui-list">
                            <li class="nav_opt<c:if test="${p==0}"> active</c:if>">
                                <a href="/user/ad/ggz_insert_load.do?type=0" title="创建广告">贴片广告</a>
                            </li>
                            <li class="nav_opt<c:if test="${p==3}"> active</c:if>">
                                <a href="/user/ad/ggz_insert_load.do?type=3" title="创建广告">软文广告</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div>
                <div class="ui-unmenu">
                    <div class="box sub-nav"><h3>微信互推</h3>
                        <ul class="ui-list">
                            <li class="nav_opt<c:if test="${p==10}"> active</c:if>">
                                <a href="/user/ad/ggz_list_wxht.do" title="微信互推">我创建的微信互推</a>
                            </li>
                            <li class="nav_opt<c:if test="${p==4}"> active</c:if>">
                                <a href="/user/ad/ggz_insert_load.do?type=4" title="创建互推">创建微信互推</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</div>
