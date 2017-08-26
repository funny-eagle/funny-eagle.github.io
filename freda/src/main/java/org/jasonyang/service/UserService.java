package org.jasonyang.service;

import org.jasonyang.model.User;

public abstract interface UserService {

	/**
	 * 用户验证,返回User对象或null
	 * @param username
	 * @return User
	 */
	User UserAuthentication(String username);
}
