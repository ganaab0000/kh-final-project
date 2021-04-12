package com.example.demo.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.domain.dto.CommunityDto;
import com.example.demo.domain.vo.CommunityVo;

@Mapper
public interface CommunityRepository {

	public List<CommunityVo> findByProjectId(HashMap<String, Object> params);

	public List<CommunityVo> findReply(Integer parentId);
	
	@Insert("insert into community values(community_id_seq.nextval, #{content}, 'N', sysdate, sysdate,#{projectId}, #{memberId}, #{communityCategoryId}, '')")
	public void save(CommunityDto communityDto);
	
	@Insert("insert into community values(community_id_seq.nextval, #{content}, 'N', sysdate, sysdate,#{projectId}, #{memberId}, #{communityCategoryId}, #{parentCommunityId})")
	public void saveReply(CommunityDto communityDto);

	public CommunityVo findById(Integer id);
	
}
