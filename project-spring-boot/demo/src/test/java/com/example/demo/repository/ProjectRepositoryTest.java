package com.example.demo.repository;

import java.util.List;
import java.util.stream.Stream;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.example.demo.domain.dto.ProjectDto;
import com.example.demo.domain.vo.ProjectFilteringVo;
import com.example.demo.domain.vo.ProjectVo;

@SpringBootTest
public class ProjectRepositoryTest {
	@Autowired
	private ProjectRepository projectRepository;
	@Autowired
	private MemberRepository memberRepository;
	
//	@Test
	public void getNextId() {
		System.out.println("nextId : " + projectRepository.getNextId());
	}
	
//	@Test
	public void findById() {
//		ProjectDto dto = projectRepository.findById(1);
//		System.out.println("project id : " + dto.getId());
		
		System.out.println(memberRepository.findById(2).getEmail());
	}
	
//	@Test
	public void findAll() {
		List<ProjectDto> list = projectRepository.findAll();
		System.out.println("list size : " + list.size());
	}
	
//	@Test
	public void findForMain() {
		ProjectFilteringVo vo = new ProjectFilteringVo();
		List<ProjectDto> list = projectRepository.findForMain(vo);
		Stream<ProjectDto> stream = list.stream();
		
		stream.forEach(p->System.out.println(p.getTitle()));
	}
	
	@Test
	public void findByFilter() {
		ProjectFilteringVo filter = new ProjectFilteringVo();
		filter.setSort(3);
		List<ProjectVo> list = projectRepository.findByFilter(filter);
		list.stream().forEach(p->System.out.println(p.getId()));
	}
	
}
