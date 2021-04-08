package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.domain.dto.CommunityDto;

@Mapper
public interface CommunityRepository {

	@Select("select * from community where project_id = #{projectId} order by id desc")
	public List<CommunityDto> findByProjectId(Integer projectId);

	@Insert("insert into community values("
			+ "community_id_seq.nextval, #{content}, 'N', sysdate, sysdate,"
			+ "#{projectId}, #{memberId}, #{communityCategoryId}, '')")
	public void save(CommunityDto communityDto);
}
