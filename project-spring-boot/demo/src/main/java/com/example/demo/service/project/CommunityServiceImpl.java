package com.example.demo.service.project;

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
	public List<CommunityDto> findByProjectId(Integer projectId) {
		return communityRepository.findByProjectId(projectId);
	}
}
