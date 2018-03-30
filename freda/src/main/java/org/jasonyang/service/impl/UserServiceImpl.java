package org.jasonyang.service.impl;

import org.jasonyang.mapper.UserMapper;
import org.jasonyang.model.User;
import org.jasonyang.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

/**
 * 用户Service实现类
 *
 * @author jason
 */
@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public User userAuthentication(String username) {
        User user = userMapper.selectUserByName(username);
        return user;
    }
}
