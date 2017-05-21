<%@ page import="base.util.BaseIntUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    int p = BaseIntUtil.getInt(request, "p");
    pageContext.setAttribute("p",p);
%>
<script type="text/javascript">
    function detail(id) {
        var url = "/user/ad/detail.do?id=" + id;
        openDialog(url, 1000, 650, "yes");
    }
</script>

<div class="layout-sidebar">
    <div>
        <div class="ui-unmenu">
            <div class="box sub-nav"><h3>需要确认的记录</h3>
                <ul class="ui-list">
                    <li class="nav_opt<c:if test="${p==21}"> active</c:if>">
                        <a href="/gly/ad_order/dzsq_list_yes.do" title="申请对账记录">已申请对账记录</a>
                    </li>
                    <li class="nav_opt<c:if test="${p==24}"> active</c:if>">
                        <a href="/gly/ad_order/zxqr_list_no_ggz.do" title="广告主确认不通过的记录">广告主确认不通过的记录</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div>
        <div class="ui-unmenu">
            <div class="box sub-nav"><h3>已确认的记录</h3>
                <ul class="ui-list">
                    <li class="nav_opt<c:if test="${p==25}"> active</c:if>">
                        <a href="/gly/ad_order/zxqr_list_no_gly.do" title="管理员确认不通过的记录">管理员确认不通过的记录</a>
                    </li>
                    <li class="nav_opt<c:if test="${p==23}"> active</c:if>">
                        <a href="/gly/ad_order/zxqr_list_yes.do" title="确认通过的记录">确认通过的记录</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div>
        <div class="ui-unmenu">
            <div class="box sub-nav"><h3>不需要确认的记录</h3>
                <ul class="ui-list">
                    <li class="nav_opt<c:if test="${p==22}"> active</c:if>">
                        <a href="/gly/ad_order/dzsq_list_no.do" title="未申请对账记录">未申请对账记录</a>
                    </li>
                    <li class="nav_opt<c:if test="${p==26}"> active</c:if>">
                        <a href="/gly/ad_order/list_close.do" title="逾期被系统关闭的记录">逾期被系统关闭的记录</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

</div>
