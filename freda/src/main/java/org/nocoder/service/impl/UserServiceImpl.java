package org.nocoder.service.impl;

import org.nocoder.mapper.UserMapper;
import org.nocoder.model.User;
import org.nocoder.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
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
