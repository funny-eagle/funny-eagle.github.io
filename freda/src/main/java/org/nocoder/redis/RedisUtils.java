package org.nocoder.redis;

import org.nocoder.utils.SerializeUtil;
import redis.clients.jedis.Jedis;

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
        Jedis jedis = new Jedis("45.58.52.59");
        jedis.auth("jasonredis");
        return jedis;
    }
}
