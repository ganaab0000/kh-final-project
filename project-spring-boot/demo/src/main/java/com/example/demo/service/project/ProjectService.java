package com.example.demo.service.project;

import java.util.List;

import com.example.demo.domain.dto.ProjectDto;
import com.example.demo.domain.vo.ProjectFilteringVo;

public interface ProjectService {
	public ProjectDto detail(int id);
	public List<ProjectDto> getList(ProjectFilteringVo filter);
}
