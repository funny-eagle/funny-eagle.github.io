package org.nocoder.controller;

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
    private ArchiveService ArchiveService;
    public Map<String, Object> queryArchivesByPage(int state, String tag, Integer page, Integer pageSize) {
        final Map<String, Object> resMap = new HashMap<String, Object>();
        if (page == null) {
            page = 1;
        }
        if (pageSize == null) {
            pageSize = 10;
        }
        final int ArchivesCount = this.ArchiveService.countArchives(tag);
        if (ArchivesCount > 0) {
            List<Archive> ArchiveList = this.ArchiveService.queryArchiveList(state, tag, (page - 1) * pageSize, pageSize);
            //result[0] = ArchiveList;
            resMap.put("ArchiveList", ArchiveList);
            // 总页数 取天花板值
            int totalPages = (int) Math.ceil((double) ArchivesCount / (double) pageSize);
            // result[1] = totalPages;
            resMap.put("totalPages", totalPages);
        }
        return resMap;
    }
}
