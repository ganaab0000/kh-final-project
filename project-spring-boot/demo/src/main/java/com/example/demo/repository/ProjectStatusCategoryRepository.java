package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.domain.dto.ProjectStatusCategoryDto;

@Mapper
public interface ProjectStatusCategoryRepository {
	@Select("select * from project_status_category")
	public List<ProjectStatusCategoryDto> findAll();
}
