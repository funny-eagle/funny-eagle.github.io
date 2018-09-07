package org.jasonyang.redis;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.jasonyang.utils.PropUtils;
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

    public static Jedis getJedis() {
        Jedis jedis = null;
        try {
            jedis = pool.getResource();
            if (StringUtils.isNotEmpty(PropUtils.getConfigValue("redis_server_auth"))) {
                jedis.auth(PropUtils.getConfigValue("redis_server_auth"));
            }
        } catch (Exception ex) {
            logger.error("连接 Redis Server 失败！ " + ex);
        }
        logger.info("redis 连接成功！");
        return jedis;
    }

    public static void main(String[] args) {
        Jedis jedis = RedisUtils.getJedis();
        jedis.set("aaa", "bbb");
        logger.info("--->" + jedis.get("aaa"));
    }
}
