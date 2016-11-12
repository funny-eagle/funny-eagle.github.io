package org.nocoder.service;

import org.nocoder.model.User;

public abstract interface UserService {

	/**
	 * 用户验证,返回User对象或null
	 * @param username
	 * @param password
	 * @return User
	 */
	User UserAuthentication(String username, String password);
}
