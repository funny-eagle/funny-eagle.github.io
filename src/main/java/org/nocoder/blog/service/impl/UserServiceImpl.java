package org.nocoder.blog.service.impl;

import org.nocoder.blog.mapper.UserMapper;
import org.nocoder.blog.model.User;
import org.nocoder.blog.service.UserService;
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
