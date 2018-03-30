package org.jasonyang.controller;

import org.apache.commons.lang3.StringUtils;
import org.jasonyang.enumeration.ResponseResult;
import org.jasonyang.model.Comment;
import org.jasonyang.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
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
    @RequestMapping("/saveComment")
    public String saveOrUpdate(@ModelAttribute Comment comment) {
        if (commentService.saveOrUpdateComment(comment) > 0) {
            return ResponseResult.SUCCESS.getStatus();
        }
        return ResponseResult.FAILED.getStatus();
    }

    @ResponseBody
    @RequestMapping("/queryCommentsByArchiveId/{archiveId}")
    public List<Comment> queryCommentsByArchiveId(@PathVariable String archiveId) {
        if (StringUtils.isBlank(archiveId)) {
            return Collections.emptyList();
        }
        return commentService.queryCommentsByArchiveId(archiveId);
    }
}
