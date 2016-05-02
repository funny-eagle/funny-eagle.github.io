package org.nocoder.controller;

import java.io.PrintStream;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.nocoder.model.Article;
import org.nocoder.model.User;
import org.nocoder.service.ArticleService;
import org.nocoder.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController
{
  private Logger logger = Logger.getLogger(AdminController.class);
  @Resource
  private UserService userService;
  @Autowired
  private ArticleService articleService;
  
  @RequestMapping({"/login.html"})
  public String toIndex(HttpServletRequest request, Model model)
  {
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    User user = this.userService.queryUserByNameAndPwd(username, password);
    if (user != null)
    {
      model.addAttribute("user", user);
      return "admin";
    }
    return "login";
  }
  
  @RequestMapping({"/editor.html"})
  public String toCFEditor()
  {
    return "editor";
  }
  
  private Object[] queryArticlesByPage(String tag, Integer page, Integer pageSize)
  {
    Object[] result = new Object[2];
    if (page == null) {
      page = Integer.valueOf(1);
    }
    if (pageSize == null) {
      pageSize = Integer.valueOf(10);
    }
    int articlesCount = this.articleService.countArticles(tag);
    if (articlesCount > 0)
    {
      System.out.println("====>����" + articlesCount + "������");
      List<Article> articleList = this.articleService.queryArticleList(tag, Integer.valueOf((page.intValue() - 1) * pageSize.intValue()), pageSize);
      result[0] = articleList;
      int totalPages = (int)(articlesCount / pageSize.intValue());
      result[1] = Integer.valueOf(totalPages);
    }
    return result;
  }
  
  @RequestMapping({"/articles.html"})
  public String articles(HttpServletRequest request, Model model)
  {
    String tag = request.getParameter("tag");
    Integer page = Integer.valueOf(Integer.parseInt(request.getParameter("page") == null ? "1" : request.getParameter("page")));
    Integer pageSize = Integer.valueOf(5);
    Object[] result = queryArticlesByPage(tag, page, pageSize);
    
    List<Article> articleList = (List)result[0];
    model.addAttribute("articleList", articleList);
    model.addAttribute("page", page);
    model.addAttribute("totalPages", result[1]);
    return "admin/articles";
  }
  
  @RequestMapping({"/article/save.html"})
  public String saveArticle(HttpServletRequest request, Model model, Article article)
  {
    int resCount = this.articleService.saveArticle(article);
    if (resCount > 0) {
      this.logger.info("====>��������������");
    }
    return "redirect:/index.html";
  }
  
  @RequestMapping({"/article/edit.html"})
  public String toEdit(HttpServletRequest request, Model model)
  {
    return "admin/articles";
  }
}
