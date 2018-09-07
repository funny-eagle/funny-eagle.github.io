package org.jasonyang.service;

import org.jasonyang.model.User;

/**
 * @author jason
 *         用户Service接口
 */
public interface UserService {

    /**
     * 用户验证,返回User对象或null
     *
     * @param username
     * @return User
     */
    User userAuthentication(String username);
}
