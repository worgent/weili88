package base.util;

/**
 * User: liuwentao@kongzhong.com
 * Date: 2010-7-20 10:13:47
 * <p/>
 * 说明:
 */
public class BaseDoubleUtil {

    public static void main(String[] args){
       double d = BaseDoubleUtil.getDouble("30.0") ;
        System.out.println("d = " + d);
    }

    /**
     * 得到 int
     *
     * @param obj
     * @return
     */
    public static double getDouble(Object obj) {
        if (obj instanceof Double) {
            double d = (Double) obj;
            return d;
        }
        
        if (obj instanceof Integer) {
            return (Integer) obj;
        }

        if (obj instanceof String) {
            String str = (String) obj;
            if (BaseStringUtil.isBlank(str)) {
                return 0;
            }
            return Double.parseDouble(str.trim());
        }

        if (obj instanceof Boolean) {
            boolean b = (Boolean) obj;
            if (b) {
                return 1;
            }
            return 0;
        }

        return 0;
    }

}
