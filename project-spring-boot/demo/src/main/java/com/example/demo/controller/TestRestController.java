package com.example.demo.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.domain.dto.TestItem;
import com.example.demo.service.EmailServiceImpl;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
public class TestRestController {


	@Autowired
	TestItem testItem;
	@Autowired
	EmailServiceImpl emailServiceImpl;

	@GetMapping("/test/api/mail")
	public String getMail() {
		log.info("/test/api/mail");
		emailServiceImpl.sendSimpleMessage("aaagmail.com", "aaaba", "text22");
		return "testItem";
	}

	@GetMapping("/test/api/string")
	public String getString() {
		log.info("/api/string");

		return "testItem";
	}
	@GetMapping("/test/api/item")
	public TestItem getTestItemByDefault() {
		log.info("/api/item");
		testItem.setId("testId");
		testItem.setName("testName");

		return testItem;
	}
	@GetMapping("/test/api/customitem/{id}/{name}")
	public TestItem getTestItem(@PathVariable String id, @PathVariable String name) {
		log.info("/api/item");
		testItem.setId(id);
		testItem.setName(name);

		return testItem;
	}
}
