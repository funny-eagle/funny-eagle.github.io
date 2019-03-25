package org.nocoder.blog.controller;

import com.google.common.collect.Maps;
import org.nocoder.blog.enumeration.PageEnum;
import org.nocoder.blog.service.ArchiveService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletContext;
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
            // 总页数(取天花板值 ) = 文档总数 / 每页个数
            resMap.put("totalPages", (int) Math.ceil((double) archivesCount / (double) sizePerPage));
            resMap.put("pageNum", pageNum);
            // 查询所有文档信息
            resMap.put("archives", this.archiveService.queryArchiveList(state, tag, pageNum, sizePerPage));
        }
        return resMap;
    }
}