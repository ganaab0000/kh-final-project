package com.example.demo.controller.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.config.auth.dto.SessionMember;
import com.example.demo.domain.dto.CommunityDto;
import com.example.demo.domain.dto.ProjectCategoryDto;
import com.example.demo.domain.dto.VoteDto;
import com.example.demo.domain.vo.CommunityVo;
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
	public String detail(@PathVariable("id") Integer id, Model model) {
		log.info("project detail : " + id);
		
		ProjectVo projectVo = projectService.getDetail(id);
		model.addAttribute("project", projectVo);
		model.addAttribute("writer", memberService.findById(projectVo.getMemberId()));
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
	
	//프로젝트 리스트 로드
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
	
	//프로젝트 좋아요 가져오기
	@CrossOrigin(origins = "*", allowedHeaders = "*")
	@ResponseBody
	@GetMapping("/{projectId}/like")
	public int getLike(@PathVariable("projectId") Integer projectId, HttpSession session) {
		System.out.println("getLike");
		SessionMember member = (SessionMember) session.getAttribute("member");
		VoteDto voteDto = new VoteDto();
		
		voteDto.setMemberId(member.getId());
		voteDto.setProjectId(projectId);
		
		return projectService.getLike(voteDto);
	}
	
	//좋아요 업데이트
	@CrossOrigin(origins = "*", allowedHeaders = "*")
	@ResponseBody
	@PostMapping("/{projectId}/like")
	public int updateLike(@PathVariable("projectId") Integer projectId, HttpSession session) {
		System.out.println("updateLike");
		SessionMember member = (SessionMember) session.getAttribute("member");
		VoteDto voteDto = new VoteDto();
		
		voteDto.setMemberId(member.getId());
		voteDto.setProjectId(projectId);
		
		return projectService.updateLike(voteDto);
	}
	
	//프로젝트 스토리 로드
	@CrossOrigin(origins = "*", allowedHeaders = "*")
	@ResponseBody
	@GetMapping("/{id}/story")
	public String getStory(@PathVariable("id") Integer id, Model model) {
		log.info("project story : " + id);
		
		return projectService.getStory(id);
	}
	
	//프로젝트 스토리 로드
	@CrossOrigin(origins = "*", allowedHeaders = "*")
	@ResponseBody
	@GetMapping("/category")
	public List<ProjectCategoryDto> getCategory() {
		
		return projectService.getCategory();
	}
	
	//프로젝트 커뮤니티 로드
	@CrossOrigin(origins = "*", allowedHeaders = "*")
	@ResponseBody
	@GetMapping("/{id}/community")
	public List<CommunityVo> getCommunity(@PathVariable("id") Integer id, @RequestParam("category") Integer category, Model model) {
		log.info("project community : " + id);
		log.info("category : " + category);
		
		return communityService.findByProjectId(id, category);
	}
	
	//프로젝트 커뮤니티 작성
	@CrossOrigin(origins = "*", allowedHeaders = "*")
	@ResponseBody
	@PostMapping("/{id}/community")
	public void writeCommunity(@PathVariable("id") Integer id, CommunityDto communityDto, HttpSession session, Integer writerId, Integer parentId) {
		SessionMember member = (SessionMember) session.getAttribute("member");
		communityDto.setMemberId(member.getId());
		communityDto.setProjectId(id);
		communityDto.setCommunityCategoryId(writerId == communityDto.getMemberId() ? 2 : 1);
		
		System.out.println(parentId);
		if(parentId==null) {
			communityService.save(communityDto);
		} else {
			communityDto.setParentCommunityId(parentId);
			communityService.saveReply(communityDto);
		}
		
	}
	
	//프로젝트 커뮤니티 포스트 로드
	@CrossOrigin(origins = "*", allowedHeaders = "*")
	@ResponseBody
	@GetMapping("/{projectId}/community/{postId}")
	public CommunityVo readPost(@PathVariable("postId") Integer postId) {
		log.info("readPost()");
		
		return communityService.findById(postId);
	}
	
	//프로젝트 커뮤니티 포스트 댓글 로드
	@CrossOrigin(origins = "*", allowedHeaders = "*")
	@ResponseBody
	@GetMapping("/{projectId}/community/{postId}/reply")
	public List<CommunityVo> getPostReply(@PathVariable("postId") Integer parentId) {
		log.info("getPostReply()");
		
		return communityService.findReply(parentId);
	}
	
	//프로젝트 커뮤니티 포스트 개수 로드
	@CrossOrigin(origins = "*", allowedHeaders = "*")
	@ResponseBody
	@GetMapping("/{projectId}/community/count")
	public int getCount(@PathVariable("projectId") Integer projectId) {
		log.info("getCount()");
		
		return communityService.getCount(projectId);
	}
	
	//커뮤니티 업데이트
	@CrossOrigin(origins = "*", allowedHeaders = "*")
	@ResponseBody
	@PutMapping("/community/{communityId}")
	public Integer update(@PathVariable("communityId") Integer communityId, CommunityDto communityDto) {
		log.info("community update()" + communityId);
		
		communityDto.setId(communityId);
		communityService.update(communityDto);
		
		return communityDto.getId();
	}
	
	//커뮤니티 삭제
	@CrossOrigin(origins = "*", allowedHeaders = "*")
	@ResponseBody
	@DeleteMapping("/community/{communityId}")
	public void delete(@PathVariable("communityId") Integer communityId) {
		log.info("community delete()" + communityId);
		
		communityService.delete(communityId);
	}
}
