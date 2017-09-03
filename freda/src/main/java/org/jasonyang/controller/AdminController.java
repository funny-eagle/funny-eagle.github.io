package org.jasonyang.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.PatternCodec;
import com.sun.org.apache.xalan.internal.xsltc.compiler.Pattern;
import org.apache.commons.lang3.StringUtils;
import org.jasonyang.enumeration.ArchiveStatus;
import org.jasonyang.enumeration.ResponseResult;
import org.jasonyang.model.Archive;
import org.jasonyang.model.User;
import org.jasonyang.service.ArchiveService;
import org.jasonyang.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@RequestMapping({ "/archiveList/{pageStr}" })
	public String archiveList(HttpServletRequest request, @PathVariable("pageStr") String pageStr, Model model) {
		// 查看HttpSession中是否存在用户，不存在直接返回登录界面
		if (request.getSession().getAttribute("user") != null) {
			final Integer page = Integer.valueOf(pageStr == null ? "1" : pageStr);
			
			//查询文档信息(文章和总页数)
			final Map<String, Object> resMap = queryArchivesByPage(ArchiveStatus.ALL.getValue(), request.getParameter("tag"), page, 10);
			final List<Archive> archiveList = (List<Archive>) resMap.get("archiveList");
			
			model.addAttribute("archiveList", archiveList);
			model.addAttribute("page", page);
			model.addAttribute("totalPages", resMap.get("totalPages"));

			return "admin/articles";
		}
		
		return "redirect:login";
	}

	@RequestMapping({ "/login" })
	public String login(HttpServletRequest request, Model model) {
		if (request.getSession().getAttribute("user") != null) {
			return "redirect:gentelella";
		}
		final String username = request.getParameter("username");
		final String password = request.getParameter("password");
		if (StringUtils.isNotBlank(username) && StringUtils.isNotBlank(password)) {
			final User user = this.userService.UserAuthentication(username);
			if (user != null && password.equals(user.getPassword())) {
				model.addAttribute("user", user);
				// 将用户信息存放至session中
				request.getSession().setAttribute("user", user);
				return "redirect:gentelella";
			}
		}
		return "gentelella/login";
	}

	@RequestMapping({ "/editor" })
	public String editor(HttpServletRequest request) {
		if (request.getSession().getAttribute("user") != null) {
			return "admin/editor_form";
		}
		return "redirect:login";
	}
 
	@ResponseBody
	@RequestMapping({ "/archive/save" })
	public String saveArchive(@ModelAttribute Archive archive) {
		if(this.archiveService.saveArchive(archive) > 0){
			// 保存成功后,刷新redis缓存
			this.archiveService.setAllArchivesInfoToRedis();
		}
		return ResponseResult.SUCCESS.getStatus();
	}

	@ResponseBody
	@RequestMapping({ "/archive/edit/{id}" })
	public String toEdit(@PathVariable("id") String id, Model model) {
		Archive archive = this.archiveService.queryArchiveById(id,0);
		return JSON.toJSONString(archive);
	}

	
	@RequestMapping({ "/archive/delete/{id}" })
	public String delete(@PathVariable("id") String id) {
		this.archiveService.deleteArchiveById(id);
		return "redirect:/gentelella";
	}

	@RequestMapping({ "/archive/refreshCache" })
	public String refreshArchivesCache(){
		// 刷新redis缓存
		this.archiveService.setAllArchivesInfoToRedis();
		return "redirect:/gentelella";
	}

	@RequestMapping({ "/gentelella" })
	public String gentelella(HttpServletRequest request) {
		// 查看HttpSession中是否存在用户，不存在直接返回登录界面
		if (request.getSession().getAttribute("user") != null) {
			return "gentelella/index";
		}
		return "redirect:login";
	}

	@RequestMapping("/homeContent")
	public String homeContent(HttpServletRequest request){
		return "gentelella/home_content";
	}

}
