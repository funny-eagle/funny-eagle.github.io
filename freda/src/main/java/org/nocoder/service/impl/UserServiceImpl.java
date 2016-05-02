package org.nocoder.service.impl;

import java.util.List;
import org.nocoder.mapper.UserMapper;
import org.nocoder.model.User;
import org.nocoder.model.UserExample;
import org.nocoder.model.UserExample.Criteria;
import org.nocoder.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl
  implements UserService
{
  @Autowired
  private UserMapper userMapper;
  
  public User queryUserByNameAndPwd(String username, String password)
  {
    UserExample example = new UserExample();
    example.createCriteria().andUsernameEqualTo(username).andPasswordEqualTo(password);
    List<User> list = this.userMapper.selectByExample(example);
    return (list != null) && (list.size() > 0) ? (User)list.get(0) : null;
  }
}
