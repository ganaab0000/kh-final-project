package com.example.demo.controller.person;


import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
public class FileRestController {

	@PostMapping("/api/file")
	public String getString() {
		log.info("/api/file");

		return "filename";
	}

}
