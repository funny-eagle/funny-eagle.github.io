package org.jasonyang.freda.test;

import org.jasonyang.mapper.CommentMapper;
import org.jasonyang.model.Comment;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * @author jason
 * @date 18/2/3.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-mybatis.xml"})
public class CommentTest {
    @Autowired
    private CommentMapper commentMapper;

    @org.junit.Test
    public void testCommentMapper(){
        String archiveId = "580efd290b414b5d8a38b0a96747d7da";
        /*Comment comment = new Comment();
        comment.setId(UUIDUtil.getUUID());
        comment.setArchiveId(archiveId);
        comment.setCommentContent("very good!");
        comment.setCommentUserEmail("yjl@mail.com");
        comment.setCommentUserIpAddress("1212312312");
        comment.setCommentUsername("Jason Yang");
        comment.setCreateTime(new Date());
        comment.setPid("1");
        assert commentMapper.insertSelective(comment)>0;*/
        List<Comment> comments = commentMapper.selectByArchiveId(archiveId);
        assert comments != null;
        assert comments.size()>0;
        for(Comment c : comments){
            System.out.println(c.getId()+","+c.getCommentContent());
        }
    }
}
