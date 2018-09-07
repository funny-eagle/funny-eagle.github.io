package org.jasonyang.configuration;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

@Configuration
public class RedisConfig {

    @Value("${redis_server_host}")
    private String host;

    @Value("${redis_server_port}")
    private int port;

    @Bean
    public JedisPool jedisPool(){
        JedisPoolConfig config = new JedisPoolConfig();
        config.setMaxTotal(500);
        config.setMaxIdle(5);
        config.setMaxWaitMillis(100000);
        JedisPool pool = new JedisPool(config, host, port, 100000);
        return pool;
    }
}
