package com.example.demo.repository;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.domain.dto.VoteDto;

@Mapper
public interface VoteRepository {

	@Select("select count(*) from vote where member_id = #{memberId} and project_id = #{projectId}")
	public int get(VoteDto voteDto);
	
	@Insert("insert into vote values(#{memberId}, #{projectId})")
	public void save(VoteDto voteDto);
	
	@Delete("delete from vote where member_id = #{memberId} and project_id = #{projectId}")
	public void delete(VoteDto voteDto);
}
