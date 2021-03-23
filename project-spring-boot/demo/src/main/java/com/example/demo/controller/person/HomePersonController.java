package com.example.demo.controller.person;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class HomePersonController {

	@GetMapping("/")
	public String getMain() {
		log.info("/");
		return "person/main/index";
	}

}
