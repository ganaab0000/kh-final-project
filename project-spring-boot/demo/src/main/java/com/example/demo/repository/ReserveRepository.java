package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.domain.dto.ReserveDto;

@Mapper
public interface ReserveRepository {
	
	@Select("select * from reserve where project_id = #{projectId}")
	public List<ReserveDto> findByProjectId(int projectId);
	
	//결제상태가 대기,완료만 카운트
	@Select("select count(*) from reserve where project_id = #{projectId} and (reserve_status_category_id = 1 or reserve_status_category_id = 2)")
	public Integer getSponsorCount(int projectId);
	
	public Integer getCollected(int projectId);
}
