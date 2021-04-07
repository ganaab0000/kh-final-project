package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.domain.dto.RewardDto;

@Mapper
public interface RewardRepository {
	
	@Select("select * from reward where project_id = #{projectId} order by price")
	public List<RewardDto> findByProjectId(int projectId);
}
