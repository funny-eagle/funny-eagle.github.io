package org.nocoder.controller;

import org.nocoder.constant.ArchiveConst;
import org.nocoder.model.Archive;
import org.nocoder.service.ArchiveService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by jason on 16/7/19.
 */
public class BaseController {
    @Autowired
    private ArchiveService archiveService;
    
    /**
     * 查询文档信息（返回 文档列表 archiveList 和 总页数 totalPages）
     * @param state
     * @param tag
     * @param page
     * @param pageSize
     * @return resMap archiveList, totalPages
     */
    public Map<String, Object> queryArchivesByPage(String state, String tag, Integer page, Integer pageSize) {
        final Map<String, Object> resMap = new HashMap<String, Object>();
        if (page == null) {
            page = 1;
        }
        if (pageSize == null) {
            pageSize = ArchiveConst.PAGE_SIZE;
        }
        final int archivesCount = this.archiveService.countArchives(tag);
        if (archivesCount > 0) {
            List<Archive> archiveList = this.archiveService.queryArchiveList(state, tag, page, pageSize);
            resMap.put("archiveList", archiveList);
            // 总页数(取天花板值 ) = 文档总数 / 每页个数 
            int totalPages = (int) Math.ceil((double) archivesCount / (double) pageSize);
            resMap.put("totalPages", totalPages);
        }
        return resMap;
    }
}
