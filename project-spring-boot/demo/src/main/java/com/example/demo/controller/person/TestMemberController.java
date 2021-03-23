package com.example.demo.controller.person;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.service.UserDetailsServiceImpl;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class TestMemberController {
	@Autowired
	private UserDetailsServiceImpl loginServiceimpl;

//	@GetMapping("/member/signin")
//	public String getSignin() {
//		log.info("/member/signin");
//		return "person/member/signin";
//	}
//	@PostMapping("/member/signin")
//	public String postSignin() {
//		log.info("/member/signin");
//		return "person/member/signin";
//	}
//
//	@GetMapping("/member/signup")
//	public String getSignup() {
//		log.info("/member/signup");
//		return "person/member/signup";
//	}
//	@PostMapping("/member/signup")
//	public String postSignup() {
//		log.info("/member/signup");
//		return "person/member/signup";
//	}
//
//	@GetMapping("/member/signout")
//	public String getSignout() {
//		log.info("/member/signout");
//		return "person/member/signout";
//	}
}
