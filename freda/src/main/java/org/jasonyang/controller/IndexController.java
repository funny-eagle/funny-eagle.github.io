package org.jasonyang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * @author jason
 * @date 18/1/4.
 */
@Controller
public class IndexController extends BaseController {
    @RequestMapping(value = {"/blog"}, method = RequestMethod.GET)
    public String toHomePage() {
        return "blog/index";
    }

    @RequestMapping(value = {"/about"}, method = RequestMethod.GET)
    public String toAboutPage() {
        return "blog/about";
    }

    @RequestMapping(value = {"/contact"}, method = RequestMethod.GET)
    public String toContactPage() {
        return "blog/contact";
    }
}
