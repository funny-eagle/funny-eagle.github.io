package org.nocoder.service.impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.nocoder.mapper.ArticleMapper;
import org.nocoder.model.Article;
import org.nocoder.model.ArticleExample;
import org.nocoder.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ArticleServiceImpl
  implements ArticleService
{
  @Autowired
  private ArticleMapper mapper;
  
  public List<Article> queryArticleList(String tag, Integer pageNum, Integer pageSize)
  {
    ArticleExample example = new ArticleExample();
    if ((tag != null) && (!"".equals(tag))) {
      example.createCriteria().andTagEqualTo(tag);
    }
    example.setOrderByClause("create_time desc, id desc");
    example.setPageNum(pageNum);
    example.setPageSize(pageSize);
    List<Article> list = this.mapper.selectByExample(example);
    return list;
  }
  
  public int countArticles(String tag)
  {
    ArticleExample example = new ArticleExample();
    if ((tag != null) && (!"".equals(tag))) {
      example.createCriteria().andTagEqualTo(tag);
    }
    return this.mapper.countByExample(example);
  }
  
  public int saveArticle(Article article)
  {
    int resCount = 0;
    if (article.getId() == null)
    {
      article.setId(UUID.randomUUID().toString().replace("-", ""));
      article.setCreateTime(new Date());
      resCount = this.mapper.insertSelective(article);
    }
    else
    {
      article.setUpdateTime(new Date());
      resCount = this.mapper.updateByPrimaryKeySelective(article);
    }
    return resCount;
  }
  
  public Article viewArticle(String id)
  {
    if (id != null)
    {
      ArticleExample example = new ArticleExample();
      example.createCriteria().andIdEqualTo(id);
      List<Article> articles = this.mapper.selectByExample(example);
      return (articles != null) && (articles.size() > 0) ? (Article)articles.get(0) : null;
    }
    return null;
  }
}
