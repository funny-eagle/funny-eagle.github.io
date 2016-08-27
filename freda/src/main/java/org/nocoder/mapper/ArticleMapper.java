package org.nocoder.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.nocoder.model.Article;
import org.nocoder.model.ArticleExample;

public abstract interface ArticleMapper {
	public abstract int countByExample(ArticleExample paramArticleExample);

	public abstract int deleteByExample(ArticleExample paramArticleExample);

	public abstract int deleteByPrimaryKey(String paramString);

	public abstract int insert(Article paramArticle);

	public abstract int insertSelective(Article paramArticle);

	public abstract List<Article> selectByExample(ArticleExample paramArticleExample);

	public abstract Article selectByPrimaryKey(String paramString);

	public abstract int updateByExampleSelective(@Param("record") Article paramArticle, @Param("example") ArticleExample paramArticleExample);

	public abstract int updateByExample(@Param("record") Article paramArticle, @Param("example") ArticleExample paramArticleExample);

	public abstract int updateByPrimaryKeySelective(Article paramArticle);

	public abstract int updateByPrimaryKey(Article paramArticle);
	
	public List<String> getArticleTimeList();
	
	public List<String> getArticleTagList();
	
	public List<Article> queryArticleListByCreateTime(String time);
	
	public List<Article> queryArticleListByTag(String tag);

	public List<Article> queryRecently10ArticlesList();
	
}
