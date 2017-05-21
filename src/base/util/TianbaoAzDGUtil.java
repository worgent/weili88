package base.util;

import java.io.IOException;
import java.security.MessageDigest;

public class TianbaoAzDGUtil {

    public static void main(String[] args) {
        TianbaoAzDGUtil azdg = new TianbaoAzDGUtil();
        String key = "1234567890";// 密钥，可自定义
        String txt = "no=sh0105&Time=123刘文涛中国字372223`112r3r223";//明文
        String txt2 = ""; //密文
        System.out.println("明文为：" + txt);
        txt2 = azdg.encrypt(txt, key);
        System.out.println("加密后为：" + txt2);
        String txt3 = azdg.decrypt(txt2, key); //解密后
        System.out.println("解密后为：" + txt3);
    }

    /**
     * 加密算法
     * @param txt
     * @param key
     * @return
     */
    public String encrypt(String txt, String key) {
        String encrypt_key = "0f9cfb7a9acced8a4167ea8006ccd098";
        int ctr = 0;
        String tmp = "";
        int i;
        for (i = 0; i < txt.length(); i++) {
            ctr = (ctr == encrypt_key.length()) ? 0 : ctr;
            tmp = tmp + encrypt_key.charAt(ctr)
                    + (char) (txt.charAt(i) ^ encrypt_key.charAt(ctr));
            ctr++;
        }
        return base64_encode(key(tmp, key));
    }

    /**
     * 解密算法
     * @param txt2
     * @param key
     * @return
     */
    public String decrypt(String txt2, String key) {
        // base64解码
        txt2 = base64_decode(txt2);
        txt2 = key(txt2, key);
        String tmp = "";
        for (int i = 0; i < txt2.length(); i++) {
            int c = txt2.charAt(i) ^ txt2.charAt(i + 1);
            String x = "" + (char) c;
            tmp += x;
            i++;
        }
        return tmp;
    }

    /**
     *
     * @param txt
     * @param encrypt_key
     * @return
     */
    public String key(String txt, String encrypt_key) {
        encrypt_key = strMD5(encrypt_key);
        int ctr = 0;
        String tmp = "";
        for (int i = 0; i < txt.length(); i++) {
            ctr = (ctr == encrypt_key.length()) ? 0 : ctr;
            int c = txt.charAt(i) ^ encrypt_key.charAt(ctr);
            String x = "" + (char) c;
            tmp = tmp + x;
            ctr++;
        }
        return tmp;
    }

    /**
     *
     * @param str
     * @return
     */
    public String base64_encode(String str) {
        return new sun.misc.BASE64Encoder().encode(str.getBytes());
    }

    /**
     * 
     * @param str
     * @return
     */
    public String base64_decode(String str) {
        sun.misc.BASE64Decoder decoder = new sun.misc.BASE64Decoder();
        if (str == null)
            return null;
        try {
            return new String(decoder.decodeBuffer(str));
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 
     * @param s
     * @return
     */
    public static final String strMD5(String s) {
        char hexDigits[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'a', 'b', 'c', 'd', 'e', 'f'};
        try {
            byte[] strTemp = s.getBytes();
            MessageDigest mdTemp = MessageDigest.getInstance("MD5");
            mdTemp.update(strTemp);
            byte[] md = mdTemp.digest();
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}