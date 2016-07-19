package org.nocoder.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang3.StringUtils;
import org.nocoder.model.Article;
import org.nocoder.model.User;
import org.nocoder.service.ArticleService;
import org.nocoder.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController extends BaseController{
	
	@Resource
	private UserService userService;

	@Autowired
	private ArticleService articleService;

	@RequestMapping({ "/admin" })
	public String toAdmin(HttpServletRequest request, Model model) {
		if (request.getSession().getAttribute("user") != null) {

			final String tag = request.getParameter("tag");
			int state = 0;
			final Integer page = Integer.valueOf(request.getParameter("page") == null ? "1" : request.getParameter("page"));
			final Integer pageSize = 10;
			final Object[] result = queryArticlesByPage(state, tag, page, pageSize);
			final List<Article> articleList = (List<Article>) result[0];
			model.addAttribute("articleList", articleList);
			model.addAttribute("page", page);
			model.addAttribute("totalPages", result[1]);

			return "admin/admin";
		}
		return "redirect:login";
	}

	@RequestMapping({ "/login" })
	public String toIndex(HttpServletRequest request, Model model) {
		if (request.getSession().getAttribute("user") != null) {
			return "redirect:admin";
		}
		final String username = request.getParameter("username");
		final String password = request.getParameter("password");
		if (StringUtils.isNotBlank(username) && StringUtils.isNotBlank(password)) {
			final User user = this.userService.queryUserByNameAndPwd(username, password);
			if (user != null) {
				model.addAttribute("user", user);
				request.getSession().setAttribute("user", user);
				return "redirect:admin";
			}
		}
		return "admin/login";
	}

	@RequestMapping({ "/editor" })
	public String editor(HttpServletRequest request) {
		if (request.getSession().getAttribute("user") != null) {
			return "admin/editor";
		}
		return "redirect:login";
	}


	@RequestMapping({ "/article/save" })
	public String saveArticle(Article article) {
		this.articleService.saveArticle(article);
		return "redirect:/admin";
	}

	@RequestMapping({ "/article/edit" })
	public String toEdit(String id, Model model) {
		Article article = this.articleService.queryArticleById(id);
		model.addAttribute("article", article);
		return "admin/editor";
	}
	
	@RequestMapping({ "/article/delete" })
	public String delete(String id) {
		this.articleService.deleteArticleById(id);
		return "redirect:/admin";
	}
}
