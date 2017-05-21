<%@ page import="base.util.BaseIntUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tag.weili88.com" prefix="w" %>
<%
    int p = BaseIntUtil.getInt(request, "p");
    pageContext.setAttribute("p",p);
%>

<link href="/css/common_head.css" rel="stylesheet" media="screen" type="text/css">
<link rel="stylesheet" type="text/css" href="/css/button.css"/>
<script type="text/javascript" src="/js/jquery/jquery-1.8.1.min.js"></script>
<script language="javascript" src="/js/com.js"></script>
<script language="javascript" src="/js/preview.js"></script>
<script language="javascript" src='/js/plug-in/My97DatePicker/WdatePicker.js'></script>
<script src="/js/layer/layer.min.js"></script>

<w:userDataTag admin="true"/>

<div class="body_menu">
    <div class="new_header" id="header">
        <div class="topright">
            <div class="newcwq_wrap">
                <ul class="notop">
                    <li class="topfirst"><a href="/index.jsp">首页</a></li>
                    <li><a href="/gly/message/wtzx_list.do" title="问题咨询">问题咨询<c:if test="${wtzxCountUnBack>0}"><b>(${wtzxCountUnBack})</b></c:if></a></li>
                    <li><a href="Faq/" title="帮助中心">帮助中心</a></li>
                    <li><a href="#" onclick="javascript:logout()" title="退出" class="special">退出</a></li>
               </ul>
            </div>
            <div class="clear"></div>
        </div>
        <div class="header_box" style="width:1230px">
            <div class="logo2"><a href="../../guanliyuan/common" class="png" title="微利广告平台" style="cursor:pointer;"></a>
            </div>
            <%--<div class="logotxt">微聚利量</div>--%>
            <div class="newcwq_menu" style="width:1000px">
                <ul>
                    <%--<li class="nav_cur png"><a href="/index.jsp" title="网站首页" class="png">网站首页</a></li>--%>
                    <li class="png<c:if test="${p==0}"> nav_cur</c:if>"><a href="/gly/home/index.do" class="png">账户首页</a></li>
                    <li class="png<c:if test="${p==1}"> nav_cur</c:if>"><a href="/gly/user/user_list.do?type=10" class="png">账户管理</a></li>
                        <li class="png<c:if test="${p==8}"> nav_cur</c:if>"><a href="/gly/renzheng/wxz_rz_list.do?status=1" class="png">粉丝数认证</a></li>
                    <li class="png<c:if test="${p==2}"> nav_cur</c:if>"><a href="/gly/ad/list.do?type=1" class="png">广告管理</a></li>
                        <li class="png<c:if test="${p==9}"> nav_cur</c:if>"><a href="/gly/ad_order/dzsq_list_yes.do" class="png">执行确认</a></li>
                    <li class="png<c:if test="${p==3}"> nav_cur</c:if>"><a href="/gly/chongzhi/list.do" class="png">充值订单</a></li>
                    <li class="png<c:if test="${p==4}"> nav_cur</c:if>"><a href="/gly/zhifu/list.do" class="png">支付审核</a></li>
                    <li class="png<c:if test="${p==5}"> nav_cur</c:if>"><a href="/gly/cms/cms_list.do" class="png">资讯管理</a></li>
                    <li class="png<c:if test="${p==6}"> nav_cur</c:if>"><a href="/gly/message/xtxx_list.do" class="png">消息管理</a></li>
                        <li class="png<c:if test="${p==7}"> nav_cur</c:if>"><a href="/gly/setting/update_load.do" class="png">系统设置</a></li>
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

