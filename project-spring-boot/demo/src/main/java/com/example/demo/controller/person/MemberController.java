package com.example.demo.controller.person;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.repository.LoginDao;
import com.example.demo.repository.MemberRepository;
import com.example.demo.service.LoginServiceimpl;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class MemberController {
	@Autowired
	private LoginDao loginDao;//UserDAO bean을 자동으로 주입
    @Autowired
    private MemberRepository memberRepository;
    @Autowired
    private LoginServiceimpl loginServiceimpl;


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
