package org.nocoder.service;

import java.util.List;
import java.util.Map;

import org.nocoder.model.Article;

public abstract interface ArticleService {

	public abstract List<Article> queryArticleList(int state, String tag, Integer pageNum, Integer pageSize);

	public abstract int countArticles(String paramString);

	public abstract int saveArticle(Article paramArticle);

	public abstract Article queryArticleById(String paramString);

    /**
     * 从数据库查询时间列表
     * @return
     */
	public List<String> getArticleTimeList();

    /**
     * 从数据库查询标签列表
     * @return
     */
	public List<String> getArticleTagList();
	
	public List<Article> queryArticleListByCreateTime(String time);
	
	public List<Article> queryArticleListByTag(String tag);
	
	public int deleteArticleById(String id);
	public List<Article> queryRecently10ArticlesList();

    /**
     * 从缓存读取标签列表
     * @return
     */
    public List<String> getTagList();

    /**
     * 从缓存读取时间列表
     * @return
     */
    public List<String> getTimeList();

	/**
	 * 从缓存读取最近10篇文章
	 * @return
     */
	public List<Article> getRecently10ArticlesList();
}
