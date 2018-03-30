package org.jasonyang.redis;

import java.util.List;

import org.apache.log4j.Logger;
import org.jasonyang.utils.PropUtils;
import org.jasonyang.utils.SerializeUtil;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * Redis工具类
 * <p>
 * Created by yangjinlong on 16/9/25.
 *
 * @author jason
 */
public class RedisUtils {
    private static Logger logger = Logger.getLogger(RedisUtils.class);
    private static JedisPool pool;

    static {
        JedisPoolConfig config = new JedisPoolConfig();
        config.setMaxTotal(500);
        config.setMaxIdle(5);
        config.setMaxWaitMillis(100000);
        pool = new JedisPool(config, PropUtils.getConfigValue("redis_server_host"), Integer.valueOf(PropUtils.getConfigValue("redis_server_port")), 100000);
    }

    public static void setList(String key, List<?> list) {
        getJedis().set(key.getBytes(), SerializeUtil.serializeList(list));
    }

    public static List<?> getList(String key) {
        byte[] bytes = getJedis().get(key.getBytes());
        return SerializeUtil.unserializeList(bytes);
    }

    public static Jedis getJedis() {
        Jedis jedis = null;
        try {
            jedis = pool.getResource();
            jedis.auth(PropUtils.getConfigValue("redis_server_auth"));
        } catch (Exception ex) {
            logger.error("未获取到Jedis资源,请检查Redis Server是否启动! " + ex);
        }

        return jedis;
    }

    public static void main(String[] args) {
        Jedis jedis = RedisUtils.getJedis();
        jedis.set("aaa", "bbb");
        System.out.println(jedis.get("aaa"));
    }
}
