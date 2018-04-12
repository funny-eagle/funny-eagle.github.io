package org.jasonyang.mapper;

import java.util.List;
import java.util.Map;

import org.jasonyang.model.Archive;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Repository;

/**
 * @author jason
 */
@Repository
public interface ArchiveMapper {
    /**
     * 根据主键删除文档
     *
     * @param id
     * @return
     */
    int deleteByPrimaryKey(String id);

    /**
     * 插入文档
     *
     * @param record
     * @return
     */
    int insert(Archive record);

    /**
     * 插入文档
     *
     * @param record
     * @return
     */
    int insertSelective(Archive record);

    /**
     * 根据ID查询文档（后台管理用）
     *
     * @param id
     * @return
     */
    Archive selectByPrimaryKey(String id);

    /**
     * 根据ID查询文档（前台用，不查询markdown内容）
     *
     * @param id
     * @return
     */
    Archive selectArchiveById(String id);

    /**
     * 更新文档
     *
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Archive record);

    /**
     * 统计文档个数
     *
     * @param paramsMap
     * @return
     */
    int selectCountArchives(Map<String, Object> paramsMap);

    /**
     * 查询文档
     *
     * @param paramsMap
     * @return
     */
    List<Archive> selectArchives(Map<String, Object> paramsMap);
}