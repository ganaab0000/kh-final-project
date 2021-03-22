package com.example.demo.controller.person;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.service.MemberServiceimpl;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class MemberController {
	@Autowired
	private MemberServiceimpl loginServiceimpl;

	@GetMapping("/member/signin")
	public String getSignin() {
		log.info("/member/signup");
		return "member/signup";
	}
	@GetMapping("/member/signup")
	public String getSignup() {
		log.info("/member/signin");
		return "member/signin";
	}
}
