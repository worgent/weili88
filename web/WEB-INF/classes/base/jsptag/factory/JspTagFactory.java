package base.jsptag.factory;


import base.SystemGlobal;
import base.jsptag.ConfigBean;
import base.jsptag.repository.JspTagRepository;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.sql.SQLException;

/**
 * 资讯标签所用到的工厂类
 *
 * @author yangming
 */

public class JspTagFactory {
    private final Log log = LogFactory.getLog(getClass());

    private final static JspTagRepository repository = JspTagRepository.getInstance();

    //------------------------------------------read------------------------------

    /**
     * 读
     *
     * @param key
     * @return
     */
    public static ConfigBean getConfigBean(String key) {
        ConfigBean configBean = null;

        boolean cache = SystemGlobal.getBooleanPreference("cache.jsptag.config",false);
        if(!cache){
            return configBean;
        }
        try {
            configBean = repository.getConfigBean(key);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return configBean;
    }

    /**
     * 写
     *
     * @param key
     * @param configBean
     */
    public static void setConfigBean(String key, ConfigBean configBean) {
        repository.setConfigBean(key, configBean);
    }
}