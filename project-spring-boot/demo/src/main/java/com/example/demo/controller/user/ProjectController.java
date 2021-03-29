package com.example.demo.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.domain.dto.ProjectDto;
import com.example.demo.domain.vo.ProjectFilteringVo;
import com.example.demo.service.project.ProjectService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/project")
public class ProjectController {
	
	@Autowired
	private ProjectService projectService;
	
	
	
	//프로젝트 인덱스 페이지
	@GetMapping("/index")
	public String index() {
		log.info("project index");
		
		return "/user/project/index";
	}
	
	//프로젝트 리스트 페이지
	@GetMapping("/list")
	public String list(ProjectFilteringVo filter, Model model) {
		log.info("project list : category = " + filter.getCategory() + " , ongoing = " + filter.getOngoing());
		
		model.addAttribute("projects", projectService.getList(filter));
		return "/user/project/list";
	}
	
	//프로젝트 상세 페이지
	@GetMapping("/{id}")
	public String detail(@PathVariable("id") int id, Model model) {
		log.info("project detail : " + id);
		
		ProjectDto projectDto = projectService.detail(id);
		model.addAttribute("project", projectDto);
		
		return "/user/project/detail";
	}
}
