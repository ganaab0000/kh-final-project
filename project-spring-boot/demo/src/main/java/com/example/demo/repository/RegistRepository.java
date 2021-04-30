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


@Repository("projectDao")
public class RegistRepository {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/*
	 * @return result
	 */
	public int createProject() {
		return sqlSession.insert("projectMapper.createProject");
	}
	
	/*
	 * @return id
	 */
	public int selectThisProject() {
		return sqlSession.selectOne("projectMapper.selectThisProject");
	}
	
	/*
	 * 파일 가져오기
	 * 
	 */
	public ProjectVo getOriginFile(int id) {
		return sqlSession.selectOne("projectMapper.getOriginFile", id);
	}
	//리워드 저장
	public int insertReward(RewardVo reward) {
		return sqlSession.insert("projectMapper.insertReward", reward);
	}
	//프로젝트 저장
	public int insertProject(ProjectVo project) {
		return sqlSession.insert("projectMapper.insertProject", project);
	}
	public ArrayList<RewardVo> selectRewardList(ArrayList<String> rewardList) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectRewardList", rewardList);
	}
	public ProjectVo selectCurrentProject(int id) {
		return sqlSession.selectOne("projectMapper.selectCurrentProject", id);
	}
	public int deleteRewards(int id) {
		return sqlSession.delete("projectMapper.deleteRewards", id);
	}
	public ArrayList<RewardVo> selectCurrentReward(int id) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectRewardList", id);
	}
	
}
