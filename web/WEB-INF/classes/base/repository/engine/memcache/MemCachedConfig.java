package base.repository.engine.memcache;

import base.SystemGlobal;
import org.apache.commons.lang.StringUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * memcache缓存配置类
 * User: liuwentao@kongzhong.com
 * Time: 12-6-26 下午3:08
 */
public class MemCachedConfig {
	private String name; //缓存名称
	private long expireTime = 0; //缓存过期时间
	private long localExpireTime = 0; //本地缓存时间
	private int length = 10; //缓存记录条数

    /**
     *
     * @return
     */
	public long getExpireTime() {
		return expireTime;
	}

    /**
     *
     * @param expireTime
     */
	public void setExpireTime(long expireTime) {
		this.expireTime = expireTime;
	}

    /**
     *
     * @return
     */
	public String getName() {
		return name;
	}

    /**
     *
     * @param name
     */
	public void setName(String name) {
		this.name = name;
	}

    /**
     *
     * @return
     */
	public int getLength() {
		return length;
	}

    /**
     *
     * @param length
     */
	public void setLength(int length) {
		this.length = length;
	}

    /**
     *
     * @return
     */
	public long getLocalExpireTime() {
		return localExpireTime;
	}

    /**
     *
     * @param localExpireTime
     */
	public void setLocalExpireTime(long localExpireTime) {
		this.localExpireTime = localExpireTime;
	}
	
	private static Map<String, MemCachedConfig> reposMap = null; //域 reposMap

    /**
     *
     */
	private static void init() {
		reposMap = new HashMap<String, MemCachedConfig>();
		String configInfo = SystemGlobal.getPreference("cache.repos");
		if ( StringUtils.isBlank(configInfo) ) {
            return;
        }
		String[] reposArray = configInfo.split("\\|");
		MemCachedConfig repos = null;
		for ( int i=0; i<reposArray.length; i++ ) {
			repos = parseRepos( reposArray[i] );
			if ( repos!=null ) {
				reposMap.put( repos.getName(), repos );
			}
		}
	}

    /**
     *
     * @param info
     * @return
     */
	private static MemCachedConfig parseRepos( String info ) {
		if ( StringUtils.isBlank(info) ) {
            return null;
        }
		info = info.trim();
		String[] config = info.split(",");
		if ( config.length<2 ) {
            return null;
        }
		MemCachedConfig repos = new MemCachedConfig();
		repos.setName( config[0].trim() );
		repos.setExpireTime( Long.parseLong(config[1].trim()) );
		if ( config.length >= 3 ) {
			repos.setLocalExpireTime( Long.parseLong(config[2].trim()) );
		}
		if ( config.length >= 4 ) {
			repos.setLength( Integer.parseInt(config[3].trim()) );
		}
		return repos;
	}

    /**
     *
     * @param name
     * @return
     */
	public static MemCachedConfig getRepos( String name ) {
		if ( reposMap==null ) {
			init();
		}
		return reposMap.get(name);
	}
}
