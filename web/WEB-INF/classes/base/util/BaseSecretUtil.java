package base.util;

import base.MD5;

/**
 * User: liuwentao@kongzhong.com
 * Date: 2011-1-13 13:47:48
 * <p/>
 * 说明: 加密
 */
public class BaseSecretUtil {

    /**
     *
     * @param str
     * @param secret
     * @return
     */
    public static boolean eqaulSecret(String str,String secret) {
        if(secret==null){
            return false;
        }
        String secret2 = BaseSecretUtil.getSecret(str);
        return secret.equals(secret2);
    }

    /**
     * 得到加密串
     * @param str
     * @return
     */
    public static String getSecret(String str){
         return BaseSecretUtil.getSecret(str, "koolearn");
    }

    /**
     * @param str
     * @param key
     * @return
     */
    public static String getSecret(String str, String key) {
        MD5 m = new MD5();
        return m.calcMD5(str + "_" + key);
    }

}
