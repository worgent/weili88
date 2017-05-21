package cn.taiqiu8.weixin;

import net.sf.json.JSONObject;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jeewx.api.core.exception.WexinReqException;
import org.jeewx.api.core.req.WeiXinReqService;
import org.jeewx.api.coupon.qrcode.model.Getticket;
import org.jeewx.api.coupon.qrcode.model.GetticketRtn;

/**
 * Created by tianbaochao on 2015/7/8.
 */
public class JsApiTicket extends GetticketRtn {
    private static Log log = LogFactory.getLog(JsApiTicket.class);

    private int expiresIn = 0;
    private int timestamp = 0;

    private Getticket getTicket = new Getticket();

    public JsApiTicket(String accessToken){
        getTicket.setAccess_token(accessToken);
    }

    private boolean isValid(){
        return timestamp > (int) (System.currentTimeMillis() / 1000);
    }

    public String getApiTicket(String accessToken) throws WexinReqException {
        if( isValid() == false ) {
            getTicket.setAccess_token(accessToken);
            JSONObject result = WeiXinReqService.getInstance().doWeinxinReqJson(getTicket);
            log.info("getApiTicket,"+getTicket.getAccess_token());

            GetticketRtn getticketRtn = (GetticketRtn) JSONObject.toBean(result, GetticketRtn.class);
            System.out.println("GetticketRtn," + getticketRtn.getTicket());
            setTicket(getticketRtn.getTicket());
            setExpires_in(getticketRtn.getExpires_in());
            setErrcode(getticketRtn.getErrcode());
            setErrmsg(getticketRtn.getErrmsg());
            expiresIn = Integer.parseInt(getticketRtn.getExpires_in());
            timestamp = (int) (System.currentTimeMillis() / 1000)+expiresIn -100;
        }
        return getTicket();
    }
}
