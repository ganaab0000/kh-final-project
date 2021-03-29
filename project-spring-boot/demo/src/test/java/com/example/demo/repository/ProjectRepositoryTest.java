package com.example.demo.repository;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.example.demo.domain.dto.ProjectDto;

@SpringBootTest
public class ProjectRepositoryTest {
	@Autowired
	private ProjectRepository projectRepository;
	
	
//	@Test
	public void getNextId() {
		System.out.println("nextId : " + projectRepository.getNextId());
	}
	
//	@Test
	public void findById() {
		ProjectDto dto = projectRepository.findById(1);
		System.out.println("project id : " + dto.getId());
	}
	
//	@Test
	public void findAll() {
		List<ProjectDto> list = projectRepository.findAll();
		System.out.println("list size : " + list.size());
	}
	
}
