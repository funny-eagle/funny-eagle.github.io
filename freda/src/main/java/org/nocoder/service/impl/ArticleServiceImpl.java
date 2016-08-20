package org.nocoder.service.impl;

import java.util.*;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.nocoder.mapper.ArticleMapper;
import org.nocoder.model.Article;
import org.nocoder.model.ArticleExample;
import org.nocoder.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;

@Service
public class ArticleServiceImpl implements ArticleService {
	private final Logger logger = Logger.getLogger(ArticleServiceImpl.class);

	@Autowired
	private ArticleMapper articleMapper;

    private List<String> tagList;
    private List<String> timeList;

    public List<Article> queryArticleList(int state, String tag, Integer pageNum, Integer pageSize) {
		ArticleExample example = new ArticleExample();
		if (state >0) {
			example.createCriteria().andStateEqualTo(state);
		}
		if ((tag != null) && (!"".equals(tag))) {
			example.createCriteria().andTagEqualTo(tag);
		}
		example.setOrderByClause("create_time desc, id desc");
		example.setPageNum(pageNum);
		example.setPageSize(pageSize);
		List<Article> list = this.articleMapper.selectByExample(example);
		return list;
	}
	
	public List<Article> queryArticleListByCreateTime(String time){
		List<Article> list = this.articleMapper.queryArticleListByCreateTime(time);
		return list;
	}

	public int countArticles(String tag) {
		ArticleExample example = new ArticleExample();
		if ((tag != null) && (!"".equals(tag))) {
			example.createCriteria().andTagEqualTo(tag);
		}
		return this.articleMapper.countByExample(example);
	}

	public int saveArticle(Article article) {
		int resCount = 0;
		if (StringUtils.isBlank(article.getId())) {
			article.setId(UUID.randomUUID().toString().replace("-", ""));
			article.setCreateTime(new Date());
			resCount = this.articleMapper.insertSelective(article);
			if (resCount > 0) {
				this.logger.debug("====>新增文章 " + article.getTitle() + "成功！");
			}
		} else {
			article.setUpdateTime(new Date());
			resCount = this.articleMapper.updateByPrimaryKeySelective(article);
			if (resCount > 0) {
				this.logger.debug("====>修改文章 " + article.getTitle() + "成功！");
			}
		}
		return resCount;
	}

	public Article queryArticleById(String id) {
		if (StringUtils.isNotBlank(id)) {
			ArticleExample example = new ArticleExample();
			example.createCriteria().andIdEqualTo(id);
			List<Article> articles = this.articleMapper.selectByExample(example);
			return (articles != null) && (articles.size() > 0) ? (Article) articles.get(0) : null;
		}
		return null;
	}

	@Override
    @PostConstruct
	public List<String> getArticleTimeList() {
		this.timeList = this.articleMapper.getArticleTimeList();
		return timeList;
	}

	@Override
    @PostConstruct
	public List<String> getArticleTagList() {
		this.tagList = this.articleMapper.getArticleTagList();
		return tagList;
	}

	@Override
	public List<Article> queryArticleListByTag(String tag) {
		List<Article> list = this.articleMapper.queryArticleListByTag(tag);
		return list;
	}

	@Override
	public int deleteArticleById(String id) {
		return this.articleMapper.deleteByPrimaryKey(id);
	}


    @Override
    public List<String> getTagList() {
        return this.tagList;
    }

    @Override
    public List<String> getTimeList(){
        return this.timeList;
    }

}
