package com.example.demo.controller.user;

import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.domain.dto.MemberDto;
import com.example.demo.service.EmailServiceImpl;
import com.example.demo.service.member.UserDetailsServiceImpl;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class MemberController {
	@Autowired
	private UserDetailsServiceImpl userServiceimpl;
	@Autowired
	private EmailServiceImpl emailServiceImpl;

	// 메인 페이지
	@GetMapping("/member")
	public String index() {
		log.info("/member");
		return "user/member/index";
	}

	// 회원가입 페이지
	@GetMapping("/member/confirm/mail")
	public String dispComfirmMail(@AuthenticationPrincipal User user) {
		log.info("/member/confirm/mail");
		if (user != null) {
			log.info(user.getUsername());
			log.info(user.getPassword());
			log.info(user.getAuthorities());
		}
		emailServiceImpl.sendSimpleMessage("aaagmail.com", "aaaba", "text22");
		return "user/member/index";
	}
	// 회원가입 페이지
	@GetMapping("/member/find/password")
	public String dispFindPw(String email) {
		log.info("/member/find/password");
		emailServiceImpl.sendSimpleMessage("aaagmail.com", "aaaba", "text22");
		return "user/member/index";
	}

	// 회원가입 페이지
	@GetMapping("/member/signup")
	public String dispSignup() {
		return "user/member/signup";
	}

	// 회원가입 처리
	@PostMapping("/member/signup")
	public String execSignup(MemberDto memberDto) {
		log.info("/member/signup");
		log.info(memberDto.toString());
		userServiceimpl.joinUser(memberDto);

		return "redirect:/member/signin";
	}

	// 로그인 페이지
	@GetMapping("/member/signin")
	public String dispsignin() {
		return "user/member/signin";
	}

	// 로그인 결과 페이지
	@GetMapping("/member/signin/result")
	public String dispsigninResult() {
		return "user/member/signinSuccess";
	}

	// 로그인 결과 페이지
	@GetMapping("/member/signin/result/fail")
	public String dispsigninResultFail() {
		return "user/member/signinFail";
	}

	// 로그인 결과 페이지
	@GetMapping("/member/signin/result/fail/naver")
	public String dispsigninResultFailNaver(HttpSession session) {
		return "user/member/signinFailInNaver";
	}

	@GetMapping("/member/redirect")
	public String dispRedirectParm(String url,String message, Model model) {
		model.addAttribute("url", url);
		model.addAttribute("message", message);
		return "user/member/redirectWithMessage";
	}

	// 로그아웃 결과 페이지
	@GetMapping("/member/signout/result")
	public String dispsignout() {
		return "user/member/signoutSuccess";
	}

	// 접근 거부 페이지
	@GetMapping("/member/denied")
	public String dispDenied() {
		return "user/member/denied";
	}

	// 내 정보 페이지
	@GetMapping("/member/info")
	public String dispMyInfo() {
		return "user/member/myinfo";
	}

}
