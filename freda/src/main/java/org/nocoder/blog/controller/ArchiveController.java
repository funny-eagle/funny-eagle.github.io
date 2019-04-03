package org.nocoder.blog.controller;

import com.google.common.collect.Maps;
import org.nocoder.blog.common.BaseResponse;
import org.nocoder.blog.common.enumeration.ArchiveStatus;
import org.nocoder.blog.common.enumeration.PageEnum;
import org.nocoder.blog.common.enumeration.ResponseResult;
import org.nocoder.blog.model.Archive;
import org.nocoder.blog.service.ArchiveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
     * @return
     */
    @GetMapping(value = {"/archives"})
    public BaseResponse toArchiveListPage(@RequestParam int pageNum) {
        return new BaseResponse(queryArchivesByPage(ArchiveStatus.PUBLISHED.getValue(), null, pageNum, PageEnum.SIZE_PER_PAGE.val()));
    }


    /**
     * 根据ID获取文章
     *
     * @param archiveId 文档ID
     * @return
     */
    @GetMapping(value = {"/archive/{id}"})
    public Map<String, Object> viewArchive(@PathVariable("id") String archiveId) {
        Archive archive = this.archiveService.queryArchiveById(archiveId);
        Map<String, Object> resMap = Maps.newHashMap();
        resMap.put("archive", archive);
        return resMap;
    }

    @PostMapping({"/archive"})
    public String saveArchive(@ModelAttribute Archive archive) {
        if (this.archiveService.saveArchive(archive) > 0) {
            // 保存成功后,刷新redis缓存
            //this.archiveService.setAllPublishedArchivesInfoToRedis();
        }
        return ResponseResult.SUCCESS.getStatus();
    }

    @PostMapping({"/archive/{id}"})
    public String toEdit(@PathVariable("id") String id, Model model) {
        Archive archive = this.archiveService.queryArchiveById(id);
        model.addAttribute("archive", archive);
        return "console/edit-archive";
    }

    @DeleteMapping(value = "/archive/{id}")
    public String delete(@PathVariable("id") String id) {
        this.archiveService.deleteArchiveById(id);
        return "redirect:/console/index/1";
    }
}
