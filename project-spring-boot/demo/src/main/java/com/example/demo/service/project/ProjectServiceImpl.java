package com.example.demo.service.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.domain.dto.ProjectDto;
import com.example.demo.domain.vo.ProjectFilteringVo;
import com.example.demo.repository.ProjectRepository;

@Service
public class ProjectServiceImpl implements ProjectService{
	@Autowired
	private ProjectRepository projectRepository;
	
	@Override
	public ProjectDto detail(int id) {
		ProjectDto projectDto = projectRepository.findById(id);
		return projectDto;
	}
	
	@Override
	public List<ProjectDto> getList(ProjectFilteringVo filter) {
		List<ProjectDto> list = projectRepository.findAll();
		
		return list;
	}

}
