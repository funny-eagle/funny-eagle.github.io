package org.nocoder.blog.controller;

import org.apache.commons.lang3.StringUtils;
import org.nocoder.blog.enumeration.ResponseResult;
import org.nocoder.blog.model.Comment;
import org.nocoder.blog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;

/**
 * @author jason
 * @date 18/2/3.
 */
@Controller
public class CommentController {
    @Autowired
    private CommentService commentService;

    @ResponseBody
    @RequestMapping(value = "/saveComment", method = RequestMethod.POST)
    public String saveOrUpdate(@ModelAttribute Comment comment) {
        if (commentService.saveOrUpdateComment(comment) > 0) {
            return ResponseResult.SUCCESS.getStatus();
        }
        return ResponseResult.FAILED.getStatus();
    }

    @ResponseBody
    @RequestMapping(value = "/queryCommentsByArchiveId/{archiveId}", method = RequestMethod.GET)
    public List<Comment> queryCommentsByArchiveId(@PathVariable String archiveId) {
        if (StringUtils.isBlank(archiveId)) {
            return Collections.emptyList();
        }
        return commentService.queryCommentsByArchiveId(archiveId);
    }
}
