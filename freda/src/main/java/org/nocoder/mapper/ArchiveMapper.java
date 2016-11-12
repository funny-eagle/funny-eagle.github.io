package org.nocoder.mapper;

import org.nocoder.model.Archive;

public interface ArchiveMapper {
    int deleteByPrimaryKey(String id);

    int insert(Archive record);

    int insertSelective(Archive record);

    Archive selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Archive record);

    int updateByPrimaryKey(Archive record);
}