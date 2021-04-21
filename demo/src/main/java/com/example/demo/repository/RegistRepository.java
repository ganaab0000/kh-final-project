package com.example.demo.repository;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.domain.vo.ProjectVo;
import com.example.demo.domain.vo.RewardVo;


@Mapper
public interface RegistRepository {
	
	/*
	 * @return result
	 */
	public int createProject();
	
	/*
	 * @return id
	 */
	public int selectThisProject();
	
	/*
	 * 파일 가져오기
	 * 
	 */
	public ProjectVo getOriginFile(int id);
	//리워드 저장
	public int insertReward(RewardVo reward);
	//프로젝트 저장
	public int insertProject(ProjectVo project);
	
	public ArrayList<RewardVo> selectRewardList(ArrayList<String> rewardList);
	
	public ProjectVo selectCurrentProject(int id);
	
	public int deleteRewards(int id);
	
	public ArrayList<RewardVo> selectCurrentReward(int id);
	
}
