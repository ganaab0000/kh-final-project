package com.example.demo.controller.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.config.auth.dto.SessionMember;
import com.example.demo.domain.dto.CommunityDto;
import com.example.demo.domain.vo.ProejctAjaxListVo;
import com.example.demo.domain.vo.ProjectFilteringVo;
import com.example.demo.domain.vo.ProjectVo;
import com.example.demo.service.RewardService;
import com.example.demo.service.member.MemberService;
import com.example.demo.service.project.CommunityService;
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
	@Autowired
	private RewardService rewardService;
	@Autowired
	private CommunityService communityService;
	
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
		model.addAttribute("rewardList", rewardService.findByProjectId(projectVo.getId()));
		
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
	@ResponseBody
	@GetMapping("/listajax")
	public ProejctAjaxListVo getListAjax(ProjectFilteringVo filter){
		log.info("project list : category = " + filter.getCategory() + " , status = " + filter.getStatus());
		
		ProejctAjaxListVo proejctAjaxListVo = new ProejctAjaxListVo();
		
		if(filter.getPage()==1) {
			proejctAjaxListVo.setProjectCount(projectService.getTotalCount(filter));
		}
		proejctAjaxListVo.setProjectList(projectService.getList(filter));
		
		return proejctAjaxListVo;
	}
	
	//프로젝트 스토리 로드
	@CrossOrigin(origins = "*", allowedHeaders = "*")
	@ResponseBody
	@GetMapping("/{id}/story")
	public String getStory(@PathVariable("id") int id, Model model) {
		log.info("project story : " + id);
		
		return projectService.getStory(id);
	}
	
	//프로젝트 커뮤니티 로드
	@CrossOrigin(origins = "*", allowedHeaders = "*")
	@ResponseBody
	@GetMapping("/{id}/community")
	public List<CommunityDto> getCommunity(@PathVariable("id") int id, Model model) {
		log.info("project community : " + id);
		
		return communityService.findByProjectId(id);
	}
	
	@CrossOrigin(origins = "*", allowedHeaders = "*")
	@ResponseBody
	@PostMapping("/{id}/community")
	public void writeCommunity(@PathVariable("id") int id, CommunityDto communityDto, HttpSession session) {
		SessionMember member = (SessionMember) session.getAttribute("member");
//		communityDto.setMemberId(member.getId());
		communityDto.setMemberId(1);
		
		communityDto.setProjectId(id);
		
		communityService.save(communityDto);
	}
}
