package cn.taiqiu8.weixin;

/**
 * Created by tianbaochao on 2015/7/8.
 */
public class WxManager {
    private WxUtil wxUtil;
    private static WxManager wxManager;

    public static WxManager getInstance(){
        if( wxManager == null ){
            wxManager = new WxManager();
        }
        return wxManager;
    }

    private WxManager(){
        //经济晨读
        wxUtil = new WxUtil("wxa53825e6c506935b", "5ae894b7b5d494bc1b589eeb4b2b1697");
        //accessToken = new AccessToken(appid, appsecret);
        //apiTicket = new JsApiTicket(accessToken.getAccessToken());
    }

    public WxUtil getEcoWx(){
        return wxUtil;
    }
}
