package com.example.demo.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.domain.vo.ProejctAjaxListVo;
import com.example.demo.domain.vo.ProjectFilteringVo;
import com.example.demo.domain.vo.ProjectVo;
import com.example.demo.service.member.MemberService;
import com.example.demo.service.project.ProjectService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/project")
public class ProjectController {
	
	@Autowired
	private ProjectService projectService;
	@Autowired
	private MemberService memberService;
	
	//프로젝트 인덱스 페이지
	@GetMapping("/index")
	public String index() {
		log.info("project index");
		
		projectService.getListForMain();
		
		return "/user/project/index";
	}
	
	//프로젝트 상세 페이지
	@GetMapping("/{id}")
	public String detail(@PathVariable("id") int id, Model model) {
		log.info("project detail : " + id);
		
		ProjectVo projectVo = projectService.getDetail(id);
		model.addAttribute("project", projectVo);
		model.addAttribute("member", memberService.findById(projectVo.getMemberId()));
		
		return "/user/project/detail";
	}
	
	//프로젝트 리스트 페이지
	@GetMapping("/list")
	public String list(Model model) {
		log.info("project list");
		
		model.addAttribute("category", projectService.getCategory());
		model.addAttribute("status", projectService.getStatus());
		
		return "/user/project/list";
	}
	
	//비동기 리스트 로드
	@CrossOrigin(origins = "*", allowedHeaders = "*")
	@GetMapping("/listajax")
	@ResponseBody
	public ProejctAjaxListVo getListAjax(ProjectFilteringVo filter){
		log.info("project list : category = " + filter.getCategory() + " , status = " + filter.getStatus());
		
		System.out.println("page :" + filter.getPage());
		
		ProejctAjaxListVo proejctAjaxListVo = new ProejctAjaxListVo();
		
		if(filter.getPage()==1) {
			proejctAjaxListVo.setProjectCount(projectService.getTotalCount(filter));
		}
		proejctAjaxListVo.setProjectList(projectService.getList(filter));
		
		return proejctAjaxListVo;
	}
}
