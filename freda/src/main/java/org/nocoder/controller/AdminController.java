package org.nocoder.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.nocoder.model.User;
import org.nocoder.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@Resource  
    private UserService userService;  
      
    @RequestMapping("/login.html")  
    public String toIndex(HttpServletRequest request,Model model){  
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = this.userService.queryUserByNameAndPwd(username, password);  
        if(user != null){
        	model.addAttribute("user", user);  
        	return "admin";  
        }else{
        	return "login";
        }
    }
    @RequestMapping("/editor.html")  
    public String toCFEditor(){  
    	return "editor";
    }
    
}
