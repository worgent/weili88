package base.repository.engine.memcache;

import com.alisoft.xplatform.asf.cache.ICacheManager;
import com.alisoft.xplatform.asf.cache.IMemcachedCache;
import com.alisoft.xplatform.asf.cache.memcached.CacheUtil;
import com.alisoft.xplatform.asf.cache.memcached.MemcachedCacheManager;
import base.repository.engine.CacheEngine;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

/**
 * 阿里巴巴 memcache实现类
 * User: liuwentao@kongzhong.com
 * Time: 12-6-26 下午3:08
 */
public class AliMemCacheEngine implements CacheEngine {
    private static final Log log = LogFactory.getLog(AliMemCacheEngine.class);
	private static ICacheManager<IMemcachedCache> cacheManager;
	private static String DEFAULT_MCLIENT = "mclient";
	//private static String DEFAULT_MCLIENT = "cluster1";
	private static String SEPERATOR = "_";

    /**
     *
     */
	public synchronized void init() {
        String cacheManagerName = MemcachedCacheManager.class.getName();
		cacheManager = CacheUtil.getCacheManager(IMemcachedCache.class, cacheManagerName);
//		JndiApp jndiAppConfig = ConfigInitializer.getJndiAppConfig();
//		if ( jndiAppConfig != null ) {
//			String domain = jndiAppConfig.getAppDomain();
//			String configFile = "memcached_" + domain + ".xml";
//
//			InputStream is = this.getClass().getClassLoader().getResourceAsStream( configFile );
//            if ( is != null ) {
//        		cacheManager.setConfigFile( configFile );
//            }
//		}
		cacheManager.start();
	}
	
	
	/**
	 * 清空缓存.
	 */
	public static synchronized void clear() {
		IMemcachedCache cache = cacheManager.getCache(DEFAULT_MCLIENT);
		cache.clear();
	}


    /**
     *
     * @param key the key
     * @param value the value
     */
	public void add(Serializable key, Object value) {
		try {
			if (value == null) {
                return;
            }
			IMemcachedCache cache = cacheManager.getCache( DEFAULT_MCLIENT );
			long expireTime = getExpireTime(null);
			if ( expireTime<=0 ) {
				cache.put( key.toString(), value );
			} else {
				cache.put( key.toString(), value, new Date(expireTime) );
			}
		} catch ( Exception e ) {
			log.error( e.getMessage() );
		}
	}

    /**
     *
     * @param fqn the fqn
     * @param key the key
     * @param value the value
     */
	public void add(String fqn, Serializable key, Object value) {
		try {
			if (value == null) return;
			long expireTime = getExpireTime(fqn);
			add( fqn, key, value, expireTime );
		} catch (Exception e) {
			log.error( e.getMessage() );
		}
	}

    /**
     *
     * @param fqn
     * @param key
     * @param value
     * @param expireTime
     */
	public void add( String fqn, Serializable key, Object value, long expireTime ) {
		try {
			if ( key == null || value == null ) {
                return;
            }
			IMemcachedCache cache = cacheManager.getCache( DEFAULT_MCLIENT );
			String cacheKey = key.toString();
			if ( !StringUtils.isBlank(fqn) ) {
				cacheKey = fqn + SEPERATOR + cacheKey;
			}
			if ( expireTime<=0 ) {
				cache.put( cacheKey, value );
			} else {
				cache.put( cacheKey, value, new Date(expireTime) );
			}
		} catch (Exception e) {
			log.error( e.getMessage() );
		}
	}

    /**
     *
     * @param fqn the fqn
     * @param key the key
     * @return
     */
	public Object get(String fqn, Serializable key) {
        String cacheKey = key.toString();
        if ( !StringUtils.isBlank(fqn) ) {
            cacheKey = fqn + SEPERATOR + cacheKey;
        }
		try {
			IMemcachedCache cache = cacheManager.getCache( DEFAULT_MCLIENT );
			int localExpireTime = (int) this.getLocalExpireTime(fqn) / 1000;
//			if ( localExpireTime > 0 ) {
//				return cache.get(cacheKey, localExpireTime );
//			} else {
//				return cache.get(cacheKey);
//			}

            return cache.get(cacheKey);
		} catch (Exception e) {
			log.error( e.getMessage() );
            e.printStackTrace();
            log.error("cacheKey=" + cacheKey);
			return null;
		}
	}

    /**
     *
     * @param key
     * @return
     */
	public Object get(Serializable key) {
		try {
			IMemcachedCache cache = cacheManager.getCache( DEFAULT_MCLIENT );
			return cache.get(key.toString(), 60);
		} catch (Exception e) {
			log.error( e.getMessage() );
			return null;
		}
	}

    /**
     *
     * @param fqn the fqn
     * @return
     */
	public Collection getValues(String fqn) {
		return null;
	}

    /**
     *
     * @param fqn the fqn
     * @return
     */
	public Object get(String fqn) {
		return null;
	}

    /**
     *
     * @param fqn the fqn
     * @param key the key
     */
	public void remove(String fqn, Serializable key) {
		try {
			IMemcachedCache cache = cacheManager.getCache( DEFAULT_MCLIENT );
			String cacheKey = key.toString();
			if ( !StringUtils.isBlank(fqn) ) {
                cacheKey = fqn + SEPERATOR + cacheKey;
            }
			cache.remove( cacheKey );
		} catch (Exception e) {
			log.error( e.getMessage() );
		}
	}

    /**
     *
     * @param fqn the fqn
     */
	public void remove(String fqn) {

	}
	
	
	/**
	 * 获取域  ExpireTime.
	 *
	 * @param fqn the fqn
	 * @return  ExpireTime
	 */
	private long getExpireTime( String fqn ) {
		MemCachedConfig config = MemCachedConfig.getRepos(fqn);
		if ( config!=null ) {
			long time = config.getExpireTime();
			return time;
		}
		return 2*3600*1000;
	}
	
	
	/**
	 * 获取域  LocalExpireTime.
	 *
	 * @param fqn the fqn
	 * @return  LocalExpireTime
	 */
	private long getLocalExpireTime( String fqn ) {
		MemCachedConfig config = MemCachedConfig.getRepos(fqn);
		if ( config!=null ) {
			long time = config.getLocalExpireTime();
			return time;
		}
		return 300000;
	}

    /**
     *
     */
	public synchronized void stop() {
		try {
			if (cacheManager != null) {
				cacheManager.stop();
			}
		} catch (Exception e) {
            e.printStackTrace();
		}		
	}

    /**
     *
     * @return
     */
	public static ICacheManager<IMemcachedCache> getCacheManager() {
		return cacheManager;
	}
	
	
	/**
	 * Reset.
	 */
	public static synchronized void reset() {
        String cacheManagerName = MemcachedCacheManager.class.getName();
		ICacheManager<IMemcachedCache> manager = CacheUtil.getCacheManager(IMemcachedCache.class, cacheManagerName);
		manager.start();
		IMemcachedCache cache = manager.getCache(DEFAULT_MCLIENT);
//		cache.put("key_20091019", "key_20091019", new Date(60000) );
//		String s = (String) cache.get( "key_20091019" );
//		System.out.println( "1=" + s );
//		while ( s!=null ) {
//			Thread.sleep( 10000 );
//			s = (String) cache.get( "key_20091019" );
//			System.out.println( "1=" + s );
//		}
		cache.clear();
		manager.stop();
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
