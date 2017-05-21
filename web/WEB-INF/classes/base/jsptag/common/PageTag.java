package base.jsptag.common;

import base.bean.PageBean;
import base.util.BaseStringUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;
import java.io.IOException;

/**
* User: liuwentao@kongzhong.com
* Date: 2010-2-1 Time: 19:58:23
* <p/>
* 功能说明：
*/
public class PageTag extends BodyTagSupport {
    protected final Log log = LogFactory.getLog(PageTag.class);
    //标签配置属性
    private PageBean pageBean;
    private int limit = 3;
    private String anchor;
    private int pageNo, totalPage, length, totalRow;
    private int prePageNo, nextPageNo; //上一页，下一页
    private int leftPageNo, rightPageNo; //左右最大页码
    private String queryString; //地址栏请求参数
    private String target; //打开哪个窗口
    private String urlString; //地址栏参数
    private String rel;

    /**
     *
     */
    public PageTag() {
    }

    /**
     *
     * @return
     * @throws javax.servlet.jsp.JspException
     */
    public int doStartTag() throws javax.servlet.jsp.JspException {
        if(pageBean == null){
            pageBean = new PageBean();
        }
        pageNo = pageBean.getPageNo();
        totalPage = pageBean.getTotalPage();
        length = pageBean.getLength();
        totalRow = pageBean.getTotalRow();

        prePageNo = pageNo - 1;
        nextPageNo = pageNo + 1;

        if (prePageNo < 1) {
            prePageNo = 1;
        }

        if (nextPageNo > totalPage) {
            nextPageNo = totalPage;
        }

        leftPageNo = pageNo - limit / 2;
        rightPageNo = pageNo + (limit - limit / 2);

        HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
        queryString = this.getQueryString2(request.getQueryString());

        //表示需要处理标签体,但绕过setBodyContent()和doInitBody()方法
        return EVAL_BODY_INCLUDE;
    }

    /**
     * 标签结束方法
     *
     * @return int
     * @throws javax.servlet.jsp.JspTagException
     *
     */
    public int doEndTag() throws JspTagException {
        JspWriter out = pageContext.getOut();
        try {
            this.println(out, "首页", 1);
            this.println(out, "上一页", prePageNo);
            //如果总 页 数 < limit 页  ，则 把 所有 页 都显示出来
            if (totalPage <= limit + 1) {
                this.printlnBetween(out, 1, totalPage);
            } else {
                if (pageNo <= limit) {
                    //当前页足够小
                    this.printlnBetween(out, 1, limit+1);
                    if (limit + 2 < totalPage) {
                        this.println(out, "&hellip;", limit + 2);
                    }
                    this.println(out, totalPage, totalPage);
                } else if (pageNo > totalPage - limit) {
                    //页面足够大
                    this.println(out, 1, 1);
                    if (totalPage - limit > 2) {
                        this.println(out, "&hellip;", 2);
                    }
                    this.printlnBetween(out, totalPage - limit, totalPage);
                } else {
                    //当前页显示在可见区中间
                    this.println(out, 1, 1);
                    if (leftPageNo > 2) {
                        this.println(out, "&hellip;", 2);
                    }
                    this.printlnBetween(out, leftPageNo, rightPageNo);
                    if (rightPageNo +1 < totalPage) {
                        this.println(out, "&hellip;", rightPageNo +1);
                    }
                    this.println(out, totalPage, totalPage);
                }
            }

            this.println(out, "下一页", nextPageNo);
            this.println(out, "末页", totalPage);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //处理标签后，继续处理JSP后面的内容
        return EVAL_PAGE;
    }

    //============================================辅助方法==========================================

    /**
     * @param out
     * @param name
     * @param href
     * @param cls
     * @throws java.io.IOException
     */
    private void println(JspWriter out, Object name, String href, String cls) throws IOException {
        String str = "<span>";
        if (cls != null) {
            str = "<span class=\"" + cls + "\">";
        }
        if (href != null) {
            if("nofollow".equals(rel)){
                str += "<a rel=\"nofollow\" href=\"" + href + "\" target=\"" + this.getTarget() + "\">" + name + "</a>";
            }else{
                str += "<a href=\"" + href + "\" target=\"" + this.getTarget() + "\">" + name + "</a>";
            }
        } else {
            str += name;
        }

        str += "</span>";
        out.println(str);
    }


    /**
     *
     * @param out
     * @param name
     * @param page
     * @throws java.io.IOException
     */
    private void println(JspWriter out, Object name, int page) throws IOException {
        String cls = null;
        String href = null;
        if (page == pageNo) {
            if (name instanceof Integer) {
                cls = "on";
            } else {
                cls = "null";
                href = "#";
            }
        } else {
            //没有指定地址
            if(BaseStringUtil.isBlank(this.urlString)){
                href = "?pageNo=" + page + queryString;
            }else{

                //指定地址
                if(this.urlString.endsWith(".html")){
                   href = this.urlString.replace(".html","_" + page + ".html#" + this.getAnchor());
                }else{
                    String andStr = "&";
                    if(this.urlString.indexOf("?")==-1){
                      andStr = "?";
                    }
                    href = this.urlString+ andStr + "pageNo=" + page + "#" + this.getAnchor();
                }
            }
        }

        this.println(out, name, href, cls);
    }

    /**
     *
     * @param out
     * @param from
     * @param to
     * @throws java.io.IOException
     */
    private void printlnBetween(JspWriter out, int from, int to) throws IOException {
        if(from<1){
            from = 1;
        }
        if(to>totalPage){
            to = totalPage;
        }
        for (int i = from; i <= to; i++) {
            this.println(out, i, i);
        }
    }

    /**
     * @param queryString
     * @return
     */
    private String getQueryString2(String queryString) {
        if (queryString == null) {
            queryString = "";
        }else{
            queryString = BaseStringUtil.getUtf8(queryString);
            queryString = queryString.replaceAll("pageNo=\\d{0,}", "");
        }
        if(!BaseStringUtil.isBlank(this.getAnchor())){
           if(!queryString.endsWith("#" + this.getAnchor())){
              queryString += "#" + this.getAnchor();
           }
        }
        if (queryString.equals("")) {
            return queryString;
        }

        if (!queryString.startsWith("&") && !queryString.startsWith("#")) {
            queryString = "&" + queryString;
        }
        return queryString;
    }

    //=============================================get/set方法==========================================================

    public PageBean getPageBean() {
        return pageBean;
    }

    public void setPageBean(PageBean pageBean) {
        this.pageBean = pageBean;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public String getAnchor() {
        return anchor;
    }

    public void setAnchor(String anchor) {
        this.anchor = anchor;
    }

    public String getTarget() {
        if(BaseStringUtil.isBlank(target)){
            target = "_self";
        }
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public String getUrlString() {
        return urlString;
    }

    public void setUrlString(String urlString) {
        this.urlString = urlString;
    }

    public String getRel() {
        return rel;
    }

    public void setRel(String rel) {
        this.rel = rel;
    }
}