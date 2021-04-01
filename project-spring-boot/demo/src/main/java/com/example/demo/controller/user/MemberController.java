package com.example.demo.controller.user;

import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.Optional;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.example.demo.config.auth.dto.SessionMember;
import com.example.demo.domain.Role;
import com.example.demo.domain.dto.ConfirmEmailDto;
import com.example.demo.domain.dto.MemberDto;
import com.example.demo.service.EmailServiceImpl;
import com.example.demo.service.member.ConfirmEmailServiceImpl;
import com.example.demo.service.member.MemberServiceImpl;
import com.example.demo.service.member.UserDetailsServiceImpl;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class MemberController {
	@Autowired
	private UserDetailsServiceImpl userServiceimpl;
	@Autowired
	private EmailServiceImpl emailServiceImpl;
    @Autowired
    private ConfirmEmailServiceImpl confirmEmailServiceImpl;
    @Autowired
    private MemberServiceImpl memberServiceImpl;
    @Autowired
    private ConfirmEmailDto confirmEmailDto;

	// 메인 페이지
	@GetMapping("/member")
	public String index() {
		log.info("/member");
		return "user/member/index";
	}

	// 내 정보 페이지
	@GetMapping("/member/info")
	public String getMemInfo() {
		log.info("/member/info");
		return "user/member/myinfo";
	}

	//////////
	// 회원 정보 수정 페이지
	@GetMapping("/member/edit/info")
	public String getEditMemInfo(@AuthenticationPrincipal User user) {
		log.info("/member/edit/info");
		if (user != null) {
			log.info(user.getUsername());
			log.info(user.getPassword());
			log.info(user.getAuthorities());
		}
		return "user/member/index";
	}
	// 회원 정보 수정 처리
	@PostMapping("/member/edit/info")
	public String postEditMemInfo(@AuthenticationPrincipal User user) {
		log.info("/member/edit/info");
		if (user != null) {
			log.info(user.getUsername());
			log.info(user.getPassword());
			log.info(user.getAuthorities());
		}
		return "user/member/index";
	}

	// 이메일 인증 신청
	@GetMapping("/member/auth/mail/submit")
	public String getSubmitMail(HttpSession session, Model model) {
		log.info("/member/auth/mail/submit");
		SessionMember member = (SessionMember) session.getAttribute("member");
		if (member == null) {
	        model.addAttribute("url", "/member");
			model.addAttribute("message", "로그인이 필요합니다. 다시 로그인하여 주세요.");
			return "user/member/redirectWithMessage";
		}
		log.info(member.getEmail());
		log.info(member.getNickname());
		int EXPIRED_MINUTES = 30; //만료시간(분) //설정파일로 설정하기.
	    Calendar calendar = Calendar.getInstance();
	    calendar.setTime(new Date());
	    calendar.add(Calendar.MINUTE, EXPIRED_MINUTES);

		int memberId = member.getId();
		Date dateExpired = calendar.getTime();
		Random rn = new Random();
		String securedKey = ""+ rn.nextLong(); //임시 구현. 수정필요.
		confirmEmailDto.setMemberId(memberId);
		confirmEmailDto.setDateExpired(dateExpired);
		confirmEmailDto.setSecuredKey(securedKey);
		confirmEmailServiceImpl.deleteByMemberId(memberId);
		confirmEmailServiceImpl.save(confirmEmailDto);

		String emailConfirmUri = ServletUriComponentsBuilder.fromCurrentContextPath().path("/member/auth/mail/confirm")
				.path("/key/")
				.path(securedKey)
				.toUriString();
        String emailCon="<p>안녕하세요. "+ member.getNickname() +"님. </p>"
        		+ "<div>아래 버튼을 클릭하여 인증을 완료하여 주세요. </div>"
        		+ "<a href=\""
        		+ emailConfirmUri
        		+ "\">이메일 인증</a>";

		emailServiceImpl.sendHtmlMail(member.getEmail(), "[텀블업] 이메일 인증 확인", emailCon);
//        emailServiceImpl.sendHtmlMail("testaa@gmail.com", "[텀블업] 이메일 인증 확인", emailCon);

        model.addAttribute("url", "/member");
		model.addAttribute("message", "이메일이 발송되었습니다. 수신받은 메일을 확인하여 인증을 완료 해주세요.");
		return "user/member/redirectWithMessage";
	}
	// 이메일 인증 확인
	@GetMapping("/member/auth/mail/confirm/key/{key}")
	public String getComfirmMail(@PathVariable String key, HttpSession session, Model model, @AuthenticationPrincipal User user) {
		log.info("/member/auth/mail/confirm");
		SessionMember member = (SessionMember) session.getAttribute("member");
		if (member == null) {
	        model.addAttribute("url", "/member");
			model.addAttribute("message", "로그인이 필요합니다. 로그인하여 주세요.");
			return "user/member/redirectWithMessage";
		}
		log.info(member.getId());
		log.info(key);
		int memberId = member.getId();
		Optional<ConfirmEmailDto> opConfirmEmailDto = confirmEmailServiceImpl.findByMemberIdWhenNotExpired(memberId);
		int isSuccess = 0;
		if(opConfirmEmailDto.isPresent()) {
			isSuccess = memberServiceImpl.updateAuthEmailById(memberId);
		}
		confirmEmailServiceImpl.deleteByMemberId(memberId);

        model.addAttribute("url", "/member");
        if(isSuccess == 1) {
			// update the current Authentication
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			HashSet<GrantedAuthority> authorities = new HashSet<GrantedAuthority>(auth.getAuthorities());
			authorities.add(new SimpleGrantedAuthority(Role.MEMBER_MAIL.getValue()));
			User oriUser = (User) auth.getPrincipal();
			//customUser 작성. set Password Null.
			User newUser = new User(oriUser.getUsername(), "", oriUser.isEnabled(), oriUser.isAccountNonExpired(),
					oriUser.isCredentialsNonExpired(), oriUser.isAccountNonLocked(), authorities);
			UsernamePasswordAuthenticationToken newAuth = new UsernamePasswordAuthenticationToken(newUser, auth.getCredentials(), authorities);
	        SecurityContext context = SecurityContextHolder.getContext();
	        context.setAuthentication(newAuth);
	        SecurityContextHolder.setContext(context);
	        session.setAttribute(
					  HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY,
					  SecurityContextHolder.getContext()
			);
        	model.addAttribute("message", "성공적으로 인증되었습니다. ");
        }else {
        	model.addAttribute("message", "인증이 실패하였습니다. 다시 시도해주세요.");
        }
		return "user/member/redirectWithMessage";
	}

	// 패스워드 찾기 신청
	@GetMapping("/member/find/password/submit")
	public String getSubmitPwd(@AuthenticationPrincipal User user) {
		log.info("/member/confirm/mail");
		if (user != null) {
			log.info(user.getUsername());
			log.info(user.getPassword());
			log.info(user.getAuthorities());
		}
		emailServiceImpl.sendSimpleMessage("aaagmail.com", "aaaba", "text22");
		return "user/member/index";
	}
	// 패스워드 찾기 확인
	@GetMapping("/member/find/password/confirm")
	public String dispComfirmPwd(@AuthenticationPrincipal User user) {
		log.info("/member/confirm/mail");
		if (user != null) {
			log.info(user.getUsername());
			log.info(user.getPassword());
			log.info(user.getAuthorities());
		}
		return "user/member/index";
	}
	// 패스워드 변경
	@GetMapping("/member/change/password")
	public String dispChangePwd(@AuthenticationPrincipal User user) {
		log.info("/member/confirm/mail");
		if (user != null) {
			log.info(user.getUsername());
			log.info(user.getPassword());
			log.info(user.getAuthorities());
		}
		return "user/member/index";
	}
	// 회원 탈퇴 페이지
	@GetMapping("/member/withdraw")
	public String getWithdraw() {
		return "user/member/index";
	}
	// 회원 탈퇴 처리
	@PostMapping("/member/withdraw")
	public String postWithdraw() {
		return "user/member/index";
	}

	//////////



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

}
