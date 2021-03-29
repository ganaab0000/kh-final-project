package com.example.demo.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
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
	private TestItem testItem;
	@Autowired
	private EmailServiceImpl emailServiceImpl;
	@Value("${user.value}")
	private String userProperty;
	@Value("${user.value.a}")
	private String userPropertya;
	@Value("${user.value.b}")
	private String userPropertyb;
	@Value("${user.value.a}")
	private String userPropertyc;


	@GetMapping("/test/api/propertyb")
	public String getPropertyb() throws UnsupportedEncodingException {
		log.info("/test/api/property");
		return userPropertyb;
	}
	@GetMapping("/test/api/propertyc")
	public String getPropertyc() throws UnsupportedEncodingException {
		log.info("/test/api/property");
		return userPropertyc;
	}
	@GetMapping("/test/api/propertya")
	public String getPropertya() throws UnsupportedEncodingException {
		log.info("/test/api/property");
		return userPropertya;
	}
	@GetMapping("/test/api/property")
	public String getProperty() throws UnsupportedEncodingException {
		log.info("/test/api/property");
		return userProperty;
	}

	@GetMapping("/test/api/encoder")
	public String getEncoder() throws UnsupportedEncodingException {
		log.info("/test/api/encoder");
		String encode = URLEncoder.encode("YOUR_CALLBACK_URL+_http://naver.com.df.adf.df", "UTF-8");
		return encode;
	}

	@GetMapping("/test/api/mail")
	public String getMail() {
		log.info("/test/api/mail");
		emailServiceImpl.sendSimpleMessage("aaagmail.com", "aaaba", "text22");
		return "testItem";
	}

	@GetMapping("/test/api/string")
	public String getString() {
		log.info("/api/string");

		return "한글테스트으릉르";
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
