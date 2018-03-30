package org.jasonyang.service;

import java.util.List;
import java.util.Map;

import org.jasonyang.model.Archive;

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
     * @param type
     * @return
     */
    Archive queryArchiveById(String id, int type);

    /**
     * 根据主键删除文档
     *
     * @param id
     * @return
     */
    int deleteArchiveById(String id);

    /**
     * 查询所有已发布文档的简要信息,存至redis缓存
     */
    void setAllPublishedArchivesInfoToRedis();

    /**
     * 从redis获取所有文档简要信息
     *
     * @return
     */
    List<Archive> getAllPublishedArchivesInfo();
}
