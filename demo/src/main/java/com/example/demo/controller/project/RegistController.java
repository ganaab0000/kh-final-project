package com.example.demo.controller.project;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.vo.MemberDto;
import com.example.demo.domain.vo.ProjectVo;
import com.example.demo.domain.vo.RewardListVo;
import com.example.demo.domain.vo.RewardVo;
import com.example.demo.service.project.RegistService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
//@RequestMapping("/project")
public class RegistController {
	
	@Autowired
	private RegistService registService;
	
	@RequestMapping("/success")
	public ModelAndView success(HttpServletRequest req, HttpServletResponse reqs, ModelAndView mv) {
		mv.setViewName("/user/project/success");
		return mv;
	}
	
	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest req, HttpServletResponse reqs, ModelAndView mv) {
		mv.setViewName("/user/project/index");
		return mv;
	}
	
	@RequestMapping("/project")
	public ModelAndView registproject(ModelAndView mv, String finishModel) {
		int result = registService.createProject();
		int id;

		ProjectVo project = new ProjectVo();
		
		if(finishModel != null) {
			mv.addObject("finishModel", "true");
		}
		if(result > 0) {
			mv.setViewName("/user/project/project");
			id = registService.selectThisProject();
			project.setId(id);
			
			mv.addObject("project", project);
		}
		else {
			mv.addObject("msg", "프로젝트 번호 생성 실패");
			mv.setViewName("/user/common/errorpage");
		}
		
		return mv;
		
	}
	/* 
	 * @param mv
	 * @param project
	 * @param itemList
	 * @param req
	 * @param uploadfile1
	 * @param uploadfile2
	 * @param uploadfile3
	 * @ResponseBody : HTTP 요청과 응답을 받기 위해서 사용
	 * */
	@ResponseBody
	@PostMapping("/project") 
	public String registProject(ProjectVo project, RewardListVo itemList, MultipartFile uploadfile1, MultipartFile uploadfile2, MultipartFile uploadfile3, HttpServletRequest req) {
		
		int projectStatusCategoryId = project.getProjectStatusCategoryId();
		
		
		
		//파일 등록
		
		int result = registService.insertProject(project, uploadfile1, uploadfile2, uploadfile3, req);
		
		log.info("프로젝트 : "+project+"");
		//reward 등록
		if(result==0) {
			return "error";
		}
		ArrayList<RewardVo> rewardList = new ArrayList<RewardVo>();
		
		result = 1;
		for(int i=0; i< itemList.getItemList().size(); i++) {
			RewardVo reward = itemList.getItemList().get(i);
			try {
				if(reward.getSave().equals("true")) {
					rewardList.add(reward);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		result = registService.deleteRewards(project.getId());
		
		for(RewardVo reward : rewardList) {
			reward.setProjectId(project.getId());
			
			
			
			String addresscheck = "Y";
			
			if(reward.getDelichk() == null) {
				addresscheck = "N";
			}
			reward.setDelichk(addresscheck);
			
			result = registService.insertReward(reward);
			System.out.println(reward);
			System.out.println("리워드 후 result : " + result);
			
			if(result== 0) {
				System.out.println("리워드 저장 실패, 리워드 정보 : " + reward.toString() );
			}
			
		}
		if(projectStatusCategoryId == 1) {
			return result + "";
		}
		else if(projectStatusCategoryId == 2) {
			return "/success";
		}
		else {
			return "error";
		}
		
	}
	
	

	@ResponseBody
	@PostMapping("uploadthumbimg.dr")
	public String uploadThumbImg(HttpServletRequest req, MultipartFile uploadFile) {
		System.out.println(uploadFile);
		
		return uploadFile+"";
	}
	
	@RequestMapping("selectCurrentProject.dr")
	public ModelAndView selectCurrentProject(int id, HttpServletRequest req, ModelAndView mv) {
		ProjectVo project = registService.selectCurrentProject(id);
		MemberDto loginUser = (MemberDto)req.getSession().getAttribute("loginUser");
		
//		if(loginUser == null || loginUser.getId() != project.getMemberId() || project.getProjectStatusCategoryId() != 1) {
//			mv.addObject("msg", "비정상적인 접근입니다.").setViewName("/user/common/errorpage");
//		}
		ArrayList<RewardVo> rewardList = registService.selectCurrentReward(id);
		int size = rewardList.size();
		String userId = (String) req.getSession().getAttribute( "userId" );
		
		mv.addObject("size", size);
		mv.addObject("project", project);
		mv.addObject("rewardList", rewardList);
		mv.addObject("isUpdate", "true");
		
		mv.setViewName("/user/project/registproject");
		return mv;
	}
	
}
