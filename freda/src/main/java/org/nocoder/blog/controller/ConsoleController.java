package org.nocoder.blog.controller;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.nocoder.blog.enumeration.ArchiveStatus;
import org.nocoder.blog.enumeration.ConsolePageEnum;
import org.nocoder.blog.enumeration.ResponseResult;
import org.nocoder.blog.enumeration.UserEnum;
import org.nocoder.blog.model.Archive;
import org.nocoder.blog.model.User;
import org.nocoder.blog.service.ArchiveService;
import org.nocoder.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 后台维护controller
 *
 * @author jason
 */
@Controller
public class ConsoleController extends BaseController {

    Logger logger = Logger.getLogger(ConsoleController.class);

    @Autowired
    private ArchiveService archiveService;


    /**
     * 文档列表
     *
     * @param request
     * @param model
     * @return 后台首页或登录页面
     */
    @RequestMapping(value = {"/console/index/{pageStr}"})
    public String archiveList(HttpServletRequest request, @PathVariable("pageStr") String pageStr, Model model) {
        // 查看HttpSession中是否存在用户，不存在直接返回登录界面
        if (request.getSession().getAttribute(UserEnum.USER.getProperty()) != null) {
            final Integer page = Integer.valueOf(pageStr == null ? "1" : pageStr);

            //查询文档信息(文章和总页数)
            final Map<String, Object> resMap = queryArchivesByPage(ArchiveStatus.ALL.getValue(), request.getParameter("tag"), page, 10);
            final List<Archive> archiveList = (List<Archive>) resMap.get("archiveList");

            model.addAttribute("archiveList", archiveList);
            model.addAttribute("page", page);
            model.addAttribute("totalPages", resMap.get("totalPages"));

            return "console/index";
        }

        return "redirect:/login";
    }



    @PostMapping({"/archive/save"})
    public String saveArchive(@ModelAttribute Archive archive) {
        if (this.archiveService.saveArchive(archive) > 0) {
            // 保存成功后,刷新redis缓存
            this.archiveService.setAllPublishedArchivesInfoToRedis();
        }
        return ResponseResult.SUCCESS.getStatus();
    }

    @PostMapping({"/archive/{id}"})
    public String toEdit(@PathVariable("id") String id, Model model) {
        Archive archive = this.archiveService.queryArchiveById(id, 0);
        model.addAttribute("archive", archive);
        return "console/edit-archive";
    }

    @DeleteMapping(value = "/archive/{id}")
    public String delete(@PathVariable("id") String id) {
        this.archiveService.deleteArchiveById(id);
        return "redirect:/console/index/1";
    }

    /**
     * 刷新redis缓存
     *
     * @return 文档管理页面
     */
    @RequestMapping({"/archive/refresh"})
    public String refreshArchivesCache() {
        this.archiveService.setAllPublishedArchivesInfoToRedis();
        return "redirect:/console/index/1";
    }
}
