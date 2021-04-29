package com.example.demo.service.project;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.example.demo.config.auth.dto.SessionMember;
import com.example.demo.domain.vo.ProjectVo;
import com.example.demo.domain.vo.RewardVo;

public interface RegistService {
	
	
	/* 
	 * 펀딩 등록페이지로 넘어갈 때 프로젝트 상태를 임시로 지정해주는 Service
	 * */ 
	public int createProject();
	
	/*
	 * 프로젝트 번호를 가져오는 Service
	 **/
	
	public int selectThisProject();
	
	/*
	 * 프로젝트 DB 저장 Service
	 *  
	 */
	public int insertProject(ProjectVo project, MultipartFile uploadfile1, MultipartFile uploadfile2, MultipartFile uploadfile3, HttpServletRequest req);
	
	/*
	 * 리워드 DB 저장
	 */
	
	public int insertReward(RewardVo reward);
	/*
	 * 리워드 삭제
	 */
	
	public ArrayList<RewardVo> selectRewardList(String reward);
	
	public ProjectVo selectCurrentProject(int id);
	
	
	public int deleteRewards(int id);
	
	public ArrayList<RewardVo> selectCurrentReward(int id);

	
	
}
