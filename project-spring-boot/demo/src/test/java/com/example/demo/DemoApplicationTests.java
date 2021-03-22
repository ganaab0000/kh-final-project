package com.example.demo;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;


@SpringBootTest
class DemoApplicationTests {

	@Test
	void contextLoads() {
	}

	@Test
	void userOne() {
		assertEquals("test", "test");
		assertEquals("test", "test2");
	}
	@Test
	void userTwo() {
		assertEquals("test", "test2");
	}
	@Test
	void userThree() {
		assertEquals("test", "test");
	}
}
