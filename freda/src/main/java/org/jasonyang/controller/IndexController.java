package org.jasonyang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * @author jason
 * @date 18/1/4.
 */
@Controller
public class IndexController extends BaseController{
    @RequestMapping({"/blog"})
    public String toHomePage() {
        return "bootstrap-basic/index";
    }

    @RequestMapping({"/about"})
    public String toAboutPage(){
        return "bootstrap-basic/about";
    }

    @RequestMapping({"/contact"})
    public String toContactPage(){
        return "bootstrap-basic/contact";
    }
}
