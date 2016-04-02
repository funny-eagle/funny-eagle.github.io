package org.nocoder.service;

import org.nocoder.model.User;

public interface UserService {

	User queryUserByNameAndPwd(String username, String password);

}
