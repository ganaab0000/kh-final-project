package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.domain.dto.CommunityDto;

@Mapper
public interface CommunityRepository {

	@Select("select * from community where project_id = #{projectId} order by date_created")
	public List<CommunityDto> findByProjectId(Integer projectId);
}
