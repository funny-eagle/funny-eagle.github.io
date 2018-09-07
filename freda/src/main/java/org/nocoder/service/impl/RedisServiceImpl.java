package org.nocoder.service.impl;

import org.apache.log4j.Logger;
import org.nocoder.service.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;

/**
 * Redis Service
 */
@Service
public class RedisServiceImpl implements RedisService {
    private static Logger logger = Logger.getLogger(RedisServiceImpl.class);

    @Autowired
    private Jedis jedis;

}
