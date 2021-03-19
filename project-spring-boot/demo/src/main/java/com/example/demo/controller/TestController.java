package com.example.demo.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.repository.LoginDao;
import com.example.demo.repository.MemberRepository;
import com.example.demo.service.LoginServiceimpl;

@Controller
public class TestController {
	@Autowired
	private LoginDao loginDao;//UserDAO bean을 자동으로 주입
    @Autowired
    private MemberRepository memberRepository;
    @Autowired
    private LoginServiceimpl loginServiceimpl;

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping("/")
	public String welcome() throws Exception {
		logger.info("INFO Level 테스트23");

		logger.info("/welcome");
		logger.info(String.valueOf(loginDao.selectCalc()));
		logger.info(memberRepository.findAll().toString());
		logger.info(loginServiceimpl.findAll().toString());
		return "test/welcome";
	}
	@GetMapping("/welcome")
	public String getIndex() {
		System.out.println("/");
		return "test/welcome";
	}
}
