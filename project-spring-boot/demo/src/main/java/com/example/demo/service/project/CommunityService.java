package com.example.demo.service.project;

import java.util.List;

import com.example.demo.domain.dto.CommunityDto;

public interface CommunityService {

	public List<CommunityDto> findByProjectId(Integer projectId);

	public void save(CommunityDto communityDto);
}
