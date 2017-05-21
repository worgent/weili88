package cn.taiqiu8.util;

import java.math.BigDecimal;

/**
 * User: liuwentao
 * Time: 15-1-30 下午1:56
 */
public class ZhifuUtil {

    /**
     * 手续费
     *
     * @param moneyTaxBefore
     * @return
     */
    public static BigDecimal getSxf(BigDecimal moneyTaxBefore) {
        return moneyTaxBefore.multiply(new BigDecimal(0.1)).setScale(2,BigDecimal.ROUND_HALF_EVEN);
    }

    /**
     * @param moneyTaxBefore
     * @return
     */
    public static BigDecimal getTax(BigDecimal moneyTaxBefore) {
        return moneyTaxBefore.multiply(new BigDecimal(0.02)).setScale(2,BigDecimal.ROUND_HALF_EVEN);
    }

}
