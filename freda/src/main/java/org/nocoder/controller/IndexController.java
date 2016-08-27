package org.nocoder.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.nocoder.model.Article;
import org.nocoder.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController extends BaseController{
	// private Logger logger = Logger.getLogger(IndexController.class);
	@Autowired
	private ArticleService articleService;

	@RequestMapping({ "/index" })
	public String toIndex(HttpServletRequest request, Model model) {
		String tag = request.getParameter("tag");
		int state = 2;
		Integer page = Integer.valueOf(request.getParameter("page") == null ? "1" : request.getParameter("page"));
		Integer pageSize = 1;
		Map<String, Object> resMap = queryArticlesByPage(state, tag, page, pageSize);
		List<Article> articleList = (List<Article>) resMap.get("articleList");
		model.addAttribute("articleList", articleList);
		model.addAttribute("page", page);
		model.addAttribute("totalPages", resMap.get("totalPages"));
		getRightBar(model);
		return "index";
	}
	
	@RequestMapping("/articlesByMonth")
	public String articlesByCreateTime(HttpServletRequest request, Model model){
		String month = request.getParameter("month");
		List<Article> articleList = articleService.queryArticleListByCreateTime(month);
		model.addAttribute("articleList", articleList);
		getRightBar(model);
		return "index";
	}
	@RequestMapping("/articlesByTag")
	public String articlesByTag(HttpServletRequest request, Model model){
		String tag = request.getParameter("tag");
		int state = 2;
		Integer page = Integer.valueOf(request.getParameter("page") == null ? "1" : request.getParameter("page"));
		Integer pageSize = 1;
		Map<String, Object> resMap = queryArticlesByPage(state, tag, page, pageSize);

		model.addAttribute("articleList", resMap.get("articleList"));
		model.addAttribute("page", page);
		model.addAttribute("totalPages", resMap.get("totalPages"));

		getRightBar(model);
		return "index";
	}

	@RequestMapping({ "/article" })
	public String viewArticle(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		Article article = this.articleService.queryArticleById(id);
		List<Article> articleList = new ArrayList<Article>();
		articleList.add(article);
		model.addAttribute("articleList", articleList);
		getRightBar(model);
		return "index";
	}

	/**
	 * 获取右侧显式内容
	 * 最近文章标题列表
	 * 标签列表
	 * 日期列表
	 * @param model
     */
	private void getRightBar(Model model){
		// 获取文章时间列表
		List<String> timeList = articleService.getTimeList();
		// get article tags
		List<String> tagList = articleService.getTagList();

		List<Article> recently10ArticlesList = articleService.getRecently10ArticlesList();

		model.addAttribute("timeList", timeList);
		model.addAttribute("tagList", tagList);
		model.addAttribute("recently10ArticlesList", recently10ArticlesList);
	}
}
