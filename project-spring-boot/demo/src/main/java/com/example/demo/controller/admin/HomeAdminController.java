package com.example.demo.controller.admin;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class HomeAdminController {

	@GetMapping("/admin")
	public String getSignin() {
		log.info("/admin");
		return "admin/index";
	}

}
