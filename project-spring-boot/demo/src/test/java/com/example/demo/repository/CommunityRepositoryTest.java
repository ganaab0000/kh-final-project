package com.example.demo.repository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.example.demo.domain.dto.CommunityDto;

@SpringBootTest
public class CommunityRepositoryTest {
	
	@Autowired
	CommunityRepository communityRepository;
	
//	@Test
	public void delete() {
		communityRepository.delete(52);
	}

	@Test
	public void update() {
		CommunityDto dto = new CommunityDto();
		dto.setId(53);
		dto.setContent("update test");
		
		communityRepository.update(dto);
	}
	
}
