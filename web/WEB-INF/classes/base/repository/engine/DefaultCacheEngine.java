package base.repository.engine;

import java.io.Serializable;
import java.util.*;

/**
 * 默认缓存实现类
 * User: liuwentao@kongzhong.com
 * Time: 12-6-26 下午3:08
 */
public class DefaultCacheEngine implements CacheEngine {
    private Map cache = new Hashtable(); //域 cache

    /**
     * @param key   the key
     * @param value the value
     */
    public void add(Serializable key, Object value) {
        this.cache.put(key, value);
    }

    /**
     * @param fqn   the fqn
     * @param key   the key
     * @param value the value
     */
    public void add(String fqn, Serializable key, Object value) {
        Map m = (Map) this.cache.get(fqn);
        if (m == null) {
            m = new HashMap();
        }
        m.put(key, value);
        this.cache.put(fqn, m);
    }

    public void add(String fqn, Serializable key, Object value, long expireTime) {
        this.add(fqn,key,value);
    }

    /**
     * @param fqn the fqn
     * @param key the key
     * @return
     */
    public Object get(String fqn, Serializable key) {
        Map m = (Map) this.cache.get(fqn);
        if (m == null) {
            return null;
        }
        return m.get(key);
    }

    /**
     * @param fqn the fqn
     * @return
     */
    public Object get(String fqn) {
        return this.cache.get(fqn);
    }

    /**
     * @param fqn the fqn
     * @return
     */
    public Collection getValues(String fqn) {
        Map m = (Map) this.cache.get(fqn);
        if (m == null) {
            return new ArrayList();
        }
        return m.values();
    }

    /**
     *
     */
    public synchronized void init() {
        this.cache = new HashMap();
    }

    /**
     *
     */
    public synchronized void stop() {
    }

    /**
     * @param fqn the fqn
     * @param key the key
     */
    public void remove(String fqn, Serializable key) {
        Map m = (Map) this.cache.get(fqn);
        if (m != null) {
            m.remove(key);
        }
    }

    /**
     * @param fqn the fqn
     */
    public void remove(String fqn) {
        this.cache.remove(fqn);
    }

    /**
     * @param fqn
     * @return
     */
    public Map getMap(String fqn) {
        Map m = (Map) this.cache.get(fqn);
        return Collections.unmodifiableMap(m);
    }

    /**
     * @return
     */
    public String getClientName() {
        return null;
    }

    /**
     * @param clientName
     */
    public void setClientName(String clientName) {
    }
}
