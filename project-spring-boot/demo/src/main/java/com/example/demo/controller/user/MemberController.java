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
//    @Autowired
//    private ServletContext servletContext;

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

//Model model,
//    	String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
//    	naverAuthUrl += "&auth_type=reprompt";
//    	System.out.println(naverAuthUrl);
//    	model.addAttribute("url", naverAuthUrl);

//    	return "redirect:"+naverAuthUrl;
		return "user/member/signinFailInNaver";
	}

//	@GetMapping("/member/redirect/{message}/{url}")
//	public String dispRedirect(@PathVariable String url, @PathVariable String message, Model model) {
//		model.addAttribute("url", url);
//		model.addAttribute("message", message);
//		return "user/member/redirectWithMessage";
//	}

	@GetMapping("/member/redirect")
	public String dispRedirectParm(String url,String message, Model model) {
		model.addAttribute("url", url);
		model.addAttribute("message", message);
		return "user/member/redirectWithMessage";
	}

//	@GetMapping("/member/test")
//	public String dispsigninResultFailNaver() throws UnsupportedEncodingException {
//
////Model model,
////    	String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
////    	naverAuthUrl += "&auth_type=reprompt";
////    	System.out.println(naverAuthUrl);
////    	model.addAttribute("url", "http://naver.com");
////    	model.addAttribute("message", "Redirect Test ㅎㅎ");
////    	URL message = new URL("http://naver.com");
//
//        System.out.println("ss");
////        System.out.println(servletContext.getContextPath());
//    	String url = URLEncoder.encode("http://naver.com", "UTF-8");
//    	String message = URLEncoder.encode("Redirect Test ㅎㅎ", "UTF-8");
//    	System.out.println(message.toString()+url.toString());
//    	return "redirect:/member/redirect?message="+ message +"&url="+ url;
////    	return "user/member/redirectWithMessage";
//	}

//  //네이버 로그인 성공시 callback호출 메소드
//  	@RequestMapping(value = "/member/callback/naver", method = { RequestMethod.GET, RequestMethod.POST })
//  	public @ResponseBody String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
//  			throws IOException {
//
//  		System.out.println("여기는 callback");
//  		OAuth2AccessToken oauthToken;
//  		oauthToken = naverLoginBO.getAccessToken(session, code, state);
//  //1. 로그인 사용자 정보를 읽어온다.
//  		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
//  		/**
//  		 * apiResult json 구조 {"resultcode":"00", "message":"success",
//  		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
//  		 **/
//  //2. String형식인 apiResult를 json형태로 바꿈
////  		JSONParser parser = new JSONParser();
////  		Object obj = parser.parse(apiResult);
////  		JSONObject jsonObj = (JSONObject) obj;
////  //3. 데이터 파싱
////  //Top레벨 단계 _response 파싱
////  		JSONObject response_obj = (JSONObject) jsonObj.get("response");
////  //response의 nickname값 파싱
////  		String nickname = (String) response_obj.get("nickname");
////  		System.out.println(nickname);
////  //4.파싱 닉네임 세션으로 저장
////  		session.setAttribute("sessionId", nickname); // 세션 생성
//  		model.addAttribute("result", apiResult);
////  		return "login";
//  		return apiResult;
//  	}

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
