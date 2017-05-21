package base.util;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.*;

/**
 * User: liuwentao@kongzhong.com
 * Date: 2010-7-20 10:13:47
 * <p/>
 * 说明:
 */
public class BaseBigDecimalUtil {

    /**
     * @param request
     * @param paramName
     * @return
     */
    public static BigDecimal getBigDecimal(HttpServletRequest request, String paramName) {
        String value = request.getParameter(paramName);
        if(BaseStringUtil.isBlank(value)){
            return BigDecimal.ZERO;
        }
        return new BigDecimal(value);
    }

}
