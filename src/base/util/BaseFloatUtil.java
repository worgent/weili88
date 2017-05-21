package base.util;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.text.NumberFormat;

/**
 * User: liuwentao@kongzhong.com
 * Date: 2010-9-8 11:46:18
 * <p/>
 * 说明:
 */
public class BaseFloatUtil {


    public static void main(String[] args){
        String money = "0.01";
        String moneyInput = "1000000";

       float moneyAfter = BaseFloatUtil.add(money, moneyInput);

        System.out.println("moneyAfter=" + moneyAfter);
    }

    public static int compare(float f1,float f2){
       return compare(String.valueOf(f1),String.valueOf(f2));
    }

    public static int compare(String f1,float f2){
       return compare(f1,String.valueOf(f2));
    }

    public static int compare(String f1,String f2){
        BigDecimal bigDecimal_1 = new BigDecimal(f1);
        BigDecimal bigDecimal_2 = new BigDecimal(f2);

        return bigDecimal_1.compareTo(bigDecimal_2);
    }

    public static float add(float f1, float f2) {
        return add(String.valueOf(f1),String.valueOf(f2));
    }

    public static float add(String f1, String f2) {
        BigDecimal bigDecimal_1 = new BigDecimal(f1);
        BigDecimal bigDecimal_2 = new BigDecimal(f2);

        BigDecimal bigDecimal = bigDecimal_1.add(bigDecimal_2);

        return bigDecimal.floatValue();
    }


    public static float subtract(float f1, float f2) {
        BigDecimal bigDecimal_1 = new BigDecimal(String.valueOf(f1));
        BigDecimal bigDecimal_2 = new BigDecimal(String.valueOf(f2));

        BigDecimal bigDecimal = bigDecimal_1.subtract(bigDecimal_2).setScale(2);

        return bigDecimal.floatValue();
    }

    /**
     * @param value
     * @return
     */
    public static float getFloat(String value) {
        BigDecimal bigDecimal = new BigDecimal(value);
        return bigDecimal.setScale(2).floatValue();
    }

    public static float getFloat(HttpServletRequest request, String paramName) {
        return getFloat(request, paramName, 0);
    }

    public static float getFloat(HttpServletRequest request, String paramName, int defaultValue) {
        String value = request.getParameter(paramName);
        if (BaseStringUtil.isBlank(value)) {
            return defaultValue;
        }
        return getFloat(value);
    }

    public static float roundUp(float value) {
        ////只要第2位后面存在大于0的小数，则第2位就+1
        return round(value, 2, BigDecimal.ROUND_UP);
    }


    /**
     * 对float数据进行取精度.
     * <p/>
     * For example: <br>
     * float value = 100.345678; <br>
     * float ret = round(value,4,BigDecimal.ROUND_HALF_UP); <br>
     * ret为100.3457 <br>
     *
     * @param value float数据.
     * @return 精度计算后的数据.
     */
    public static float roundDown(float value) {
        //直接舍弃第2位后面的所有小数
        return round(value, 2, BigDecimal.ROUND_DOWN);
    }

    public static float roundHALFDown(float value) {
        //如果第3位数字>=5,则做ROUND_UP
        //如果第3位数字<5,则做ROUND_DOWN
        return round(value, 2, BigDecimal.ROUND_HALF_DOWN);
    }


    /**
     * 对float数据进行取精度.
     * <p/>
     * For example: <br>
     * float value = 100.345678; <br>
     * float ret = round(value,4,BigDecimal.ROUND_HALF_UP); <br>
     * ret为100.3457 <br>
     *
     * @param value        float数据.
     * @param scale        精度位数(保留的小数位数).
     * @param roundingMode 精度取值方式.
     * @return 精度计算后的数据.
     */
    public static float round(float value, int scale, int roundingMode) {
        BigDecimal bd = new BigDecimal(value);
        bd = bd.setScale(scale, roundingMode);
        float d = bd.floatValue();
        bd = null;
        return d;
    }

//
//    /**
//     * 测试用的main方法.
//     *
//     * @param argc 运行参数.
//     */
//    public static void main(String[] argc) {
//        float f = 222.5f;
//        System.out.println("f = " + f);
//
//        double a = 12.1151111;
//        NumberFormat nbf = NumberFormat.getInstance();
//// nbf.setMinimumFractionDigits(2); //最少
//        nbf.setMaximumFractionDigits(1);//最多
//        System.out.println(nbf.format(f));
//
//
////       //下面都以保留2位小数为例
////
////       //ROUND_UP
////       //只要第2位后面存在大于0的小数，则第2位就+1
////       System.out.println(round((float) 12.3401,2,BigDecimal.ROUND_UP));//12.35
////       System.out.println(round((float) -12.3401,2,BigDecimal.ROUND_UP));//-12.35
////       //ROUND_DOWN
////       //与ROUND_UP相反
////       //直接舍弃第2位后面的所有小数
////       System.out.println(round((float)12.349,2,BigDecimal.ROUND_DOWN));//12.34
////       System.out.println(round((float)-12.349,2,BigDecimal.ROUND_DOWN));//-12.34
////       //ROUND_CEILING
////       //如果数字>0 则和ROUND_UP作用一样
////       //如果数字<0 则和ROUND_DOWN作用一样
////       System.out.println(round((float)12.3401,2,BigDecimal.ROUND_CEILING));//12.35
////       System.out.println(round((float)-12.349,2,BigDecimal.ROUND_CEILING));//-12.34
////       //ROUND_FLOOR
////       //如果数字>0 则和ROUND_DOWN作用一样
////       //如果数字<0 则和ROUND_UP作用一样
////       System.out.println(round((float)12.349,2,BigDecimal.ROUND_FLOOR));//12.34
////       System.out.println(round((float)-12.3401,2,BigDecimal.ROUND_FLOOR));//-12.35
////       //ROUND_HALF_UP [这种方法最常用]
////       //如果第3位数字>=5,则第2位数字+1
////       //备注:只看第3位数字的值,不会考虑第3位之后的小数的
////       System.out.println(round((float)12.345,2,BigDecimal.ROUND_HALF_UP));//12.35
////       System.out.println(round((float)12.3449,2,BigDecimal.ROUND_HALF_UP));//12.34
////       System.out.println(round((float)-12.345,2,BigDecimal.ROUND_HALF_UP));//-12.35
////       System.out.println(round((float)-12.3449,2,BigDecimal.ROUND_HALF_UP));//-12.34
////       //ROUND_HALF_DOWN
////       //如果第3位数字>=5,则做ROUND_UP
////       //如果第3位数字<5,则做ROUND_DOWN
////       System.out.println(round((float)12.345,2,BigDecimal.ROUND_HALF_DOWN));//12.35
////       System.out.println(round((float)12.3449,2,BigDecimal.ROUND_HALF_DOWN));//12.34
////       System.out.println(round((float)-12.345,2,BigDecimal.ROUND_HALF_DOWN));//-12.35
////       System.out.println(round((float)-12.3449,2,BigDecimal.ROUND_HALF_DOWN));//-12.34
////       //ROUND_HALF_EVEN
////       //如果第3位是偶数,则做ROUND_HALF_DOWN
////       //如果第3位是奇数,则做ROUND_HALF_UP
////       System.out.println(round((float)12.346,2,BigDecimal.ROUND_HALF_EVEN));//12.35
////       System.out.println(round((float)12.345,2, BigDecimal.ROUND_HALF_EVEN));//12.35
//    }

}
