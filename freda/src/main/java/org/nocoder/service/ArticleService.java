package org.nocoder.service;

import java.util.List;
import org.nocoder.model.Article;

public abstract interface ArticleService {
	public abstract List<Article> queryArticleList(int state, String tag, Integer pageNum, Integer pageSize);

	public abstract int countArticles(String paramString);

	public abstract int saveArticle(Article paramArticle);

	public abstract Article queryArticleById(String paramString);
	
	public List<String> getArticleTimeList();
	
	public List<String> getArticleTagList();
	
	public List<Article> queryArticleListByCreateTime(String time);
	
	public List<Article> queryArticleListByTag(String tag);
	
	public int deleteArticleById(String id);
}
