package cn.taiqiu8.enums;

/**
 * User: tianbaochao
 * Time: 2015年8月3日12:52:56
 */
public enum UserTypeEnum {
    //类型1:系统用户 10:广告主 20:微信主 30 管理员
    SYSTEM((short)1, "系统用户"), CUSTOMER((short)10, "消费者"), ASSIST((short)20, "助练"), ADMIN((short)30, "管理员");

    private Short value;

    private String label;

    public Short getValue() {
        return value;
    }

    public String getLabel() {
        return label;
    }

    private UserTypeEnum(Short value, String label) {
        this.value = value;
        this.label = label;
    }

    public static UserTypeEnum getThisByValue(Short value) {
        UserTypeEnum[] ae = UserTypeEnum.values();
        for (int i = 0; i < ae.length; i++) {
            if (ae[i].getValue()== value) {
                return ae[i];
            }
        }
        return null;
    }

    public static String getLabelByValue(int value) {
        if(value==0){
            return "";
        }
        UserTypeEnum statusEnum = UserTypeEnum.getThisByValue((short) value);
        if (statusEnum == null) {
            return "-" + value + "-";
        }
        return statusEnum.getLabel();
    }
    
}
