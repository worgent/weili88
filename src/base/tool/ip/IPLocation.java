package base.tool.ip;

/**
 * User: liuwentao@wuan5.com
 * Date: 2007-1-11 Time: 9:52:49
 * 功能 :用来封装ip相关信息，目前只有两个字段，ip所在的国家和地区
 * 说明 :
 */
public class IPLocation {
    public String country;
    public String area;

    /**
     * 默认构造函数
     */
    public IPLocation() {
        country = area = "";
    }

    /**
     * 复制
     *
     * @return IPLocation
     */
    public IPLocation getCopy() {
        IPLocation iPLocation = new IPLocation();
        iPLocation.country = country;
        iPLocation.area = area;
        return iPLocation;
    }
}