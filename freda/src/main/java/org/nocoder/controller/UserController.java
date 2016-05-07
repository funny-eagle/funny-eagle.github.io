package org.nocoder.controller;

import javax.annotation.Resource;
import org.nocoder.service.UserService;
import org.springframework.stereotype.Controller;

@Controller
public class UserController {
	@Resource
	private UserService userService;
}
