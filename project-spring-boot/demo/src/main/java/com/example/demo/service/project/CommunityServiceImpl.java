package com.example.demo.service.project;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.domain.dto.CommunityDto;
import com.example.demo.domain.vo.CommunityVo;
import com.example.demo.repository.CommunityRepository;

@Service
public class CommunityServiceImpl implements CommunityService{
	
	@Autowired
	private CommunityRepository communityRepository;
	
	@Override
	public List<CommunityVo> findByProjectId(Integer projectId, Integer category) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("projectId", projectId);
		params.put("category", category);
		return communityRepository.findByProjectId(params);
	}
	
	@Override
	public List<CommunityVo> findReply(Integer parentId) {
		return communityRepository.findReply(parentId);
	}
	
	@Override
	public CommunityVo findById(Integer id) {
		return communityRepository.findById(id);
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
	public int getCount(Integer projectId) {
		return communityRepository.getCount(projectId);
	}
	
	@Override
	public void update(CommunityDto communityDto) {
		communityRepository.update(communityDto);
	}
	
	@Override
	public void delete(Integer communityId) {
		communityRepository.delete(communityId);
	}
}
