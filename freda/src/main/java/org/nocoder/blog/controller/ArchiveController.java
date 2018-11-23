package org.nocoder.blog.controller;

import com.google.common.collect.Maps;
import org.nocoder.blog.enumeration.ArchiveStatus;
import org.nocoder.blog.enumeration.PageEnum;
import org.nocoder.blog.model.Archive;
import org.nocoder.blog.service.ArchiveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

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
     * @return
     */
    @GetMapping(value = {"/archives/{pageNum}"})
    public Map<String, Object> toArchiveListPage(@PathVariable("pageNum") int pageNum) {
        return queryArchivesByPage(ArchiveStatus.PUBLISHED.getValue(), null, pageNum, PageEnum.SIZE_PER_PAGE.val());
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
