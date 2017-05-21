<%@ page import="demo.HttpsUtil" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>获取第三方平台access_token</title>
</head>
<body>
<%
    //1： 从event.jsp 中拿到  component_verify_ticket
    System.out.println("api_component_token-----------------");
    String component_verify_ticket = (String) application.getAttribute("component_verify_ticket");
    out.println("component_verify_ticket=" + component_verify_ticket);

    //2： 获得component_access_token： 第三方平台access_token
    String content = "{\"component_appid\":\"wx5580aec4eb7c013a\",\"component_appsecret\":\"0c79e1fa963cd80cc0be99b20a18faeb\",\"component_verify_ticket\":\"" + component_verify_ticket + "\"}";
    String url = "https://api.weixin.qq.com/cgi-bin/component/api_component_token";
    //{"component_access_token":"kjbPGfu5O8cjN9MLPv8QX8qDiwz2mH4Voc2IlpnRLv4RwwXkD1Lnhn8Dp_vBQzG8nUEIpeTVpesfimNCPTDxtuT3K7Ov5k73nVkxKABqV5M","expires_in":7200}
    String component_access_token_Json = HttpsUtil.post(url,content);
    JSONObject jsonObject = JSONObject.fromObject(component_access_token_Json);
    String component_access_token = jsonObject.getString("component_access_token");
    out.println("<br>component_access_token=" + component_access_token);

    application.setAttribute("component_access_token",component_access_token);


    //3：获取预授权码：pre_auth_code
    content = "{\"component_appid\":\"wx5580aec4eb7c013a\"}";
    url = "https://api.weixin.qq.com/cgi-bin/component/api_create_preauthcode?component_access_token=" + component_access_token;
    String pre_auth_code_Json = HttpsUtil.post(url,content);
    jsonObject = JSONObject.fromObject(pre_auth_code_Json);
    String pre_auth_code = jsonObject.getString("pre_auth_code");
    out.println("<br>pre_auth_code=" + pre_auth_code);

    application.setAttribute("pre_auth_code",pre_auth_code);
%>


</body>
</html> 