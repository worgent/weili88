package base.repository.engine.ehcache;

import base.repository.engine.CacheEngine;
import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheException;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.cache.ehcache.EhCacheManagerFactoryBean;

import java.io.Serializable;
import java.util.*;

/**
 * ehCache缓存实现类
 * User: liuwentao@kongzhong.com
 * Time: 12-6-26 下午3:08
 */
public class EhCacheEngine implements CacheEngine {
    private static final Log log = LogFactory.getLog(EhCacheEngine.class);
	private EhCacheManagerFactoryBean managerFactory; //域 managerFactory
	private CacheManager manager; //域 manager

    /**
     *
     */
	public synchronized void init() {
		synchronized (EhCacheEngine.class) {
			manager = CacheManager.create();
		}
	}

    /**
     *
     */
	public synchronized void stop() {
		synchronized (EhCacheEngine.class) {
			if (manager!=null) manager.shutdown();
		}
	}

    /**
     *
     * @param key the key
     * @param value the value
     */
	public void add(Serializable key, Object value) {
		if (log.isDebugEnabled()) {
			log.debug("Caching " + value + " with key " + key);
		}
		add(CacheEngine.DUMMY_FQN, key, value);
	}

    /**
     *
     * @param fqn
     * @param key the key
     * @param value the value
     */
	public void add(String fqn, Serializable key, Object value) {
		if (!manager.cacheExists(fqn)) {
			try {
				synchronized (EhCacheEngine.class) {
					if (!manager.cacheExists(fqn)) {
						manager.addCache(fqn);
					}
				} 
			} catch (CacheException ce) {
				log.error(ce, ce);
				throw new RuntimeException(ce);
			}
		}
		Cache cache = manager.getCache(fqn);
		Element element = new Element(key, (Serializable)value);
		cache.put(element);
	}

    /**
     * 没有时间功能
     * @param fqn
     * @param key
     * @param value
     * @param expireTime
     */
    public void add(String fqn, Serializable key, Object value, long expireTime) {
        this.add(fqn,key,value);
    }

    /**
     *
     * @param fullyQualifiedName
     * @param key the key
     * @return
     */
	public Object get(String fullyQualifiedName, Serializable key) {
		try {
			if (!manager.cacheExists(fullyQualifiedName)) {
				synchronized (EhCacheEngine.class) {
					if (!manager.cacheExists(fullyQualifiedName)) {
						manager.addCache(fullyQualifiedName);
					}
				}
				return null;
			}
			Cache cache = manager.getCache(fullyQualifiedName);
			Element element = cache.get(key);
			if (element != null) {
				return element.getValue();
			}
			return null;
		} catch (CacheException ce) {
			log.error("EhCache could not be shutdown", ce);
			throw new RuntimeException(ce);
		}
	}

    /**
     *
     * @param fullyQualifiedName
     * @return
     */
	public Object get(String fullyQualifiedName) {
		if (!manager.cacheExists(fullyQualifiedName)) {
			try {
				synchronized (EhCacheEngine.class) {
					if (!manager.cacheExists(fullyQualifiedName)) {
						manager.addCache(fullyQualifiedName);
					}
				}
			} catch (CacheException ce) {
				log.error("EhCache could not be shutdown", ce);
				throw new RuntimeException(ce);
			}
		}
		Cache cache = manager.getCache(fullyQualifiedName);
		return cache;
	}

    /**
     *
     * @param fullyQualifiedName
     * @return
     */
	public Collection getValues(String fullyQualifiedName) {
		try {
			if (!manager.cacheExists(fullyQualifiedName)) {
				synchronized (EhCacheEngine.class) {
					if (!manager.cacheExists(fullyQualifiedName)) {
						manager.addCache(fullyQualifiedName);
					}
				}
				return new ArrayList();
			}
			Cache cache = manager.getCache(fullyQualifiedName);
			List values = new ArrayList(cache.getSize());
			List keys = cache.getKeys();
			Element element = null;
			
			for (Iterator iter = keys.iterator(); iter.hasNext(); ) {
				element = cache.get((Serializable)iter.next());
				values.add( element.getValue() );
			}
			
			sortValues( values );

			return values;
		} catch (CacheException ce) {
			log.error("EhCache could not be shutdown", ce);
			throw new RuntimeException(ce);
		}
	}
	
	
	/**
	 * 获取域  Map.
	 *
	 * @param fullyQualifiedName the fully qualified name
	 * @return  Map
	 */
	public Map getMap( String fullyQualifiedName ) {
		try {
			if (!manager.cacheExists(fullyQualifiedName)) {
				synchronized (EhCacheEngine.class) {
					if (!manager.cacheExists(fullyQualifiedName)) {
						manager.addCache(fullyQualifiedName);
					}
				}
				return new HashMap();
			}
			Cache cache = manager.getCache(fullyQualifiedName);
			Map map = new HashMap( cache.getSize() );
			List keys = cache.getKeys();
			Serializable key = null;
			Element element = null;
			for (Iterator iter = keys.iterator(); iter.hasNext(); ) {
				key = (Serializable)iter.next();
				element = cache.get( key );
				map.put( key, element );
			}
			return map;
		} catch (CacheException ce) {
			log.error("EhCache could not be shutdown", ce);
			throw new RuntimeException(ce);
		}
	}
	
	
	/**
	 * 必须是相同的类型，并且实现了Comparable接口.
	 *
	 * @param valueList the value list
	 */
	private void sortValues( List valueList ) {
		if ( valueList==null || valueList.isEmpty() ){
            return;
        }
		Object value = valueList.get(0);
		if ( !(value instanceof Comparable) ) {
            return;
        }
		String className = value.getClass().getName();
		String valueClassName = null;
		for ( int i=0; i<valueList.size(); i++ ) {
			value = valueList.get(i);
			valueClassName = value.getClass().getName();
			if ( !valueClassName.equals(className) ) return;
		}
		Collections.sort( valueList );
	}

    /**
     *
     * @param fullyQualifiedName
     * @param key the key
     */
	public void remove(String fullyQualifiedName, Serializable key) {
		Cache cache = manager.getCache(fullyQualifiedName);
		if (cache != null) {
			cache.remove(key);
		}
	}

    /**
     *
     * @param fullyQualifiedName
     */
	public void remove(String fullyQualifiedName) {
		if (manager.cacheExists(fullyQualifiedName)) {
			manager.removeCache(fullyQualifiedName);
		}
	}

	/**
	 * 获取域  Manager.
	 *
	 * @return  Manager
	 */
	public CacheManager getManager() {
		return manager;
	}

	/**
	 * 设置域  Manager 值.
	 *
	 * @param manager the manager
	 */
	public void setManager(CacheManager manager) {
		this.manager = manager;
	}

	/**
	 * 获取域  ManagerFactory.
	 *
	 * @return  ManagerFactory
	 */
	public EhCacheManagerFactoryBean getManagerFactory() {
		return managerFactory;
	}

	/**
	 * 设置域  ManagerFactory 值.
	 * @param managerFactory the manager factory
	 */
	public void setManagerFactory(EhCacheManagerFactoryBean managerFactory) {
		this.managerFactory = managerFactory;
		this.manager = (CacheManager) managerFactory.getObject();
	}

    /**
     *
     * @return
     */
	public String getClientName() {
		return null;
	}

    /**
     *
     * @param clientName
     */
	public void setClientName(String clientName) {
	}
}
