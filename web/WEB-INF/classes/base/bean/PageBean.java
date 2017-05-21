package base.bean;

import base.util.BaseIntUtil;
import base.util.BasePageUtil;

import java.io.Serializable;

/**
 * User: liuwentao@kongzhong.com
 * Time: 12-9-13 下午5:30
 */
public class PageBean implements Serializable {
    private int from;// 分页查询开始记录位置
    private int to; // 分页查看下结束位置
    private int length;// 每页显示记录数
    private int pageNo; // 当前页码
    private int totalRow;// 查询结果总记录数
    private int totalPage;// 总共页数

    private String pageBar;

    public PageBean() {
    }

    public PageBean(int length){
        this.length = length;
        this.to = this.from + this.length;
    }

    public void init(int count) {
        this.totalRow = count;
        this.totalPage = BasePageUtil.getTotalPage(count, length);
        if (this.pageNo > totalPage) {
            this.pageNo = totalPage;
        }
        if (this.pageNo < 1) {
            this.pageNo = 1;
        }
        this.from = BasePageUtil.getFrom(this.pageNo,this.getLength());

        this.to = this.from + this.length;
        if(this.to>this.totalRow){
            this.to = this.totalRow;
        }
    }

    public void init(String ids) {
        int count = BaseIntUtil.getIntArrayLength(ids);
        init(count);
    }



    public void init() {
        if (this.length < 1) {
            this.length = 10;
        }

        if (this.pageNo < 1) {
            //没指定 页码
            this.to = this.from + this.length;
            this.pageNo = 1;
        } else {
            //指定了 页码
            this.from = (this.pageNo - 1) * this.length;
            this.to = this.from + this.length;
        }
    }

    /**
     * 构造函数
     *
     * @param from
     * @param length
     */
    public PageBean(int from, int length) {
        this.from = from;
        this.length = length;
        this.to = this.from + this.length;
        this.pageNo = (int) Math.floor((this.from * 1.0d) / this.length) + 1;
    }

    /**
     * @param from
     * @param length
     * @param totalRow
     */
    public PageBean(int from, int length, int totalRow) {
        this(from, length);
        this.totalRow = totalRow;
    }

    /**
     * @return the from
     */
    public int getFrom() {
        return from;
    }

    /**
     * @return the to
     */
    public int getTo() {
        return to;
    }

    /**
     * @param to the to to set
     */
    public void setTo(int to) {
        this.to = to;
    }

    /**
     * @param from the from to set
     */
    public void setFrom(int from) {
        this.from = from;
        if (this.length != 0) {
            this.pageNo = (int) Math.floor((this.from * 1.0d) / this.length) + 1;
        }
    }

    /**
     * @return the length
     */
    public int getLength() {
        return length;
    }

    /**
     * @param length the length to set
     */
    public void setLength(int length) {
        if (length == 0) {
            length = 10;
        }
        this.length = length;
        if (this.from != 0) {
            this.pageNo = (int) Math.floor((this.from * 1.0d) / this.length) + 1;
        }
    }

    /**
     * @return the totalRow
     */
    public int getTotalRow() {
        return totalRow;
    }

    /**
     * @param totalRow the totalRow to set
     */
    public void setTotalRow(int totalRow) {
        this.totalRow = totalRow;
        if (this.length == 0) {
            this.length = 10;
        }
        this.totalPage = BasePageUtil.getTotalPage(this.totalRow,this.length);
        if (this.pageNo > this.totalPage) {
            this.pageNo = this.totalPage;
        }
        this.init();
    }

    /**
     * @return the pageNo
     */
    public int getPageNo() {
        return pageNo;
    }

    /**
     * @param pageNo the pageNo to set
     */
    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    /**
     * @return the totalPage
     */
    public int getTotalPage() {
        if (totalPage == 0) {
            return 1;
        }
        return totalPage;
    }

    /**
     * @param totalPage the totalPage to set
     */
    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }


    /**
     * 后台分页用
     *
     * @return
     */
    public String getPageBar() {
        StringBuffer str = new StringBuffer(1024);
        str.append("<table class=\"page-table\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\"><tr><td class='right'><div>");
        if (pageNo > 1) {
            str.append(
                    "<a href=\"#\" class='page' onclick='$(\"#pageNo\").val(1);document.forms[0].submit();'>首页</a>&nbsp;");
        } else {
            str.append("<a href=\"#\" class='page'>首页</a>&nbsp;");
        }
        if (pageNo > 1) {
            str.append(
                    "<a href=\"#\" class='page' onclick='$(\"#pageNo\").val(" + (pageNo - 1) + ");document.forms[0].submit();'>上页</a>&nbsp;");
        } else {
            str.append("<a href=\"#\" class='page'>上页</a>&nbsp;");
        }
        if (pageNo < totalPage) {
            str.append(
                    "<a href=\"#\" class='page' onclick='$(\"#pageNo\").val(" + (pageNo + 1) + ");document.forms[0].submit();'>下页</a>&nbsp;");
        } else {
            str.append("<a href=\"#\" class='page'>下页</a>&nbsp;");
        }
        if (totalPage > 1 && pageNo != totalPage) {
            str.append(
                    "<a href=\"#\" class='page' onclick='$(\"#pageNo\").val(" + totalPage + ");document.forms[0].submit();'>末页</a>&nbsp;");
        } else {
            str.append("<a href=\"#\" class='page'>末页</a>&nbsp;");
        }

        str.append("<span class=\"pages\">共<font color='blue'>" + totalRow + "</font>条</span>&nbsp;");

        str.append("<span class=\"pages\">每页<SELECT class='page_input' name=\"length\" id=\"length\" onchange='$(\"#pageNo\").val(1);document.forms[0].submit();'>");

        str.append("<OPTION value='" + this.getLength() + "'>" + this.getLength() + "</OPTION>");
        if (this.getLength() != 10) {
            str.append("<OPTION value='10'>10</OPTION>");
        }
        if (this.getLength() != 50) {
            str.append("<OPTION value='50'>50</OPTION>");
        }
        if (this.getLength() != 100) {
            str.append("<OPTION value='100'>100</OPTION>");
        }
        if (this.getLength() != 200) {
            str.append("<OPTION value='200'>200</OPTION>");
        }
        if (this.getLength() != 500) {
            str.append("<OPTION value='500'>500</OPTION>");
        }
        if (this.getLength() != 1000) {
            str.append("<OPTION value='1000'>1000</OPTION>");
        }
        str.append("</SELECT>");
        str.append("条</span>&nbsp;<span>分<font color='blue'>" + totalPage + "</font>页 </span>&nbsp;<span>转到");

        str.append("<SELECT name=\"Pagelist\" class='page_input' onchange='$(\"#pageNo\").val(this.value);document.forms[0].submit();'>");
        for (int i = 1; i < totalPage + 1; i++) {
            if (i == pageNo) {
                str.append("<OPTION value=" + i + " selected>" + i +
                        "</OPTION>");
            } else {
                str.append("<OPTION value=" + i + ">" + i + "</OPTION>");
            }
        }
        str.append("</SELECT>页&nbsp;&nbsp;</span></td></tr></table>");

        str.append("<script type=\"text/javascript\">$('#length').val(" + length + ") </script>");
        str.append("<INPUT type='hidden'  value='" + pageNo + "' name=\"pageNo\" id=\"pageNo\" > ");
        str.append("<INPUT type='hidden'  value='" + totalPage + "' name=\"totalPage\"> ");

        return str.toString();
    }
}