package base.model;

import base.bean.PageBean;

/**
 * User: liuwentao@kongzhong.com
 * Time: 12-9-22 下午5:30
 */
public class IdPageBeanModel {
    private Integer id;
    private PageBean pageBean;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public PageBean getPageBean() {
        return pageBean;
    }

    public void setPageBean(PageBean pageBean) {
        this.pageBean = pageBean;
    }
}
