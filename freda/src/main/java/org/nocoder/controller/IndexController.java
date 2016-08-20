package org.nocoder.controller;

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
		// 获取文章时间列表
		List<String> timeList = articleService.getTimeList();
		// get article tags
		List<String> tagList = articleService.getTagList();

		List<Article> articleList = (List<Article>) resMap.get("articleList");
		model.addAttribute("articleList", articleList);
		model.addAttribute("timeList", timeList);
		model.addAttribute("tagList", tagList);
		model.addAttribute("page", page);
		model.addAttribute("totalPages", resMap.get("totalPages"));
		return "index";
	}
	
	@RequestMapping("/articlesByMonth")
	public String articlesByCreateTime(HttpServletRequest request, Model model){
		String month = request.getParameter("month");
		List<Article> articleList = articleService.queryArticleListByCreateTime(month);
		// 获取文章时间列表
		List<String> timeList = articleService.getTimeList();
		// get article tags
		List<String> tagList = articleService.getTagList();
		model.addAttribute("articleList", articleList);
		model.addAttribute("timeList", timeList);
		model.addAttribute("tagList", tagList);
		return "index";
	}
	@RequestMapping("/articlesByTag")
	public String articlesByTag(HttpServletRequest request, Model model){
		String tag = request.getParameter("tag");
		int state = 2;
		Integer page = Integer.valueOf(request.getParameter("page") == null ? "1" : request.getParameter("page"));
		Integer pageSize = 1;
		Map<String, Object> resMap = queryArticlesByPage(state, tag, page, pageSize);
		//List<Article> articleList = articleService.queryArticleListByTag(tag);
		// 获取文章时间列表
		List<String> timeList = articleService.getTimeList();
		// get article tags
		List<String> tagList = articleService.getTagList();
		model.addAttribute("articleList", resMap.get("articleList"));
		model.addAttribute("timeList", timeList);
		model.addAttribute("tagList", tagList);
		model.addAttribute("page", page);
		model.addAttribute("totalPages", resMap.get("totalPages"));
		return "index";
	}

	@RequestMapping({ "/article" })
	public String viewArticle(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		Article article = this.articleService.queryArticleById(id);
		model.addAttribute("article", article);
		return "index";
	}
}
