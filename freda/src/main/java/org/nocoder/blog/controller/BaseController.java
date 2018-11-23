package org.nocoder.blog.controller;

import com.google.common.collect.Maps;
import org.nocoder.blog.enumeration.ArchiveStatus;
import org.nocoder.blog.enumeration.PageEnum;
import org.nocoder.blog.model.Archive;
import org.nocoder.blog.service.ArchiveService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletContext;
import java.util.Collections;
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
     * @param pageNum
     * @param sizePerPage
     * @return resMap archiveList, totalPages
     */
    public Map<String, Object> queryArchivesByPage(int state, String tag, Integer pageNum, Integer sizePerPage) {
        final Map<String, Object> resMap = Maps.newHashMap();
        if (pageNum == null) {
            pageNum = 1;
        }
        if (sizePerPage == null) {
            sizePerPage = PageEnum.SIZE_PER_PAGE.val();
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
                archiveList = this.archiveService.queryArchiveList(state, tag, pageNum, sizePerPage);
            } else {
                // 从缓存获取已发布的文档基本信息(Blog首页使用)
                archiveList = this.archiveService.getAllPublishedArchivesInfo();
                // 先把最新的5篇文档拿出来
                recentlyArchiveList = archiveList.subList(0, (archiveList.size() >= 5) ? 5 : archiveList.size());
                context.setAttribute("recentlyArchiveList", recentlyArchiveList);

                if (archiveList != null && archiveList.size() > 0) {
                    if (archiveList.size() >= pageNum * sizePerPage) {
                        archiveList = archiveList.subList((pageNum - 1) * sizePerPage, pageNum * sizePerPage);
                    } else if(archiveList.size() < (pageNum - 1) * sizePerPage){
                        archiveList = Collections.emptyList();
                    } else {
                        archiveList = archiveList.subList((pageNum - 1) * sizePerPage, archiveList.size());
                    }
                }
            }
            resMap.put("archiveList", archiveList);
            // 总页数(取天花板值 ) = 文档总数 / 每页个数 
            int totalPages = (int) Math.ceil((double) archivesCount / (double) sizePerPage);
            resMap.put("totalPages", totalPages);
            resMap.put("pageNum", pageNum);
        }
        return resMap;
    }
}
