package com.example.demo.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.config.auth.dto.SessionMember;
import com.example.demo.domain.dto.CommunityDto;
import com.example.demo.domain.vo.CommunityVo;
import com.example.demo.service.project.CommunityService;

import lombok.extern.java.Log;

@Log
@RestController
@RequestMapping("/project")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class CommunityRestController {
	@Autowired
	private CommunityService communityService;
	
	//프로젝트 커뮤니티 로드
	@GetMapping("/{id}/community")
	public Map<String, Object> getCommunity(@PathVariable("id") Integer id, @RequestParam("category") Integer category, @RequestParam("page") Integer page) {
		log.info("project community : " + id);
		log.info("category : " + category);
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("projectId", id);
		params.put("category", category);
		params.put("page", page);
		
		Map<String, Object> result = new HashMap<String, Object>();
		if(page==1) {
			result.put("count", communityService.getCountByCategory(params));
		}
		result.put("list", communityService.findByProjectId(params));
		return result;
//		return communityService.findByProjectId(params);
	}
	
	//프로젝트 커뮤니티 작성
	@PostMapping("/{id}/community")
	public void writeCommunity(@PathVariable("id") Integer id, CommunityDto communityDto, HttpSession session, Integer writerId, Integer parentId) {
		SessionMember member = (SessionMember) session.getAttribute("member");
		
		communityDto.setMemberId(member.getId());
		communityDto.setProjectId(id);
		communityDto.setCommunityCategoryId(writerId == communityDto.getMemberId() ? 2 : 1);
		
		if(parentId==null) {
			communityService.save(communityDto);
		} else {
			communityDto.setParentCommunityId(parentId);
			communityService.saveReply(communityDto);
		}
		
	}
	
	//프로젝트 커뮤니티 포스트 로드
	@GetMapping("/{projectId}/community/{postId}")
	public CommunityVo readPost(@PathVariable("postId") Integer postId) {
		log.info("readPost()");
		
		return communityService.findById(postId);
	}
	
	//프로젝트 커뮤니티 포스트 댓글 로드
	@GetMapping("/{projectId}/community/{postId}/reply")
	public List<CommunityVo> getPostReply(@PathVariable("postId") Integer parentId, @RequestParam("page") Integer page) {
		log.info("getPostReply()");
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("parentId", parentId);
		params.put("page", page);
		
		return communityService.findReply(params);
	}
	
	//프로젝트 커뮤니티 포스트 개수 로드
	@GetMapping("/{projectId}/community/count")
	public int getCount(@PathVariable("projectId") Integer projectId) {
		log.info("getCount()");
		
		return communityService.getCount(projectId);
	}
	
	//커뮤니티 업데이트
	@PutMapping("/community/{communityId}")
	public Integer update(@PathVariable("communityId") Integer communityId, CommunityDto communityDto) {
		log.info("community update()" + communityId);
		
		communityDto.setId(communityId);
		communityService.update(communityDto);
		
		return communityDto.getId();
	}
	
	//커뮤니티 삭제
	@DeleteMapping("/community/{communityId}")
	public void delete(@PathVariable("communityId") Integer communityId) {
		log.info("community delete()" + communityId);
		
		communityService.delete(communityId);
	}
}
