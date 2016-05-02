package org.nocoder.service;

import java.util.List;
import org.nocoder.model.Article;

public abstract interface ArticleService
{
  public abstract List<Article> queryArticleList(String paramString, Integer paramInteger1, Integer paramInteger2);
  
  public abstract int countArticles(String paramString);
  
  public abstract int saveArticle(Article paramArticle);
  
  public abstract Article viewArticle(String paramString);
}
