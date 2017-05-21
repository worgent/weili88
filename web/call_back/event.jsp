<%@ page import="base.util.BaseDateUtil" %>
<%@ page import="com.qq.weixin.mp.aes.WXBizMsgCrypt" %>
<%@ page import="demo.HttpsUtil" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="org.dom4j.Document" %>
<%@ page import="org.dom4j.DocumentHelper" %>
<%@ page import="org.dom4j.Element" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    System.out.println("event.jsp------------------------" + BaseDateUtil.getFormatSecond(new Date()));

    //1: 获得 component_verify_ticket 密文
    java.io.BufferedInputStream bis = new java.io.BufferedInputStream(
            request.getInputStream());

    byte read[] = new byte[1024 * 1024];
    String miwen = "";

    try {
        while ((bis.read(read, 0, 1 * 1)) != -1) {
            miwen += new String(read, 0, 1 * 1);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        bis.close();
    }

    //2: 获得 component_verify_ticket 明文
    String encodingAesKey = "flashappflashappflashappflashappflashappapp";
    String token = "flashapp";
    String appId = "wx5580aec4eb7c013a";
    WXBizMsgCrypt pc = new WXBizMsgCrypt(token, encodingAesKey, appId);

    String timestamp = request.getParameter("timestamp");
    String nonce = request.getParameter("nonce");
    String msg_signature = request.getParameter("msg_signature");

    String mingwen = pc.decryptMsg(msg_signature, timestamp, nonce, miwen);
    // System.out.println("解密后明文: " + mingwen);
    Document doc = null;
    doc = DocumentHelper.parseText(mingwen); // 将字符串转为XML
    Element rootElement = doc.getRootElement(); // 获取根节点smsReport
    String component_verify_ticket = rootElement.elementTextTrim("ComponentVerifyTicket");

    System.out.println("2: component_verify_ticket=" + component_verify_ticket);

    //3： 获得component_access_token： 第三方平台access_token
    String content = "{\"component_appid\":\"wx5580aec4eb7c013a\",\"component_appsecret\":\"0c79e1fa963cd80cc0be99b20a18faeb\",\"component_verify_ticket\":\"" + component_verify_ticket + "\"}";
    String url = "https://api.weixin.qq.com/cgi-bin/component/api_component_token";
    //{"component_access_token":"kjbPGfu5O8cjN9MLPv8QX8qDiwz2mH4Voc2IlpnRLv4RwwXkD1Lnhn8Dp_vBQzG8nUEIpeTVpesfimNCPTDxtuT3K7Ov5k73nVkxKABqV5M","expires_in":7200}
    String component_access_token_Json = HttpsUtil.post(url, content);
    JSONObject jsonObject = JSONObject.fromObject(component_access_token_Json);
    String component_access_token = jsonObject.getString("component_access_token");
    System.out.println("3: component_access_token=" + component_access_token);

    application.setAttribute("component_access_token", component_access_token);


    //4：获取预授权码：pre_auth_code
    content = "{\"component_appid\":\"wx5580aec4eb7c013a\"}";
    url = "https://api.weixin.qq.com/cgi-bin/component/api_create_preauthcode?component_access_token=" + component_access_token;
    String pre_auth_code_Json = HttpsUtil.post(url, content);
    jsonObject = JSONObject.fromObject(pre_auth_code_Json);
    String pre_auth_code = jsonObject.getString("pre_auth_code");
    System.out.println("4: pre_auth_code=" + pre_auth_code);
    application.setAttribute("pre_auth_code", pre_auth_code);
%>
success