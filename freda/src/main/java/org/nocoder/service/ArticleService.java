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
     * 从数据库查询时间列表保存到redis缓存
     * @return
     */
	public void setArticleTimeListToRedis();

    /**
     * 从数据库查询标签列表保存到redis缓存
     * @return
     */
	public void setArticleTagListToRedis();

	/**
	 * 按创建日期查询文章
	 * @param time
	 * @return
     */
	public List<Article> queryArticleListByCreateTime(String time);
	
	public List<Article> queryArticleListByTag(String tag);
	
	public int deleteArticleById(String id);

	/**
	 * 最近10篇文章
	 * @return
     */
	public void setRecently10ArticlesListToRedis();

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
