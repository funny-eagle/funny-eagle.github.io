package org.nocoder.blog.controller;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.nocoder.blog.common.ResponseInfo;
import org.nocoder.blog.enumeration.UserEnum;
import org.nocoder.blog.model.User;
import org.nocoder.blog.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
public class UserController {

    Logger logger = LoggerFactory.getLogger(UserController.class);

    @Resource
    private UserService userService;

    /**
     * 用户登录
     *
     * @param request
     * @param model
     * @return
     */
    @GetMapping({"/login"})
    public ResponseInfo login(HttpServletRequest request, Model model) {
        if (request.getSession().getAttribute(UserEnum.USER.getProperty()) != null) {
            return new ResponseInfo<>();
        }
        final String username = request.getParameter("username");
        final String password = request.getParameter("password");
        if (StringUtils.isNotBlank(username) && StringUtils.isNotBlank(password)) {
            final User user = this.userService.userAuthentication(username);
            if (user != null && DigestUtils.md5Hex(password).equals(user.getPassword())) {
                request.getSession().setAttribute("current_user", user);
                logger.info("login success! username: " + username);
            } else {
                logger.warn("login failed! username: " + username + ", password: " + password);
            }
        }
        //TODO
        return null;
    }
}
