package org.nocoder.service.impl;

import org.nocoder.mapper.UserMapper;
import org.nocoder.model.User;
import org.nocoder.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service("userService") 
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public User queryUserByd(Integer id){
		return userMapper.selectByPrimaryKey(id);
		
	}
}