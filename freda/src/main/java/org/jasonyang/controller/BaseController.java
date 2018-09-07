package org.jasonyang.controller;

import com.google.common.collect.Maps;
import org.jasonyang.enumeration.ArchiveStatus;
import org.jasonyang.enumeration.PageSizeEnum;
import org.jasonyang.model.Archive;
import org.jasonyang.service.ArchiveService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletContext;
import java.util.List;
import java.util.Map;

/**
 * 控制器基类
 * Created by jason on 16/7/19.
 *
 * @author jason
 */
public class BaseController {
    @Autowired
    ServletContext context;
    @Autowired
    private ArchiveService archiveService;

    /**
     * 查询文档信息（返回 文档列表 archiveList 和 总页数 totalPages）
     *
     * @param state
     * @param tag
     * @param page
     * @param pageSize
     * @return resMap archiveList, totalPages
     */
    public Map<String, Object> queryArchivesByPage(int state, String tag, Integer page, Integer pageSize) {
        final Map<String, Object> resMap = Maps.newHashMap();
        if (page == null) {
            page = 1;
        }
        if (pageSize == null) {
            pageSize = PageSizeEnum.PAGE_SIZE.getValue();
        }
        final Map<String, Object> paramsMap = Maps.newHashMap();
        paramsMap.put("state", state);
        paramsMap.put("tag", tag);
        final int archivesCount = this.archiveService.countArchives(paramsMap);
        if (archivesCount > 0) {
            List<Archive> archiveList;
            List<Archive> recentlyArchiveList;

            // 从数据库查询所有文档信息(后台Console使用)
            if (state == ArchiveStatus.ALL.getValue()) {
                archiveList = this.archiveService.queryArchiveList(state, tag, page, pageSize);
            } else {
                // 从缓存获取已发布的文档基本信息(Blog首页使用)
                archiveList = this.archiveService.getAllPublishedArchivesInfo();
                // 先把最新的5篇文档拿出来
                recentlyArchiveList = archiveList.subList(0, (archiveList.size() >=5) ? 5 : archiveList.size());
                context.setAttribute("recentlyArchiveList", recentlyArchiveList);

                if (archiveList != null && archiveList.size() > 0) {
                    if (archiveList.size() >= page * pageSize) {
                        archiveList = archiveList.subList((page - 1) * pageSize, page * pageSize);
                    } else {
                        archiveList = archiveList.subList((page - 1) * pageSize, archiveList.size());
                    }
                }
            }
            resMap.put("archiveList", archiveList);
            // 总页数(取天花板值 ) = 文档总数 / 每页个数 
            int totalPages = (int) Math.ceil((double) archivesCount / (double) pageSize);
            resMap.put("totalPages", totalPages);
            resMap.put("page", page);
        }
        return resMap;
    }
}
