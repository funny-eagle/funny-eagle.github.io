package org.nocoder.blog.configuration;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

@Configuration
public class RedisConfig {

    private static Logger logger = Logger.getLogger(RedisConfig.class);

    @Value("${redis_server_host}")
    private String host;

    @Value("${redis_server_port}")
    private int port;

    @Value("${redis_server_auth}")
    private String password;

    @Bean
    public Jedis jedis() {
        JedisPoolConfig config = new JedisPoolConfig();
        config.setMaxTotal(500);
        config.setMaxIdle(5);
        config.setMaxWaitMillis(100000);
        JedisPool pool = new JedisPool(config, host, port, 100000);

        Jedis jedis = null;
        try {
            jedis = pool.getResource();
            if (StringUtils.isNotEmpty(password)) {
                jedis.auth(password);
            }
            logger.info("redis 连接成功！");
        } catch (Exception ex) {
            logger.error("连接 Redis Server 失败！ " + ex);
        }
        return jedis;
    }
}
