package com.example.demo.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import com.example.demo.repository.TestAnnotationRepository;
import com.example.demo.repository.TestXmlRepository;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class TestController {
    @Autowired
    private TestAnnotationRepository testAnnotationRepository;
    @Autowired
    private TestXmlRepository testXmlRepository;

	@GetMapping("/test/chart")
	public String getChart() throws Exception {
		log.info("/test");
		return "test/chartjs";
	}

	@GetMapping("/test/ck")
	public String getCk() throws Exception {
		log.info("/test");
		return "test/ckeditor";
	}

	@GetMapping("/test/billing")
	public String getBilling() throws Exception {
		log.info("/test");
		return "test/billingRef";
	}

	@GetMapping("/test/upload")
	public String getUpload() throws Exception {
		log.info("/test");
		return "test/uploadFile";
	}

	@GetMapping("/test")
	public String getIndex() throws Exception {
		log.info("/test");
		log.info(String.valueOf(testAnnotationRepository.selectCalc()));
		log.info(String.valueOf(testXmlRepository.selectCalc()));
		return "test/test";
	}


	@GetMapping("/test/thymeleaf")
	public String getThymeleaf() throws Exception {
		log.info("/test");
		return "thymeleaf/index";
	}
}
