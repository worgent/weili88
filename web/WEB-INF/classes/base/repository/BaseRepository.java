package base.repository;

import base.SystemGlobal;
import base.constant.SystemGlobalConstant;
import base.repository.engine.CacheEngine;
import base.repository.engine.CacheEngineFactory;
import base.util.BaseStringUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * 应用层缓存框架抽象类，应用层需要操作缓存功能的类需要继承此类
 * User: liuwentao@kongzhong.com
 * Time: 12-6-26 下午3:08
 */
public abstract class BaseRepository {
    protected final static Log log = LogFactory.getLog(BaseRepository.class);
    private final String KEYS = "keys";
    private boolean cacheEnable ;

    /**
     *
     * @return
     */
    public boolean isCacheEnable() {
        String cache_enable = SystemGlobal.getPreference(SystemGlobalConstant.CACHE_ENABLE);

        if(BaseStringUtil.isBlank(cache_enable)){
            return true;
        }
        cache_enable = cache_enable.trim().toLowerCase();
        cacheEnable =  !"false".equals(cache_enable);
        return cacheEnable;
    }

    public void setCacheEnable(boolean cacheEnable) {
        this.cacheEnable = cacheEnable;
    }


	/**
	 * 获取域  CachedKeyList.
	 *
	 * @return  CachedKeyList
	 */
	protected List<Serializable> getCachedKeyList() {
		CacheEngine cacheEngine = CacheEngineFactory.getEngine();
		return (List<Serializable>) cacheEngine.get( getCacheFullName(), this.KEYS );
	}

	/**
	 * 设置域  CachedKeyList 值.
	 *
	 * @param keys the cached key list
	 */
	private void setCachedKeyList( List<Serializable> keys ) {
		CacheEngine cacheEngine = CacheEngineFactory.getEngine();
		cacheEngine.add( getCacheFullName(),this.KEYS, keys );
	}

	/**
	 * 获取域  CacheValue.
	 *
	 * @param key the key
	 * @return  CacheValue
	 */
	protected Object getCacheValue( Serializable key ) {
		CacheEngine cacheEngine = CacheEngineFactory.getEngine();
		return cacheEngine.get( getCacheFullName(), key );
	}

    protected void setCacheValue( Serializable key, Object value ) {
        this.setCacheValue(key,value,-1);
    }
	/**
	 * Sets the cache value.
	 *
	 * @param key the key
	 * @param value the value
	 */
	protected void setCacheValue( Serializable key, Object value, long expireTime) {
		CacheEngine cacheEngine = CacheEngineFactory.getEngine();
		//cacheEngine.remove( getCacheName(), key );
        if(expireTime == -1){
            cacheEngine.add(getCacheFullName(), key, value);
        }else{
            cacheEngine.add(getCacheFullName(), key, value,expireTime);
        }
        if(!isKeyList()){
            return;
        }
        List<Serializable> keyList = getCachedKeyList();
        if ( keyList==null ) {
            keyList = new ArrayList<Serializable>();
        }
        if ( !keyList.contains(key) ) {
            keyList.add( key );
            setCachedKeyList( keyList );
        }
	}

	/**
	 * 获取域  CacheValueMap.
	 *
	 * @return  CacheValueMap
	 */
	protected Map getCacheValueMap() {
		List<Serializable> keys = getCachedKeyList();
		Map valueMap = new LinkedHashMap();
		if ( keys==null || keys.isEmpty() ) {
            return valueMap;
        }
		Serializable key = null;
		for ( int i=0; i<keys.size(); i++ ) {
			key = keys.get(i);
			valueMap.put( key, getCacheValue(key) );
		}
		return valueMap;
	}

	/**
	 * Removes the cached value.
	 *
	 * @param key the key
	 */
	protected void removeCachedValue( Serializable key ) {
		CacheEngine cacheEngine = CacheEngineFactory.getEngine();
		cacheEngine.remove( getCacheFullName(), key );
		List<Serializable> keyList = getCachedKeyList();
		if ( keyList!=null && keyList.contains(key)) {
			keyList.remove(key);
			setCachedKeyList( keyList );
		}
	}

	/**
	 * Clear.
	 */
	public synchronized void clear() {
		if ( !isKeyList() ) {
            return;
        }
		List<Serializable> keyList = getCachedKeyList();
		if ( keyList == null || keyList.isEmpty() ) {
            return;
        }
		String cacheName = getCacheFullName();
		CacheEngine cacheEngine = CacheEngineFactory.getEngine();
		for ( Serializable key : keyList ) {
			cacheEngine.remove( cacheName, key );
		}
		cacheEngine.remove( cacheName,this.KEYS );
	}

    /**
     *
     * @param key
     * @return
     */
	protected boolean contains( Serializable key ) {
		Object o = getCacheValue(key);
		return (o!=null);
	}

    /**
     *
     * @return
     */
	public String getCacheFullName() {
		String prefix = SystemGlobal.getPreference(SystemGlobalConstant.CACHE_PREFIX);
		if ( prefix != null ) {
            prefix = prefix.trim();
        } else{
            prefix = "";
        }
		if ( prefix.length() > 0 ) {
			return prefix + "_" + getCacheName();
		} else {
			return getCacheName();
		}
	}

	/**
	 * 获取域  CacheName.
	 *
	 * @return  CacheName
	 */
	public abstract String getCacheName();

	/**
	 * 是否将缓存对象的key保存到一个list中.
	 *
	 * @return  默认为flase
	 */
	public boolean isKeyList() {
		return false;
	}
}
