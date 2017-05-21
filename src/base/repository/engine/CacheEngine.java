package base.repository.engine;

import java.io.Serializable;
import java.util.Collection;


/**
 * 缓存框架接口类
 * User: liuwentao@kongzhong.com
 * Time: 12-6-26 下午3:08
 */
public interface CacheEngine {
	public static final String DUMMY_FQN = "";
	public static final String NOTIFICATION = "notification";

	/**
	 * 初始化缓存框架.
	 */
	public void init();

	/**
	 * 停止缓存框架.
	 */
	public void stop();

	/**
	 * 添加缓存对象.
	 *
	 * @param key the key
	 * @param value the value
	 */
	public void add(Serializable key, Object value);

	/**
	 * 添加缓存对象.
	 *
	 * @param fqn the fqn
	 * @param key the key
	 * @param value the value
	 */
	public void add(String fqn, Serializable key, Object value);

        /**
     *
     * @param fqn
     * @param key
     * @param value
     * @param expireTime
     */
	public void add(String fqn, Serializable key, Object value, long expireTime);

	/**
	 *获取缓存对象.
	 *
	 * @param fqn the fqn
	 * @param key the key
	 * @return the Object
	 */
	public Object get(String fqn, Serializable key);

	/**
	 * 获取缓存对象.
	 *
	 * @param fqn the fqn
	 * @return the Object
	 */
	public Object get(String fqn);

	/**
	 * 获取缓存对象值.
	 *
	 * @param fqn the fqn
	 * @return  Values
	 */
	public Collection getValues(String fqn);

	/**
	 * 移出缓存.
	 *
	 * @param fqn the fqn
	 * @param key the key
	 */
	public void remove(String fqn, Serializable key);

	/**
	 * 移出缓存.
	 *
	 * @param fqn the fqn
	 */
	public void remove(String fqn);

    /**
     *
     * @return
     */
	public String getClientName();

    /**
     *
     * @param clientName
     */
	public void setClientName(String clientName);
}
