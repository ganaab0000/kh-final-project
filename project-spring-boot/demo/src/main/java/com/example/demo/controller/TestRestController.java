package com.example.demo.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entity.dto.TestItem;

@RestController
public class TestRestController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	TestItem testItem;

	@GetMapping("/test/api/string")
	public String getString() {
		logger.info("/api/string");

		return "testItem";
	}
	@GetMapping("/test/api/item")
	public TestItem getTestItemByDefault() {
		logger.info("/api/item");
		testItem.setId("testId");
		testItem.setName("testName");

		return testItem;
	}
	@GetMapping("/test/api/customitem/{id}/{name}")
	public TestItem getTestItem(@PathVariable String id, @PathVariable String name) {
		logger.info("/api/item");
		testItem.setId(id);
		testItem.setName(name);

		return testItem;
	}
}
