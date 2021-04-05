package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.domain.dto.ProjectCategoryDto;

@Mapper
public interface ProjectCategoryRepository {

	@Select("select * from project_category")
	public List<ProjectCategoryDto> findAll();
}
