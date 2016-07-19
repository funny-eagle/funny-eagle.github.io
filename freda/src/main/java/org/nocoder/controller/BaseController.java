package org.nocoder.controller;

import org.nocoder.model.Article;
import org.nocoder.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by jason on 16/7/19.
 */
public class BaseController {
    @Autowired
    private ArticleService articleService;
    public Object[] queryArticlesByPage(int state, String tag, Integer page, Integer pageSize) {
        final Object[] result = new Object[2];
        if (page == null) {
            page = 1;
        }
        if (pageSize == null) {
            pageSize = 10;
        }
        final int articlesCount = this.articleService.countArticles(tag);
        if (articlesCount > 0) {
            List<Article> articleList = this.articleService.queryArticleList(state, tag, (page - 1) * pageSize, pageSize);
            result[0] = articleList;
            // 总页数 取天花板值
            int totalPages = (int) Math.ceil((double) articlesCount / (double) pageSize);
            result[1] = totalPages;
        }
        return result;
    }
}
