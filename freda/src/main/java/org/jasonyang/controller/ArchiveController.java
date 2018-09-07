package org.jasonyang.controller;

import org.jasonyang.enumeration.ArchiveStatus;
import org.jasonyang.enumeration.PageSizeEnum;
import org.jasonyang.model.Archive;
import org.jasonyang.service.ArchiveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 文章Controller
 * @author jason
 */
@Controller
public class ArchiveController extends BaseController {
    @Autowired
    private ArchiveService archiveService;

    /**
     * 分页查询文章列表
     *
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = {"/archive_list"}, method = RequestMethod.GET)
    public Map<String, Object> toArchiveListPage(HttpServletRequest request) {
        // 文档标签
        String tag = request.getParameter("tag");

        // 页数（第几页）
        Integer page = Integer.valueOf(request.getParameter("page") == null ? "1" : request.getParameter("page"));

        // 每页个数
        Integer pageSize = PageSizeEnum.PAGE_SIZE.getValue();

        // 获取文档信息
        Map<String, Object> resMap = queryArchivesByPage(ArchiveStatus.PUBLISHED.getValue(), tag, page, pageSize);
        return resMap;
    }


    /**
     * 根据ID获取文章
     * @param model
     * @return
     */
    @RequestMapping(value = {"/archive/{id}"}, method = RequestMethod.GET)
    public String viewArchive(@PathVariable("id") String id, Model model) {
        // 1 表示前台使用不查询markdown内容字段
        Archive archive = this.archiveService.queryArchiveById(id, 1);
        if(archive == null){
            return "redirect:/";
        }
        model.addAttribute("archive", archive);
        return "blog/archive";
    }

}
