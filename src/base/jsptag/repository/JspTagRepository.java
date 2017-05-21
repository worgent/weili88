package base.jsptag.repository;

import base.jsptag.ConfigBean;
import base.repository.BaseRepository;
import base.util.BaseStringUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.sql.SQLException;

/**
 * User: liuwentao@kongzhong.com
 * Date: 2011-5-25 14:03:54
 * <p/>
 * 说明：
 */
public class JspTagRepository extends BaseRepository {
    private static JspTagRepository _instance = null;
    public static synchronized JspTagRepository getInstance() {
        if (_instance == null) {
            _instance = new JspTagRepository();
        }
        return _instance;
    }
    private JspTagRepository() {
    }

	private final Log log = LogFactory.getLog(getClass());

	//缓存的KEY值

	@Override
	public String getCacheName() {
		return JspTagRepository.class.getSimpleName();
	}

	//------------------------------------------read------------------------------

	/**
	 * 读
	 * @param key
	 * @return
	 */
	public ConfigBean getConfigBean(String key) throws SQLException {
		ConfigBean configBean = (ConfigBean) super.getCacheValue(key);
        return configBean;
	}

    /**
     * 写
     * @param key
     * @param configBean
     */
    public void setConfigBean(String key,ConfigBean configBean){
        if(BaseStringUtil.isBlank(key) || configBean==null){
            return ;
        }
        this.setCacheValue(key, configBean);
    }

}