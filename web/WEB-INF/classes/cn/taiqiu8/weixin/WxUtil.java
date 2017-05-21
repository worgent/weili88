package cn.taiqiu8.weixin;

import net.sf.json.JSONObject;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jeewx.api.Sign;
import org.jeewx.api.core.exception.WexinReqException;

import java.util.Map;


/**
 * Created by tianbaochao on 2015/7/7.
 */
public class WxUtil {
    private static Log log = LogFactory.getLog(WxUtil.class);

    public String getAppID() {
        return accessToken.getAppid();
    }

    public JsApiTicket getApiTicket() {
        return apiTicket;
    }

    public void setApiTicket(JsApiTicket apiTicket) {
        this.apiTicket = apiTicket;
    }

    //缓存accessToken，定时获取
    //缓存jsapi_ticket,定时获取
    private AccessToken accessToken;
    private JsApiTicket apiTicket;
//    private static WxUtil wxUtil;
//    public static WxUtil getInstance(String appid, String appsecret){
//        if( wxUtil == null ){
//            wxUtil = new WxUtil(appid, appsecret);
//        }
//        return wxUtil;
//    }

    public WxUtil(String appid, String appsecret){
        accessToken = new AccessToken(appid, appsecret);
        apiTicket = new JsApiTicket(accessToken.getAccessToken());
    }
    public String getAccessToken(){
       return accessToken.getAccessToken();
       // System.out.println("accesstoken,"+accesstoken);
    }

    public String getJsApiTicket() throws WexinReqException {

        return apiTicket.getApiTicket(getAccessToken());
    }

    public JSONObject sign(String jsapi_ticket, String url){
        Map<String,String> ret = Sign.sign(jsapi_ticket, url);
        JSONObject jo = JSONObject.fromObject(ret);
        log.info(jo);

        return jo;
    }
    public static void main(String[] args) throws Exception{
       // WxUtil wx = WxUtil.getInstance("wxa53825e6c506935b", "5ae894b7b5d494bc1b589eeb4b2b1697");
       // wx.getAccessToken();
       // wx.getJsApiTicket();
       // wx.sign("sM4AOVdWfPE4DxkXGEs8VAysgQ0MDVATYVH8zVCuyz7frvgdAaL38NRdIP8OAnWYLnIq3sbJDtmzZww5NVpwkQ", "www");
    }
}
