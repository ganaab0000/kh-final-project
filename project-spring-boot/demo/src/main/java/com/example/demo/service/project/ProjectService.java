package com.example.demo.service.project;

import java.util.List;

import com.example.demo.domain.dto.ProjectCategoryDto;
import com.example.demo.domain.dto.ProjectStatusCategoryDto;
import com.example.demo.domain.dto.VoteDto;
import com.example.demo.domain.vo.ProjectFilteringVo;
import com.example.demo.domain.vo.ProjectVo;

public interface ProjectService {
	public List<ProjectVo> getList(ProjectFilteringVo filter);
	public void getListForMain();
	public ProjectVo getDetail(int id);
	public int getTotalCount(ProjectFilteringVo filter);
	public List<ProjectCategoryDto> getCategory();
	public List<ProjectStatusCategoryDto> getStatus();
	public String getStory(int id);
	public int updateLike(VoteDto voteDto);
	public int getLike(VoteDto voteDto);
	public List<ProjectVo> getLiked(ProjectFilteringVo filter);
	public int getLikedCount(ProjectFilteringVo filter);
	public int joinedProjectCount(int memberId);
	public int createdProjectCount(int memberId);
}
