package org.jasonyang.mapper;

import org.jasonyang.model.Comment;

public interface CommentMapper {
    int deleteByPrimaryKey(String id);

    int insertSelective(Comment record);

    Comment selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Comment record);

}