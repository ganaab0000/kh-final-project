package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.domain.dto.ProjectDto;

@Mapper
public interface ProjectRepository {
	
	@Select("select project_id_seq.nextval from dual")
	public int getNextId();
	
	@Select("select * from project")
	public List<ProjectDto> findAll();
	
	@Select("select * from project where id = #{id}")
	public ProjectDto findById(int id);
	
}
