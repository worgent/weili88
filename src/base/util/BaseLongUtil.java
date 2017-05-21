package base.util;

import javax.servlet.http.HttpServletRequest;

/**
 * User: liuwentao
 * Time: 13-9-25 下午2:57
 */
public class BaseLongUtil {
    /**
     * @param i
     * @return
     */
    public static boolean isNotBlank(Long i) {
        return !isBlank(i);
    }


    /**
     * 判断是否为空
     *
     * @param i
     * @return
     */
    public static boolean isBlank(Long i) {
        if (i == null || i == 0) {
            return true;
        }
        return false;
    }

    /**
     * @param request
     * @param paramName
     * @return
     */
    public static long getValue(HttpServletRequest request, String paramName) {
        String obj = request.getParameter(paramName);
        return getValue(obj);
    }

    /**
     *
     * @param obj
     * @return
     */
    public static long getValue(Object obj) {
        if (obj instanceof Integer) {
            return (Integer) obj;
        }
        if (obj instanceof Double) {
            Double d = (Double) obj;
            return d.intValue();
        }

        if (obj instanceof String) {
            String str = (String) obj;
            if (BaseStringUtil.isBlank(str)) {
                return 0;
            }
            str = str.trim();
            try {
                if (str.indexOf(".") != -1) {
                    Double d = Double.parseDouble(str);
                    return d.intValue();
                }
                return Long.parseLong(str);
            } catch (NumberFormatException e) {
                //e.printStackTrace();
            }
            return 0;
        }

        if (obj instanceof Boolean) {
            boolean b = (Boolean) obj;
            if (b) {
                return 1;
            }
            return 0;
        }
        if (obj instanceof Long) {
            Long value = (Long) obj;
            if (value == null) {
                return 0;
            }
            return value.longValue();
        }

        return 0;
    }


}
