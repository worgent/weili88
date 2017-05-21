<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>微利管理平台-模拟微信主登录</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<link href="/login/css/login.css" rel="stylesheet" type="text/css" />
	<link href="/login/css/framework.css" rel="stylesheet" type="text/css" />
    <link href="/css/jquery.loadmask.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="/js/jquery/jquery-1.8.1.min.js"></script>
    <script type="text/javascript" src="/js/jquery/jquery.cookie.js"></script>
    <script language="javascript" src="/js/com.js"></script>
    <script type="text/javascript" src="/js/jquery.loadmask.js"></script>
    <script type="text/javascript" src="/js/maintain/common.js"></script>
    <script src="/js/layer/layer.min.js"></script>

    <script type="text/javaScript">
	function chgRandImg(){
		document.getElementById("randimg").src="/common/image.jsp?"+Math.random();
	}
    function giveFoust(obj){
		var checkcodelength=obj.value.length;
		if(checkcodelength==4){
			document.getElementById('randRequest').focus();
		}
	}
	function commit(){
		var userName=document.getElementById("userName");
		var pwd=document.getElementById("pwd");
//		var randRequest=document.getElementById("randRequest");
		
		if(userName.value==''){
			userName.style.backgroundColor='rgb(225,166,155)'
			return;
		}
		if(pwd.value==''){
			pwd.style.backgroundColor='rgb(225,166,155)'
			return;
		}
//		if(randRequest.value==''){
//			randRequest.style.backgroundColor='rgb(225,166,155)'
//			return;
//		}
		//document.getElementById('myform').submit();
        var url = '/login/wxz.do';
        jQuery.post(url, $("#f1").serialize(), function(jsonobj) {
            if (jsonobj.code == "200") {
                layer.msg(jsonobj.msg);
                window.location="/user/home/index.do";
            } else {
                layer.msg(jsonobj.msg);
            }
        }, "json");
	}
</script>
</head>

<body>
	<div id="userlogon">
		<form id="f1" name="f1" method="POST" action="#">
			<div id="login">
				<div id="loginhead"></div>
				<div id="loginbox">
					<div class="tablebox">
			        	<table width="300" height="120" border="0" cellpadding="0" cellspacing="0">
			        		<tr>
			        			<td align="right">微信号：</td>
			        			<td colspan="2">
			        				<label>
			        					<input type="text" name="userName" id="userName" class="big2"/>
			        				</label>
			        			</td>
			        		</tr>
			        		<tr>
			        			<td align="right">密 码：</td>
			        			<td colspan="2">
			        				<label>
			        					<input type="password" name="pwd" id="pwd" class="big2"/>
			        				</label>
			        			</td>
			        		</tr>
			        		<%--<tr>--%>
			        			<%--<td align="right">验证码：</td>--%>
			        			<%--<td width="65">--%>
			        				<%--<img id='randimg' src="/common/image.jsp" alt='点击换张图片' border=0--%>
			        					<%--style="cursor:pointer;" onclick='javascript:chgRandImg();' />&nbsp;--%>
			        			<%--</td>--%>
			        			<%--<td>--%>
			        				<%--<input type="text" name="randRequest" id="randRequest" size="4" class="big4" maxlength="4" onkeyup="giveFoust(this);"/>--%>
			        				<%--<a href="gly.jsp#" onclick='javascript:chgRandImg();'>换一张</a>--%>
			        			<%--</td>--%>
			        		<%--</tr>--%>
			        		<tr>
			        			<td colspan="3" align="center" style="padding-top: 10px">
			        				<input type="button" name="su" id="su" value="登 录" class="small" onclick="commit();"/>
			        				<!-- <input type="reset" name="reset" value="重 置" class="small" /> -->
			        			</td>
			        		</tr>
			        		<tr>
			        			<td colspan="3" class="center">
			        				<span id="error" class="msgStrong"></span>
			        			</td>
			        		</tr>
			        	</table>
			        </div>
			     </div>
			     <%--<div align="right">©2004-2011 上海大承网络技术有限公司版权所有</div>--%>
			</div>
		</form>
	</div>
</body>
</html>