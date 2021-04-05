package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.domain.dto.ProjectDto;
import com.example.demo.domain.vo.ProjectFilteringVo;
import com.example.demo.domain.vo.ProjectVo;

@Mapper
public interface ProjectRepository {
	
	@Select("select project_id_seq.nextval from dual")
	public int getNextId();
	
	@Select("select * from project")
	public List<ProjectDto> findAll();
	
	@Select("select * from project where id = #{id}")
	public ProjectVo findById(int id);
	
	public List<ProjectDto> findForMain(ProjectFilteringVo filter);

	public int getTotalCount(ProjectFilteringVo filter);
	
	public List<ProjectVo> findByFilter(ProjectFilteringVo filter);
}
