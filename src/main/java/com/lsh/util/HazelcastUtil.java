package com.lsh.util;

import com.hazelcast.core.HazelcastInstance;
import com.hazelcast.core.IMap;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;
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

    IMap<String, Object> cache = hazelcastInstance.getMap("hazelcastMap");


    /**
     * 缓存基本的对象，Integer、String、实体类等
     *
     * @param key   缓存的键值
     * @param value 缓存的值
     */
    public <T> void setCacheObject(final String key, final T value) {
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
        cache.set(key, value, timeout, timeUnit);
    }

    public void deleteObject(String cacheKey) {
        cache.remove(cacheKey);
    }

    public boolean hasKey(String cacheKey) {
        return cache.containsKey(cacheKey);
    }

    public <T> T getCacheObject(final String key) {
        return (T)cache.get(key);
    }
}
