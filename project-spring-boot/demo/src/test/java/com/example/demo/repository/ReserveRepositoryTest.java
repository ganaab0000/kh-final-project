package com.example.demo.repository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class ReserveRepositoryTest {
	
	@Autowired
	ReserveRepository reserverRepository;
	
	@Test
	public void getCollected() {
		long sum = reserverRepository.getCollected(2);
		System.out.println("모인 금액 : " + sum);
	}

	
}
