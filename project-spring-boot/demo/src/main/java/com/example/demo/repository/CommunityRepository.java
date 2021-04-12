package com.example.demo.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.domain.dto.CommunityDto;

@Mapper
public interface CommunityRepository {

	public List<CommunityDto> findByProjectId(HashMap<String, Object> params);

	public List<CommunityDto> findReply(Integer parentId);
	
	@Insert("insert into community values(community_id_seq.nextval, #{content}, 'N', sysdate, sysdate,#{projectId}, #{memberId}, #{communityCategoryId}, '')")
	public void save(CommunityDto communityDto);
	
	@Insert("insert into community values(community_id_seq.nextval, #{content}, 'N', sysdate, sysdate,#{projectId}, #{memberId}, #{communityCategoryId}, #{parentCommunityId})")
	public void saveReply(CommunityDto communityDto);

	@Select("select * from community where id = #{postId}")
	public CommunityDto findById(Integer postId);
	
}
