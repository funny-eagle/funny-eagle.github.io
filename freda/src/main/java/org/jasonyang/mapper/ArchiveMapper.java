package org.jasonyang.mapper;

import java.util.List;
import java.util.Map;

import org.jasonyang.model.Archive;

public interface ArchiveMapper {
	
    int deleteByPrimaryKey(String id);

    int insert(Archive record);

    int insertSelective(Archive record);

    /**
     * 根据ID查询文档（后台管理用）
     * @param id
     * @return
     */
    Archive selectByPrimaryKey(String id);

    /**
     * 根据ID查询文档（前台用，不查询markdown内容）
     * @param id
     * @return
     */
    Archive selectArchiveById(String id);

    int updateByPrimaryKeySelective(Archive record);
    
    int selectCountArchives(Map<String, Object> paramsMap);
    
    List<Archive> selectArchives(Map<String, Object> paramsMap);
}