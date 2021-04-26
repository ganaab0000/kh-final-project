package com.example.demo.controller.user;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.config.auth.dto.SessionMember;
import com.example.demo.domain.vo.ProjectFilteringVo;
import com.example.demo.service.project.ProjectService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class HomeUserController {
	@Autowired
	private ProjectService projectService;

	@GetMapping("/")
	public String getMain(HttpSession session, Model model) {
		log.info("/");
		
		ProjectFilteringVo filter = new ProjectFilteringVo();
		filter.setLength(6);
		
		SessionMember member = (SessionMember) session.getAttribute("member");
		if(member != null) {
			filter.setMemberId(member.getId());
		}
		filter.setSort(2);
		filter.setStatus(1);
		model.addAttribute("newProject", projectService.getList(filter));
		filter.setSort(null);
		
		filter.setStatus(3);
		model.addAttribute("coming", projectService.getList(filter));
		
		filter.setStatus(1);
		filter.setMinRate(75);
		filter.setMaxRate(99);
		model.addAttribute("attainment", projectService.getList(filter));
		
		model.addAttribute("carousel", projectService.carousel());
		
		return "user/main/index";
	}

}
