package org.nocoder.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.nocoder.model.Article;
import org.nocoder.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	// private Logger logger = Logger.getLogger(IndexController.class);
	@Autowired
	private ArticleService articleService;

	@RequestMapping({ "/index" })
	public String toIndex(HttpServletRequest request, Model model) {
		String tag = request.getParameter("tag");
		Integer page = Integer
				.valueOf(Integer.parseInt(request.getParameter("page") == null ? "1" : request.getParameter("page")));
		Integer pageSize = Integer.valueOf(5);
		Object[] result = queryArticlesByPage(tag, page, pageSize);

		List<Article> articleList = (List) result[0];
		model.addAttribute("articleList", articleList);
		model.addAttribute("page", page);
		model.addAttribute("totalPages", result[1]);
		return "index";
	}

	private Object[] queryArticlesByPage(String tag, Integer page, Integer pageSize) {
		Object[] result = new Object[2];
		if (page == null) {
			page = Integer.valueOf(1);
		}
		if (pageSize == null) {
			pageSize = Integer.valueOf(10);
		}
		int articlesCount = this.articleService.countArticles(tag);
		if (articlesCount > 0) {
			// System.out.println("====>����" + articlesCount + "������");
			List<Article> articleList = this.articleService.queryArticleList(tag,
					Integer.valueOf((page.intValue() - 1) * pageSize.intValue()), pageSize);
			result[0] = articleList;
			int totalPages = (int) (articlesCount / pageSize.intValue());
			result[1] = Integer.valueOf(totalPages);
		}
		return result;
	}

	@RequestMapping({ "/article.html" })
	public String viewArticle(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		// this.logger.info("=============>����ID��" + id);
		Article article = this.articleService.viewArticle(id);
		model.addAttribute("article", article);
		return "articleDetail";
	}
}
