package org.nocoder.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.nocoder.enumeration.ArchiveStatus;
import org.nocoder.model.Archive;
import org.nocoder.model.User;
import org.nocoder.service.ArchiveService;
import org.nocoder.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 后台维护controller
 * @author jason
 */
@Controller
public class AdminController extends BaseController{
	
	@Resource
	private UserService userService;

	@Autowired
	private ArchiveService archiveService;

	/**
	 * 转到后台维护首页，如未登录转到登录页面
	 * @param request
	 * @param model
	 * @return 后台首页或登录页面
	 */
	@RequestMapping({ "/admin" })
	public String toAdmin(HttpServletRequest request, Model model) {
		// 查看HttpSession中是否存在用户，不存在直接返回登录界面
		if (request.getSession().getAttribute("user") != null) {
			
			//分页信息-页数
			String pageStr = request.getParameter("page");
			final Integer page = Integer.valueOf(pageStr == null ? "1" : pageStr);
			
			//查询文档信息(文章和总页数)
			final Map<String, Object> resMap = queryArchivesByPage(ArchiveStatus.ALL.getValue(), request.getParameter("tag"), page, 15);
			final List<Archive> archiveList = (List<Archive>) resMap.get("archiveList");
			
			model.addAttribute("archiveList", archiveList);
			model.addAttribute("page", page);
			model.addAttribute("totalPages", resMap.get("totalPages"));

			return "admin/admin";
		}
		
		return "redirect:login";
	}

	@RequestMapping({ "/login" })
	public String login(HttpServletRequest request, Model model) {
		if (request.getSession().getAttribute("user") != null) {
			return "redirect:admin";
		}
		final String username = request.getParameter("username");
		final String password = request.getParameter("password");
		if (StringUtils.isNotBlank(username) && StringUtils.isNotBlank(password)) {
			final User user = this.userService.UserAuthentication(username);
			if (user != null && password.equals(user.getPassword())) {
				model.addAttribute("user", user);
				// 将用户信息存放至session中
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
 

	@RequestMapping({ "/archive/save" })
	public String saveArchive(Archive archive) {
		this.archiveService.saveArchive(archive);
		return "redirect:/admin";
	}

	@RequestMapping({ "/archive/edit" })
	public String toEdit(String id, Model model) {
		Archive archive = this.archiveService.queryArchiveById(id,0);
		model.addAttribute("archive", archive);
		return "admin/editor";
	}
	
	@RequestMapping({ "/archive/delete" })
	public String delete(String id) {
		this.archiveService.deleteArchiveById(id);
		return "redirect:/admin";
	}

	@RequestMapping({ "/archive/refreshCache" })
	public String refreshTimeList(){
		// 刷新日期列表redis缓存
		this.archiveService.setArchiveTimeListToRedis();
		// 刷新标签列表缓存
		this.archiveService.setArchiveTagListToRedis();
		// 刷新近10篇文章列表缓存
		this.archiveService.setRecently10ArchivesListToRedis();
		
		return "redirect:/admin";
	}

}
