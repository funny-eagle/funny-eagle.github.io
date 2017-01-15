package org.nocoder.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.nocoder.constant.ArchiveConst;
import org.nocoder.model.Archive;
import org.nocoder.service.ArchiveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController extends BaseController{
	@Autowired
	private ArchiveService archiveService;

	@SuppressWarnings("unchecked")
	@RequestMapping({ "/index" })
	public String toIndex(HttpServletRequest request, Model model) {
		String tag = request.getParameter("tag");
		Integer page = Integer.valueOf(request.getParameter("page") == null ? "1" : request.getParameter("page"));
		Integer pageSize = 10;
		Map<String, Object> resMap = queryArchivesByPage(ArchiveConst.STATE_SUBMITED, tag, page, pageSize);
		Object object = resMap.get("archiveList");
		List<Archive> archiveList = null;
		if(object instanceof List<?>){
			archiveList = (List<Archive>) object;
		}
		model.addAttribute("archiveList", archiveList);
		model.addAttribute("page", page);
		model.addAttribute("totalPages", resMap.get("totalPages"));
		getRightBar(model);
		return "index";
	}
	
	@RequestMapping("/archivesByMonth")
	public String ArchivesByCreateTime(HttpServletRequest request, Model model){
		String month = request.getParameter("month");
		List<Archive> archiveList = archiveService.queryArchiveListByCreateTime(month);
		model.addAttribute("archiveList", archiveList);
		getRightBar(model);
		return "index";
	}
	@RequestMapping("/ArchivesByTag")
	public String ArchivesByTag(HttpServletRequest request, Model model){
		String tag = request.getParameter("tag");
		Integer page = Integer.valueOf(request.getParameter("page") == null ? "1" : request.getParameter("page"));
		Integer pageSize = 1;
		Map<String, Object> resMap = queryArchivesByPage(ArchiveConst.STATE_SUBMITED, tag, page, pageSize);

		model.addAttribute("ArchiveList", resMap.get("ArchiveList"));
		model.addAttribute("page", page);
		model.addAttribute("totalPages", resMap.get("totalPages"));

		getRightBar(model);
		return "index";
	}

	@RequestMapping({ "/archive" })
	public String viewArchive(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		Archive archive = this.archiveService.queryArchiveById(id);
		List<Archive> archiveList = new ArrayList<Archive>();
		archiveList.add(archive);
		model.addAttribute("archiveList", archiveList);
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
		List<String> timeList = archiveService.getTimeList();
		// 获取标签列表
		List<String> tagList = archiveService.getTagList();

		List<Archive> recently10ArchivesList = archiveService.getRecently10ArchivesList();

		model.addAttribute("timeList", timeList);
		model.addAttribute("tagList", tagList);
		model.addAttribute("recently10ArchivesList", recently10ArchivesList);
	}
}
