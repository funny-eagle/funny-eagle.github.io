package org.jasonyang.mapper;

import org.jasonyang.model.Comment;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 评论Mapper
 * @author jason
 */
@Repository
public interface CommentMapper {
    int deleteByPrimaryKey(String id);

    int insertSelective(Comment record);

    Comment selectByPrimaryKey(String id);

    List<Comment> selectByArchiveId(String archiveId);

    int updateByPrimaryKeySelective(Comment record);

}