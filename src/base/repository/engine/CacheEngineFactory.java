package base.repository.engine;

import base.SystemGlobal;
import org.apache.commons.lang.StringUtils;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 缓存引擎工厂类
 * User: liuwentao@kongzhong.com
 * Time: 12-6-26 下午3:08
 */
public class CacheEngineFactory {
	/** 域 cacheEngineMap. */
	private static Map<String, CacheEngine> cacheEngineMap = new ConcurrentHashMap<String, CacheEngine>();

	/**
	 * 获取域  Engine.
	 * @return  Engine
	 */
	public static CacheEngine getEngine() {
		CacheEngine cacheEngine = cacheEngineMap.get("");
		if ( cacheEngine!=null ) {
            return cacheEngine;
        }
		String cacheEngineClass = SystemGlobal.getPreference("cache.implement");
		if ( StringUtils.isBlank(cacheEngineClass) ) {
            cacheEngineClass = "com.koolearn.util.cache.DefaultCacheEngine";
        }
		return getEngine( "",cacheEngineClass );
	}

    /**
     *
     * @param name
     * @param cacheEngineClass
     * @return
     */
	public static CacheEngine getEngine( String name, String cacheEngineClass ) {
		CacheEngine cacheEngine = cacheEngineMap.get(name);
		if ( cacheEngine!=null ) {
            return cacheEngine;
        }
		try {
			synchronized (CacheEngineFactory.class) {
				cacheEngine = cacheEngineMap.get(name);
				if ( cacheEngine == null ) {
					cacheEngine = (CacheEngine) Class.forName( cacheEngineClass ).newInstance();
					cacheEngine.init();
					cacheEngineMap.put( name, cacheEngine );
				}
			}
			return cacheEngine;
		} catch ( Exception e ) {
			e.printStackTrace();
			return null;
		}
	}

    /**
     *
     * @param name
     * @return
     */
	public static CacheEngine getEngine( String name ) {
		return cacheEngineMap.get(name);
	}

    /**
     *
     * @return
     */
	public static boolean isEngineStarted() {
		CacheEngine cacheEngine = getEngine();
		return ( cacheEngine!=null );
	}
}
