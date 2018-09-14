package org.nocoder.blog.controller;

import com.google.common.collect.Maps;
import org.nocoder.blog.enumeration.ArchiveStatus;
import org.nocoder.blog.enumeration.PageSizeEnum;
import org.nocoder.blog.model.Archive;
import org.nocoder.blog.service.ArchiveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 文章Controller
 *
 * @author jason
 */
@RestController
public class ArchiveController extends BaseController {
    @Autowired
    private ArchiveService archiveService;

    /**
     * 分页查询文章列表
     *
     * @param request
     * @return
     */
    @GetMapping(value = {"/archives"})
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
     *
     * @param archiveId 文档ID
     * @return
     */
    @GetMapping(value = {"/archive/{id}"})
    public Map<String, Object> viewArchive(@PathVariable("id") String archiveId) {
        // 1 表示前台使用不查询markdown内容字段
        Archive archive = this.archiveService.queryArchiveById(archiveId, 1);
        Map<String, Object> resMap = Maps.newHashMap();
        resMap.put("archive", archive);
        return resMap;
    }

}
