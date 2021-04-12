package com.example.demo.service.project;

import java.util.List;

import com.example.demo.domain.dto.CommunityDto;

public interface CommunityService {

	public List<CommunityDto> findByProjectId(Integer projectId, Integer category);
	
	public List<CommunityDto> findReply(Integer parentId);

	public void save(CommunityDto communityDto);

	public void saveReply(CommunityDto communityDto);
	
	public CommunityDto findById(Integer postId);

}
