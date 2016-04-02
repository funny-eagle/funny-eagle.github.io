package org.nocoder.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
      
    @RequestMapping("/index")  
    public String toIndex(HttpServletRequest request,Model model){  
//        String userId = request.getParameter("id");  
//        User user = this.userService.queryUserByd(userId);  
//        model.addAttribute("user", user);  
        return "index";  
    }
}
