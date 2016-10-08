package org.nocoder.redis;

import org.nocoder.utils.SerializeUtil;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

import java.util.List;

/**
 * Redis工具类
 *
 * Created by yangjinlong on 16/9/25.
 */
public class RedisUtils {

    public static void setList(String key, List<?> list){
        getJedis().set(key.getBytes(), SerializeUtil.serializeList(list));
    }

    public static List<?> getList(String key){
        byte[] bytes = getJedis().get(key.getBytes());
        return SerializeUtil.unserializeList(bytes);
    }

    public static Jedis getJedis(){
        JedisPoolConfig config = new JedisPoolConfig();
        //控制一个pool可分配多少个jedis实例，通过pool.getResource()来获取；
        //如果赋值为-1，则表示不限制；如果pool已经分配了maxActive个jedis实例，则此时pool的状态为exhausted(耗尽)。
        config.setMaxTotal(500);
        //控制一个pool最多有多少个状态为idle(空闲的)的jedis实例。
        config.setMaxIdle(5);
        //表示当borrow(引入)一个jedis实例时，最大的等待时间，如果超过等待时间，则直接抛出JedisConnectionException；
        config.setMaxWaitMillis(100000);
        //在borrow一个jedis实例时，是否提前进行validate操作；如果为true，则得到的jedis实例均是可用的；
        JedisPool pool = new JedisPool(config, "45.58.52.59", 6379, 100000);
        Jedis jedis = pool.getResource();
        // Jedis jedis = new Jedis("45.58.52.59");
        jedis.auth("jasonredis");

        return jedis;
    }
}
