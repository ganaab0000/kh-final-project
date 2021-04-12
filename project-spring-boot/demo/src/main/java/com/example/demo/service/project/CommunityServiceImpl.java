package com.example.demo.service.project;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.domain.dto.CommunityDto;
import com.example.demo.repository.CommunityRepository;

@Service
public class CommunityServiceImpl implements CommunityService{
	
	@Autowired
	private CommunityRepository communityRepository;
	
	@Override
	public List<CommunityDto> findByProjectId(Integer projectId, Integer category) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("projectId", projectId);
		params.put("category", category);
		return communityRepository.findByProjectId(params);
	}
	
	@Override
	public List<CommunityDto> findReply(Integer parentId) {
		return communityRepository.findReply(parentId);
	}
	
	@Override
	public void save(CommunityDto communityDto) {
		communityRepository.save(communityDto);
	}
	
	@Override
	public void saveReply(CommunityDto communityDto) {
		communityRepository.saveReply(communityDto);
	}
	
	@Override
	public CommunityDto findById(Integer postId) {
		return communityRepository.findById(postId);
	}
}
