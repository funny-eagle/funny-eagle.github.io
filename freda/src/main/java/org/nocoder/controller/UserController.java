package org.nocoder.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.nocoder.model.User;
import org.nocoder.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	@Resource  
    private UserService userService;  
      
    @RequestMapping("/index")  
    public String toIndex(HttpServletRequest request,Model model){  
        String userId = request.getParameter("id");  
        User user = this.userService.queryUserByd(userId);  
        model.addAttribute("user", user);  
        return "index";  
    } 
}
