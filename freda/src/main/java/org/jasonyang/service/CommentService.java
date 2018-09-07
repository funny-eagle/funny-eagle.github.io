package org.jasonyang.service;

import org.jasonyang.model.Comment;

import java.util.List;

/**
 * 评论Service接口
 *
 * @author jason
 * @date 18/2/3.
 */
public interface CommentService {
    /**
     * 根据文档主键查询评论
     *
     * @param archiveId
     * @return
     */
    List<Comment> queryCommentsByArchiveId(String archiveId);

    /**
     * 保存或更新评论
     *
     * @param comment
     * @return
     */
    int saveOrUpdateComment(Comment comment);
}
