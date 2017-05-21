package demo;

import java.io.StringReader;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.qq.weixin.mp.aes.WXBizMsgCrypt;

public class Program {

	public static void main(String[] args) throws Exception {
        String loc ="<xml>\n" +
                "    <AppId><![CDATA[wx5580aec4eb7c013a]]></AppId>\n" +
                "    <Encrypt><![CDATA[MdDd8DKg39VJMsi1ovbhNbY2rwKmJi3vLalX3P0o6GI19+Qvy7QIkoN0K2QWtXM6b3Bron5f5FXCALKinj+Wjh/o/bmNkS/kp/EhZCmcZmkKJ15FohhGggK5i3tKcgB4NZdPhC2qBJICpIOOw3OAyX2LJbMSYznkT4vOzoMGm7nEwk+4P83UuMJ5yRPO7B6i5R31vWmAp6zS7IuNjPAfhTPVqZD/hZgQoQaOrzmv2bQcv6aUMd2dD7c3lMK3LNollLHHhSyxTCQu8iNrO7kRKX5TzmcFekxRpR5ToOLM1svWa/SXQ9yyIpFPPVJnHbTiLEL+TioVKXDS2zeO+WF3tUDZ2EI3Xl9ve2bVjXVjIOY2vT3DXc6Mq9RZl2bIIfQGxcoEmi4R+VI9FPO7wxo4wSGo7RazCRo4ZkHoMggdYVSExIUOON8I5fK1wBK6GFtD7QGYQUeRN2DjLPLL7oY4Fg==]]></Encrypt>\n" +
                "</xml>";
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        DocumentBuilder db = dbf.newDocumentBuilder();
        StringReader sr = new StringReader(loc);
        InputSource is = new InputSource(sr);
        Document document = db.parse(is);
        Element root = document.getDocumentElement();
        NodeList nodelist1 = root.getElementsByTagName("Encrypt");
        NodeList nodelist2 = root.getElementsByTagName("MsgSignature");

        String encrypt = nodelist1.item(0).getTextContent();

        String format = "<xml><AppId><![CDATA[AppId]]></AppId><Encrypt><![CDATA[%1$s]]></Encrypt></xml>";
        String fromXML = String.format(format, encrypt);


        String encodingAesKey = "flashappflashappflashappflashappflashappapp";
        String token = "flashapp";
        String appId = "wx5580aec4eb7c013a";

        WXBizMsgCrypt pc = new WXBizMsgCrypt(token, encodingAesKey, appId);


//        timestamp:1425366604
//encrypt_type:aes
//nonce:802817164
//msg_signature:70b886cd8e2ce4ed32b10f99d270ef1cda13f2d8
//signature:f56ccc0dd0ad1f8355c932c54e3583b860f5a52a

        String timestamp = "1425366604";
        String nonce = "802817164";
        String msg_signature = "70b886cd8e2ce4ed32b10f99d270ef1cda13f2d8";

        String result2 = pc.decryptMsg(msg_signature, timestamp, nonce, loc);
        System.out.println("解密后明文: " + result2);
	}
}
