package base.util;

import base.bean.PageBean;

import javax.servlet.http.HttpServletRequest;

/**
 * User: liuwentao
 * Time: 12-12-25 下午1:31
 */
public class BasePageBeanUtil {

    /**
     * @param pageNo
     * @param length
     * @return
     */
    public static PageBean getPageBean(int pageNo, int length) {
        PageBean pageBean = new PageBean();
        pageBean.setLength(length);
        pageBean.setPageNo(pageNo);
        pageBean.init();
        return pageBean;
    }

    /**
     * @param pageNo
     * @param begin
     * @param length
     * @return
     */
    public static PageBean getPageBean(int pageNo, int begin, int length) {
        PageBean pageBean = new PageBean(begin, length);
        pageBean.setPageNo(pageNo);
        pageBean.init();
        return pageBean;
    }

    /**
     * @param request
     * @return
     */
    public static PageBean getPageBean(HttpServletRequest request) {
        return getPageBean(request,15);
    }

    public static PageBean getPageBean(HttpServletRequest request, int defaultLength) {
        int begin = BaseIntUtil.getInt(request, "begin");
        int length = BaseIntUtil.getInt(request, "length");
        int pageNo = BaseIntUtil.getInt(request, "pageNo");

        if (length == 0) {
            length = defaultLength;
        }

        PageBean pageBean = new PageBean(begin, length);
        pageBean.setPageNo(pageNo);
        pageBean.init();
        return pageBean;
    }
}
