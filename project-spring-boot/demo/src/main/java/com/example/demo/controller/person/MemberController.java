package com.example.demo.controller.person;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.domain.dto.MemberDto;
import com.example.demo.repository.TestAnnotationRepository;
import com.example.demo.repository.TestXmlRepository;
import com.example.demo.service.MemberServiceImpl;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class MemberController {
	@Autowired
    private MemberServiceImpl memberServiceimpl;

    // 메인 페이지
    @GetMapping("/member")
    public String index() {
        return "person/member/index";
    }

    // 회원가입 페이지
    @GetMapping("/member/signup")
    public String dispSignup() {
        return "person/member/signup";
    }

    // 회원가입 처리
    @PostMapping("/member/signup")
    public String execSignup(MemberDto memberDto) {
    	log.info("/member/signup");
    	log.info(memberDto.toString());
        memberServiceimpl.joinUser(memberDto);

        return "redirect:/member/signin";
    }

    // 로그인 페이지
    @GetMapping("/member/signin")
    public String dispsignin() {
        return "person/member/signin";
    }

    // 로그인 결과 페이지
    @GetMapping("/member/signin/result")
    public String dispsigninResult() {
        return "person/member/signinSuccess";
    }

    // 로그아웃 결과 페이지
    @GetMapping("/member/signout/result")
    public String dispsignout() {
        return "person/member/signoutSuccess";
    }

    // 접근 거부 페이지
    @GetMapping("/member/denied")
    public String dispDenied() {
        return "person/member/denied";
    }

    // 내 정보 페이지
    @GetMapping("/member/info")
    public String dispMyInfo() {
        return "person/member/myinfo";
    }

}
