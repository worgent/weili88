package cn.taiqiu8.weixin;

import net.sf.json.JSONObject;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jeewx.api.core.common.WxstoreUtils;

/**
 * Created by tianbaochao on 2015/7/8.
 */
public class AccessToken extends org.jeewx.api.core.common.AccessToken{
    private static Log log = LogFactory.getLog(AccessToken.class);

    private int expireIn = 0;
    private int timestamp = 0;
    private String token = null;

    public AccessToken(String appid, String appscret){
        super(appid, appscret);

    }
    private boolean isValid(){
        return timestamp > (int) (System.currentTimeMillis() / 1000);
    }
    public String getAccessToken() {
        if( isValid() == false ) {
            String requestUrl = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET".replace("APPID", this.getAppid()).replace("APPSECRET", this.getAppscret());
            JSONObject jsonObject = WxstoreUtils.httpRequest(requestUrl, "GET", null);
            log.info("getAccessToken,"+requestUrl);
            if (null != jsonObject) {
                try {
                    token = jsonObject.getString("access_token");
                    expireIn = jsonObject.getInt("expires_in");
                    timestamp = (int) (System.currentTimeMillis() / 1000) + expireIn -100;
                } catch (Exception e) {
                    token = null;
                    expireIn = 0;
                    timestamp = 0;
                }
            }
        }

        return token;
    }
    public int getExpireIn() {
        return expireIn;
    }

    public void setExpireIn(int expireIn) {
        this.expireIn = expireIn;
    }

    public int getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(int timestamp) {
        this.timestamp = timestamp;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

}
