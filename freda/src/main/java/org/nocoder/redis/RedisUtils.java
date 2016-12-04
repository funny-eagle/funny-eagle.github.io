package org.nocoder.redis;

import java.util.List;

import org.nocoder.utils.SerializeUtil;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * Redis工具类
 *
 * Created by yangjinlong on 16/9/25.
 */
public class RedisUtils {
	private static JedisPool pool;

	static{
		JedisPoolConfig config = new JedisPoolConfig();
        config.setMaxTotal(500);
        config.setMaxIdle(5);
        config.setMaxWaitMillis(100000);
        pool = new JedisPool(config, "192.168.1.16", 6379, 100000);
	}
	
    public static void setList(String key, List<?> list){
        getJedis().set(key.getBytes(), SerializeUtil.serializeList(list));
    }

    public static List<?> getList(String key){
        byte[] bytes = getJedis().get(key.getBytes());
        return SerializeUtil.unserializeList(bytes);
    }

    public static Jedis getJedis(){
    	Jedis jedis = pool.getResource();
    	jedis.auth("123456");
        return jedis;
    }
    
    public static void main(String[] args) {
    	Jedis jedis = RedisUtils.getJedis();
    	jedis.set("aaa","bbb");
	}
}
