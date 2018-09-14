package org.nocoder.blog.model;

import java.io.Serializable;

/**
 * 评论
 *
 * @author jason
 */
public class Comment implements Serializable {
    private String id;

    private String archiveId;

    private String commentUsername;

    private String commentUserEmail;

    private String commentUserIpAddress;

    private String commentContent;

    private String createTime;

    private String pid;

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getArchiveId() {
        return archiveId;
    }

    public void setArchiveId(String archiveId) {
        this.archiveId = archiveId;
    }

    public String getCommentUsername() {
        return commentUsername;
    }

    public void setCommentUsername(String commentUsername) {
        this.commentUsername = commentUsername;
    }

    public String getCommentUserEmail() {
        return commentUserEmail;
    }

    public void setCommentUserEmail(String commentUserEmail) {
        this.commentUserEmail = commentUserEmail;
    }

    public String getCommentUserIpAddress() {
        return commentUserIpAddress;
    }

    public void setCommentUserIpAddress(String commentUserIpAddress) {
        this.commentUserIpAddress = commentUserIpAddress;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
}