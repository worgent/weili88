package base.util;

/**
 * User: liuwentao
 * Time: 14-9-7 下午8:40
 */
public class BasePageUtil {

    public static int getTotalPage(int totalCount,int length){
        int totalPage = totalCount % length == 0 ? totalCount / length : totalCount / length + 1 ;
        return totalPage;
    }

    public static int getFrom(int pageNo,int length){
        if(pageNo<2){
            return 0;
        }
        if(length==0){
            length = 0;
        }
        return (pageNo - 1) * length;
    }

    public static String getPageUrl(String url,int pageNo){
        if(BaseStringUtil.isBlank(url)){
            return "";
        }
        if(pageNo<1){
            return url;
        }
        return url.replace(".html","_" + pageNo + ".html");
    }
}
