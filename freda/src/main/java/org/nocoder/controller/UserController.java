package org.nocoder.controller;

import javax.annotation.Resource;

import org.nocoder.service.UserService;
import org.springframework.stereotype.Controller;

@Controller
public class UserController {
	@Resource  
    private UserService userService;  
      
//    @RequestMapping("/user")  
//    public String toIndex(HttpServletRequest request,Model model){  
//        String userId = request.getParameter("id");  
//        User user = this.userService.queryUserByd(userId);  
//        model.addAttribute("user", user);  
//        return "user";  
//    }
}
