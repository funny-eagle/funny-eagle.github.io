package org.nocoder.blog.service;

import org.nocoder.blog.model.Archive;

import java.util.List;
import java.util.Map;

/**
 * 文档Service接口
 *
 * @author jason
 */
public interface ArchiveService {

    /**
     * 查询文档列表
     *
     * @param state    文档状态
     * @param tag      文档标签
     * @param pageNum  页数
     * @param pageSize 每页行数
     * @return
     */
    List<Archive> queryArchiveList(int state, String tag, Integer pageNum, Integer pageSize);

    /**
     * 统计文档个数
     *
     * @param paramsMap
     * @return
     */
    int countArchives(Map<String, Object> paramsMap);

    /**
     * 保存文档
     *
     * @param paramArchive
     * @return
     */
    int saveArchive(Archive paramArchive);

    /**
     * 根据主键查询文档
     *
     * @param id
     * @return
     */
    Archive queryArchiveById(String id);

    /**
     * 根据主键删除文档
     *
     * @param id
     * @return
     */
    int deleteArchiveById(String id);

    Archive queryWithoutMdContentArchiveById(String id);

}
