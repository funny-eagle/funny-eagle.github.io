package org.nocoder.blog.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.nocoder.blog.mapper.CommentMapper;
import org.nocoder.blog.model.Comment;
import org.nocoder.blog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author jason
 * @date 18/2/3.
 */
@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    CommentMapper commentMapper;

    @Override
    public List<Comment> queryCommentsByArchiveId(String archiveId) {
        return commentMapper.selectByArchiveId(archiveId);
    }

    @Override
    public int saveOrUpdateComment(Comment comment) {
        if (StringUtils.isBlank(comment.getId())) {
            comment.setCreateTime(new Date().toString());
            return commentMapper.insertSelective(comment);
        }
        comment.setCreateTime(new Date().toString());
        return commentMapper.updateByPrimaryKeySelective(comment);
    }
}
