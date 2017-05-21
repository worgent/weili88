<%@ page import="base.util.BaseIntUtil" %>
<%@ page import="cn.taiqiu8.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tag.weili88.com" prefix="w" %>
<%
    int p = BaseIntUtil.getInt(request, "p");
    pageContext.setAttribute("p",p);
%>


<c:if test="${empty user || (!user.ggz && !user.wxz)}">
    <script type="text/javascript">
        window.location="/index.jsp";
    </script>
</c:if>

<link href="/css/common_head.css" rel="stylesheet" media="screen" type="text/css">
<link rel="stylesheet" type="text/css" href="/css/button.css"/>
<script type="text/javascript" src="/js/jquery/jquery-1.8.1.min.js"></script>
<script language="javascript" src="/js/com.js"></script>
<script language="javascript" src="/js/preview.js"></script>
<script language="javascript" src='/js/plug-in/My97DatePicker/WdatePicker.js'></script>
<script src="/js/layer/layer.min.js"></script>

<w:userDataTag/>

<div class="body_menu">
    <div class="new_header" id="header">
        <div class="topright">
            <div class="newcwq_wrap">
                <ul class="notop">
                    <li class="topfirst"><a href="/user/home/index.do">${user.chineseName}</a></li>
                    <li>
                        <a href="/user/message/xtxx_list.do" title="消息">
                            消息<c:if test="${unReadCountXtxx>0}"><b>(${unReadCountXtxx})</b></c:if>
                        </a>
                    </li>
                    <li><a href="#" title="帮助中心">帮助中心</a></li>
                    <li><a href="#" title="联系我们">联系我们</a></li>
                    <li><a href="#" onclick="javascript:logout()" title="退出" class="special">退出</a></li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
        <div class="header_box">
            <div class="logo2"><a href="/index.jsp" class="png" title="微利广告平台" style="cursor:pointer;"></a>
            </div>
            <%--<div class="logotxt">微聚利量</div>--%>
            <div class="newcwq_menu">
                <ul>
                    <%--<li class="nav_cur png"><a href="/index.jsp" title="网站首页" class="png">网站首页</a></li>--%>
                    <li class="png<c:if test="${p==0}"> nav_cur</c:if>"><a href="/user/home/index.do" class="png">账户首页</a></li>
                     <c:choose>
                         <c:when test="${user.ggz}">
                             <li class="png<c:if test="${p==1}"> nav_cur</c:if>"><a href="/user/ad/ggz_list_tiepian.do" class="png">广告创建</a></li>
                             <li class="png<c:if test="${p==4}"> nav_cur</c:if>"><a href="/user/ad_order/ggz_dzsq_list_yes.do" class="png">执行确认</a></li>
                             <li class="png<c:if test="${p==5}"> nav_cur</c:if>"><a href="/user/chongzhi/order_insert_load.do" class="png">账户充值</a></li>
                         </c:when>
                         <c:otherwise>
                             <li class="png<c:if test="${p==1}"> nav_cur</c:if>"><a href="/user/ad/ggz_list_wxht.do" class="png">微信互推</a></li>
                             <li class="png<c:if test="${p==2}"> nav_cur</c:if>"><a href="/user/ad/wxz_list.do?type=1" class="png">广告接单</a></li>
                             <li class="png<c:if test="${p==3}"> nav_cur</c:if>"><a href="/user/ad_order/wxz_dzsq_list_no.do" class="png">对账申请</a></li>
                             <li class="png<c:if test="${p==4}"> nav_cur</c:if>"><a href="/user/ad_order/ggz_dzsq_list_yes.do" class="png">执行确认</a></li>
                             <li class="png<c:if test="${p==5}"> nav_cur</c:if>"><a href="/user/zhifu/list.do" class="png">支付记录</a></li>
                         </c:otherwise>
                     </c:choose>

                    <li class="png<c:if test="${p==8}"> nav_cur</c:if>"><a href="/user/message/xtxx_list.do" class="png">我的消息</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<script type="text/javaScript">
function logout() {
    var url = '/user/user/logout.do';
    jQuery.post(url, $("#f1").serialize(), function(jsonobj) {
        if (jsonobj.code == "200") {
            layer.alert(jsonobj.msg);
            window.location.reload();
        } else {
            layer.msg(jsonobj.msg);
        }
    }, "json");
}
</script>
