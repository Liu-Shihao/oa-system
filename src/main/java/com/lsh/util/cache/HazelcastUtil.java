package com.lsh.util.cache;

import com.hazelcast.core.HazelcastInstance;
import com.hazelcast.core.IMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;

/**
 * @Author: Joey
 * @Date: 2023/3/13 22:23
 * @Desc:
 */
@Component
public class HazelcastUtil {
    @Autowired
    private HazelcastInstance hazelcastInstance;



    /**
     * 缓存基本的对象，Integer、String、实体类等
     *
     * @param key   缓存的键值
     * @param value 缓存的值
     */
    public <T> void setCacheObject(final String key, final T value) {
        IMap<String, Object> cache = hazelcastInstance.getMap("hazelcastMap");

        cache.set(key, value);
    }

    /**
     * 缓存基本的对象，Integer、String、实体类等
     *
     * @param key      缓存的键值
     * @param value    缓存的值
     * @param timeout  时间
     * @param timeUnit 时间颗粒度
     */
    public <T> void setCacheObject(final String key, final T value, final Integer timeout, final TimeUnit timeUnit) {
        IMap<String, Object> cache = hazelcastInstance.getMap("hazelcastMap");

        cache.set(key, value, timeout, timeUnit);
    }

    public void deleteObject(String cacheKey) {
        IMap<String, Object> cache = hazelcastInstance.getMap("hazelcastMap");

        cache.remove(cacheKey);
    }

    public boolean hasKey(String cacheKey) {
        IMap<String, Object> cache = hazelcastInstance.getMap("hazelcastMap");

        return cache.containsKey(cacheKey);
    }

    public <T> T getCacheObject(final String key) {
        IMap<String, Object> cache = hazelcastInstance.getMap("hazelcastMap");

        return (T)cache.get(key);
    }
}
