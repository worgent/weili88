package base.util;

/**
 * User: liunana@kongzhong.com
 * Date: 2010-8-2  Time: 21:08:45
 * <p/>
 * 功能：
 * 说明：
 */
public class BaseBooleanUtil {

    /**
     *
     * @param obj
     * @return
     */
    public static boolean getValue(Object obj){
        if(obj == null){
            return false;
        }
        if("false".equals(obj)){
            return false;
        }
        if (obj instanceof Integer) {
            Integer i = (Integer)obj;
            return !(i==0);
        }
        if (obj instanceof String) {
            String str = (String) obj;
            if(BaseStringUtil.isBlank(str)){
                return false;
            }
            return str.trim().toLowerCase().equals("true");
        }
        if (obj instanceof Boolean) {
            return (Boolean) obj;
        }
        return false;
    }
}
