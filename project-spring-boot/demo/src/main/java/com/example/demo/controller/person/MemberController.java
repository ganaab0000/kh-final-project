package com.example.demo.controller.person;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.Principal;
import java.security.SecureRandom;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.domain.dto.MemberDto;
import com.example.demo.repository.TestAnnotationRepository;
import com.example.demo.repository.TestXmlRepository;
import com.example.demo.service.NaverLoginBO;
import com.example.demo.service.UserDetailsServiceImpl;
import com.github.scribejava.core.model.OAuth2AccessToken;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class MemberController {
	@Autowired
    private UserDetailsServiceImpl memberServiceimpl;
	@Autowired
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

    // 메인 페이지
    @GetMapping("/member")
    public String index(@AuthenticationPrincipal User user) {
    	if(user != null) {
    		log.info(user.getUsername());
    		log.info(user.getPassword());
    		log.info(user.getAuthorities());
    	}
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

    // 로그인 결과 페이지
    @GetMapping("/member/signin/result/fail")
    public String dispsigninResultFail() {
        return "person/member/signinFail";
    }

    // 로그인 결과 페이지
    @GetMapping("/member/signin/result/fail/naver")
    public String dispsigninResultFailNaver(Model model, HttpSession session) {


    	String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
    	naverAuthUrl += "&auth_type=reprompt";
    	System.out.println(naverAuthUrl);
    	model.addAttribute("url", naverAuthUrl);

//    	return "redirect:"+naverAuthUrl;
        return "person/member/signinFailByNaver";
    }

  //네이버 로그인 성공시 callback호출 메소드
  	@RequestMapping(value = "/member/callback/naver", method = { RequestMethod.GET, RequestMethod.POST })
  	public @ResponseBody String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
  			throws IOException {

  		System.out.println("여기는 callback");
  		OAuth2AccessToken oauthToken;
  		oauthToken = naverLoginBO.getAccessToken(session, code, state);
  //1. 로그인 사용자 정보를 읽어온다.
  		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
  		/**
  		 * apiResult json 구조 {"resultcode":"00", "message":"success",
  		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
  		 **/
  //2. String형식인 apiResult를 json형태로 바꿈
//  		JSONParser parser = new JSONParser();
//  		Object obj = parser.parse(apiResult);
//  		JSONObject jsonObj = (JSONObject) obj;
//  //3. 데이터 파싱
//  //Top레벨 단계 _response 파싱
//  		JSONObject response_obj = (JSONObject) jsonObj.get("response");
//  //response의 nickname값 파싱
//  		String nickname = (String) response_obj.get("nickname");
//  		System.out.println(nickname);
//  //4.파싱 닉네임 세션으로 저장
//  		session.setAttribute("sessionId", nickname); // 세션 생성
  		model.addAttribute("result", apiResult);
//  		return "login";
  		return apiResult;
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
