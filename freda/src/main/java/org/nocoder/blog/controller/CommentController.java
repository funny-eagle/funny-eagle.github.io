package org.nocoder.blog.controller;

import org.apache.commons.lang3.StringUtils;
import org.nocoder.blog.enumeration.ResponseResult;
import org.nocoder.blog.model.Comment;
import org.nocoder.blog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;

/**
 * @author jason
 * @date 18/2/3.
 */
@RestController
public class CommentController {
    @Autowired
    private CommentService commentService;

    @PostMapping(value = "/saveComment")
    public String saveOrUpdate(@ModelAttribute Comment comment) {
        if (commentService.saveOrUpdateComment(comment) > 0) {
            return ResponseResult.SUCCESS.getStatus();
        }
        return ResponseResult.FAILED.getStatus();
    }

    @GetMapping(value = "/queryCommentsByArchiveId/{archiveId}")
    public List<Comment> queryCommentsByArchiveId(@PathVariable String archiveId) {
        if (StringUtils.isBlank(archiveId)) {
            return Collections.emptyList();
        }
        return commentService.queryCommentsByArchiveId(archiveId);
    }
}
