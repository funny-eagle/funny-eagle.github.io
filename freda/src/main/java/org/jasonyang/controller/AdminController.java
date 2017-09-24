package org.jasonyang.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.PatternCodec;
import com.sun.org.apache.xalan.internal.xsltc.compiler.Pattern;
import org.apache.commons.lang3.StringUtils;
import org.jasonyang.enumeration.AdminPageEnum;
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

    // 默认打开首页
    @RequestMapping({ "/admin" })
    public String admin(HttpServletRequest request){
       return admin(request, AdminPageEnum.HOME.getPage());
    }

    @RequestMapping({ "/admin/{operation}" })
    public String admin(HttpServletRequest request, @PathVariable("operation") String operation) {
        // 验证用户是否登录
        if (request.getSession().getAttribute("user") == null) {
            return "redirect:/login";
        }

        // 与枚举中配置的页面匹配, 跳转到对应操作的jsp页面
        if(StringUtils.isNotBlank(operation)){
            for (AdminPageEnum adminPageEnum : AdminPageEnum.values()){
                if(adminPageEnum.getPage().equals(operation)){
                    return "admin/" + operation;
                }
            }
        }
        return "admin/home";
    }

	/**
	 * 文档列表
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
			return "redirect:admin/home";
		}
		final String username = request.getParameter("username");
		final String password = request.getParameter("password");
		if (StringUtils.isNotBlank(username) && StringUtils.isNotBlank(password)) {
			final User user = this.userService.UserAuthentication(username);
			if (user != null && password.equals(user.getPassword())) {
				model.addAttribute("user", user);
				// 将用户信息存放至session中
				request.getSession().setAttribute("user", user);
				return "redirect:admin/home";
			}
		}
		return "admin/login";
	}
 
	@ResponseBody
	@RequestMapping({ "/archive/save" })
	public String saveArchive(@ModelAttribute Archive archive) {
		if(this.archiveService.saveArchive(archive) > 0){
			// 保存成功后,刷新redis缓存
			this.archiveService.setAllPublishedArchivesInfoToRedis();
		}
		return ResponseResult.SUCCESS.getStatus();
	}

	@RequestMapping({ "/archive/edit/{id}" })
	public String toEdit(@PathVariable("id") String id, Model model) {
        Archive archive = this.archiveService.queryArchiveById(id,0);
        model.addAttribute("archive", archive);
		return "admin/editor";
	}
	
	@RequestMapping({ "/archive/delete/{id}" })
	public String delete(@PathVariable("id") String id) {
		this.archiveService.deleteArchiveById(id);
		return "redirect:/admin/archive_management";
	}

    /**
     * 刷新redis缓存
     * @return 文档管理页面
     */
	@RequestMapping({ "/archive/refreshCache" })
	public String refreshArchivesCache(){
		this.archiveService.setAllPublishedArchivesInfoToRedis();
		return "redirect:/archive_management";
	}
}
