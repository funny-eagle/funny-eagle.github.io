package org.nocoder.blog.mapper;

import org.nocoder.blog.model.Comment;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 评论Mapper
 *
 * @author jason
 */
@Repository
public interface CommentMapper {
    /**
     * deleteByPrimaryKey
     *
     * @param id
     * @return
     */
    int deleteByPrimaryKey(String id);

    /**
     * insertSelective
     *
     * @param record
     * @return
     */
    int insertSelective(Comment record);

    /**
     * selectByPrimaryKey
     *
     * @param id
     * @return
     */
    Comment selectByPrimaryKey(String id);

    /**
     * selectByArchiveId
     *
     * @param archiveId
     * @return
     */
    List<Comment> selectByArchiveId(String archiveId);

    /**
     * updateByPrimaryKeySelective
     *
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Comment record);

}