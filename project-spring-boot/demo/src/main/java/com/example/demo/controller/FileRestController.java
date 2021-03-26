package com.example.demo.controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
public class FileRestController {

	@PostMapping("/api/file")
	public String upload() {
		log.info("/api/file");

		return "filename";
	}

	@GetMapping("/api/file")
	public String download() {
		log.info("/api/file");

		return "filename";
	}
}
