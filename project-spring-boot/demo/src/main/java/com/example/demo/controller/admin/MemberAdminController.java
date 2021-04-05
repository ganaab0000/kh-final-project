package com.example.demo.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class MemberAdminController {

	// 메인 페이지
	@GetMapping("/admin/member")
	public String index() {
		log.info("/admin/member");
		return "admin/member/index";
	}

}
