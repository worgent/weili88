package cn.taiqiu8.util;

import base.MD5;
import base.SystemGlobal;
import base.util.BaseDateUtil;

import java.util.Date;

/**
 * User: liuwentao
 * Time: 15-2-4 下午6:12
 */
public class EmailUtil {

    /**
     *
     * @param userId
     * @return
     */
    public static String getActiveEmailUrl(Integer userId) {
        String time = BaseDateUtil.getFormatString(new Date(), "yyyy-MM-dd");
        String host = SystemGlobal.getPreference("host");
        String url = host + "/active_email.do?userId=" + userId + "&time=" + time;

        String key = getKey(time,userId);
        url = url + "&key=" + key;
        return url;
    }

    public static String getKey(String time,int userId){
        String key = time + userId + "liuwentao";
        key = new MD5().calcMD5(key);

        return key;
    }

}
