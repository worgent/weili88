package cn.taiqiu8.util;

import base.util.BaseIntUtil;
import base.util.BaseStringUtil;
//import cn.taiqiu8.enums.AdTypeEnum;

import java.math.BigDecimal;

/**
 * User: liuwentao
 * Time: 15-1-23 下午12:22
 */
public class AdOrderUtil {

    public static BigDecimal getAmount(BigDecimal price,Integer numFans){
        if(price==null || numFans==null){
            return new BigDecimal(0).setScale(2, BigDecimal.ROUND_HALF_UP);
        }

        BigDecimal amount = price.multiply(new BigDecimal(numFans)).divide(new BigDecimal(1000)).setScale(2, BigDecimal.ROUND_HALF_UP);
        return amount;
    }

    public static String getAmountStr(BigDecimal price,Integer numFans,Short adType){
        BigDecimal amount = getAmount(price,numFans);
        String amountStr = "￥<span id=\"amount\">" + amount + "</span>元";
//        if(adType.equals(AdTypeEnum.WXHT.getValue())){
//            amountStr = "￥<span id=\"amount\">" + amount + "</span>微币";
//        }
        return amountStr;
    }


    public static boolean match(String ids,int id){
        if(BaseStringUtil.isBlank(ids)){
            return true;
        }
        if(ids.equals("0")){
            return true;
        }

        return BaseIntUtil.isIn(id,ids);
    }

}
