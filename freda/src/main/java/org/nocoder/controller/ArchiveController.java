package org.nocoder.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.nocoder.constant.ArchiveConst;
import org.nocoder.model.Archive;
import org.nocoder.service.ArchiveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ArchiveController extends BaseController {
    @Autowired
    private ArchiveService archiveService;

    @RequestMapping({"/index"})
    public String toHomePage() {
        return "phantom/index";
    }

    /**
     * 查询文章列表
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping({"/archive_list"})
    public Map<String, Object> toArchiveListPage(HttpServletRequest request) {
        // 文档标签
        String tag = request.getParameter("tag");

        // 页数（第几页）
        Integer page = Integer.valueOf(request.getParameter("page") == null ? "1" : request.getParameter("page"));

        // 每页个数
        Integer pageSize = ArchiveConst.PAGE_SIZE;

        // 获取文档信息
        Map<String, Object> resMap = queryArchivesByPage(ArchiveConst.STATE_SUBMITED, tag, page, pageSize);
        return resMap;
    }


    /**
     * 根据ID获取文章
     * @param request
     * @param model
     * @return
     */
    @RequestMapping({"/archive"})
    public String viewArchive(HttpServletRequest request, Model model) {
        String id = request.getParameter("id");
        Archive archive = this.archiveService.queryArchiveById(id,1);
        model.addAttribute("archive", archive);
        return "phantom/archive";
    }

}
