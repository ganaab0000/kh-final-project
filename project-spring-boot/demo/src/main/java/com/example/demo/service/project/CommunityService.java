package com.example.demo.service.project;

import java.util.HashMap;
import java.util.List;

import com.example.demo.domain.dto.CommunityDto;
import com.example.demo.domain.vo.CommunityVo;

public interface CommunityService {

	public List<CommunityVo> findByProjectId(HashMap<String, Object> params);
	
	public int getCountByCategory(HashMap<String, Object> params);
	
	public List<CommunityVo> findReply(HashMap<String, Object> params);

	public CommunityVo findById(Integer id);

	public void save(CommunityDto communityDto);

	public void saveReply(CommunityDto communityDto);
	
	public int getCount(Integer projectId);

	public void update(CommunityDto communityDto);

	public void delete(Integer communityId);

	public int getReplyCount(Integer parentId);
}
