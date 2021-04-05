package com.example.demo.controller.user;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSendException;
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
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.example.demo.config.auth.dto.SessionMember;
import com.example.demo.controller.exception.ExceptionController;
import com.example.demo.controller.exception.MsgAndBackException;
import com.example.demo.controller.exception.RoleMemberException;
import com.example.demo.domain.Role;
import com.example.demo.domain.dto.ConfirmEmailDto;
import com.example.demo.domain.dto.MemberDto;
import com.example.demo.service.EmailServiceImpl;
import com.example.demo.service.member.ConfirmEmailServiceImpl;
import com.example.demo.service.member.MemberServiceImpl;
import com.example.demo.service.member.UserDetailsServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@AllArgsConstructor
public class MemberController {
    private final static String REDIRECT_PATH = "user/member/redirectWithMessage";
    private MemberServiceImpl memberServiceImpl;
	private UserDetailsServiceImpl userServiceimpl;
	private EmailServiceImpl emailServiceImpl;
    private ConfirmEmailServiceImpl confirmEmailServiceImpl;

	// 메인 페이지
	@GetMapping("/member")
	public String index() {
		log.info("/member");
		return "user/member/index";
	}

	// 내 정보 페이지
	@GetMapping("/member/info")
	public String getMemInfo(HttpSession session, Model model) {
		log.info("/member/info");
		SessionMember member = (SessionMember) session.getAttribute("member");
		if (member == null) {
	        throw new RoleMemberException("/member/edit/info");
		}
		Optional<MemberDto> opMemberDto = memberServiceImpl.findByEmail(member.getEmail());
		model.addAttribute("memberDto", opMemberDto.get());
		System.out.println(opMemberDto.get().toString());
		return "user/member/myinfo";
	}

	//////////
	// 회원 정보 수정 페이지
	@GetMapping("/member/edit/info")
	public String getEditMemInfo(HttpSession session, Model model) {
		log.info("/member/edit/info");
		SessionMember member = (SessionMember) session.getAttribute("member");
		if (member == null) {
	        throw new RoleMemberException("/member/edit/info");
		}
		Optional<MemberDto> opMemberDto = memberServiceImpl.findByEmail(member.getEmail());
		model.addAttribute("memberDto", opMemberDto.get());
		System.out.println(opMemberDto.get().toString());
		return "user/member/editMyinfo";
	}
	// 회원 정보 수정 처리
	@PostMapping("/member/edit/info")
	public String postEditMemInfo() {
		log.info("/member/edit/info");
		return "user/member/editMyinfo";
	}

	// 패스워드 변경 페이지
	@GetMapping("/member/change/password")
	public String getChangePwd() {
		log.info("/member/confirm/mail");
		return "user/member/index";
	}
	// 패스워드 변경 처리
	@PostMapping("/member/change/password")
	public String postChangePwd(String oriPassword, String newPassword) {
		log.info("/member/change/password");

		//if(oriPassword is Valid)
		//postComfirmPwd(id, key, password, model)
		return "user/member/index";
	}
	// 회원 탈퇴 페이지
	@GetMapping("/member/withdraw")
	public String getWithdraw() {
		log.info("/member/withdraw");
		return "user/member/index";
	}
	// 회원 탈퇴 처리
	@PostMapping("/member/withdraw")
	public String postWithdraw() {
		log.info("/member/withdraw");
		return "user/member/index";
	}

	// 회원가입 처리
	@PostMapping("/member/signup")
	public String postSignup(@Valid MemberDto memberDto, Errors errors, Model model, HttpServletRequest request) {
		log.info(String.format("%s : %s ", request.getMethod(), request.getRequestURI()));
        if (errors.hasErrors()) {
            model.addAttribute("memberDto", memberDto);
            Map<String, String> validatorResult = validateHandling(errors);
            for (String key : validatorResult.keySet()) {
                model.addAttribute(key, validatorResult.get(key));
            }
    		model.addAttribute("message", "입력값이 유효하지 않습니다. ");
    		return "user/member/signup";
//			throw new MsgAndBackException("입력값이 유효하지 않습니다. " + +);
        }
		MemberDto joinMember = userServiceimpl.joinUser(memberDto);
        model.addAttribute("url", "/member/signin");
		try {
			sendAuthMail(joinMember);
		} catch (MailSendException e) {
			log.warn("/member/signup : " + joinMember.toString() + e.getMessage());
			model.addAttribute("message", "가입을 완료하였습니다. 인증 메일 전송에 실패하였습니다. 유효한 메일 주소인지 확인 부탁 드립니다.");
			return REDIRECT_PATH;
		}
		model.addAttribute("message", "가입을 완료 하였습니다. 메일을 확인하여 인증을 완료해 주세요.");
		return REDIRECT_PATH;
	}

	// 이메일 인증 신청
	@GetMapping("/member/auth/mail/submit")
	public String getSubmitMail(HttpSession session, Model model) {
		log.info("/member/auth/mail/submit");
		SessionMember member = (SessionMember) session.getAttribute("member");
		if (member == null) {
	        throw new RoleMemberException("/member");
		}
		sendAuthMail(member.toMemberDto());
        model.addAttribute("url", "/member");
		model.addAttribute("message", "메일이 발송되었습니다. 수신받은 메일을 확인하여 인증을 완료 해주세요.");
		return REDIRECT_PATH;
	}
	// 이메일 인증 확인
	@GetMapping("/member/auth/mail/confirm/key/{key:.+}")
	public String getComfirmMail(@PathVariable String key, HttpSession session, Model model) {
		log.info("/member/auth/mail/confirm");
		SessionMember member = (SessionMember) session.getAttribute("member");
		if (member == null) {
	        throw new RoleMemberException("/member");
		}
		Optional<ConfirmEmailDto> opConfirmEmailDto = confirmEmailServiceImpl.findByMemberIdWhenNotExpired(member.getId());
		confirmEmailServiceImpl.deleteByMemberId(member.getId());
		if(!opConfirmEmailDto.isPresent()
		|| !opConfirmEmailDto.get().getSecuredKey().equals(key)) {
			throw new MsgAndBackException("유효한 키가 존재하지 않습니다. 다시 시도해주세요.");
		}
		int isSuccess = memberServiceImpl.updateAuthEmailById(member.getId());
		if(isSuccess == 0) {
			throw new MsgAndBackException("인증이 실패하였습니다. 다시 시도해주세요.");
		}
		updateCurrentAuthRole(session);
        model.addAttribute("url", "/member");
    	model.addAttribute("message", "성공적으로 인증되었습니다.");
		return REDIRECT_PATH;
	}

	// 패스워드 찾기 신청
	@GetMapping("/member/find/password/submit")
	public String getSubmitPwd() {
		log.info("/member/find/password/submit");
		return "user/member/findMyPwd";
	}
	// 패스워드 찾기 신청 처리
	@PostMapping("/member/find/password/submit")
	public String postSubmitPwd(String email, Model model) {
		log.info("/member/find/password/submit");
	    Optional<MemberDto> opMember = memberServiceImpl.findByEmail(email);
	    if(!opMember.isPresent()) {
			throw new MsgAndBackException("해당 아이디로 가입되어 있지 않습니다.");
	    }
	    MemberDto member = opMember.get();
		sendInitPwdMail(member);
        model.addAttribute("url", "/member");
		model.addAttribute("message", "메일이 발송되었습니다. 메일을 확인 해주세요.");
		return REDIRECT_PATH;
	}
	// 패스워드 찾기 확인
	@GetMapping("/member/find/password/confirm/id/{id}/key/{key:.+}")
	public String getComfirmPwd(@PathVariable String id, @PathVariable String key, Model model) {
		log.info("/member/find/password/confirm/id/{id}/key/{key:.+}");
        model.addAttribute("id", id);
        model.addAttribute("key", key);
		return "user/member/findMyPwdConfirm";
	}
	// 패스워드 찾기 확인 처리
	@PostMapping("/member/find/password/confirm")
	public String postComfirmPwd(String id, String key, String password, Model model) {
		log.info("/member/find/password/confirm");
		int memberId = Integer.parseInt(id);
		MemberDto memberDto = new MemberDto();
		memberDto.setId(memberId);
		memberDto.setPwd(password);
		Optional<ConfirmEmailDto> opConfirmEmailDto = confirmEmailServiceImpl.findByMemberIdWhenNotExpired(memberId);
		confirmEmailServiceImpl.deleteByMemberId(memberId);
		if(!opConfirmEmailDto.isPresent()
		|| !opConfirmEmailDto.get().getSecuredKey().equals(key)) {
			throw new MsgAndBackException("유효한 키가 존재하지 않습니다. 다시 시도해주세요.");
		}
		int isSuccess = userServiceimpl.updatePwdById(memberDto);
		if(isSuccess == 0) {
			throw new MsgAndBackException("비밀번호 변경에 실패하였습니다. 다시 시도해주세요.");
		}
        model.addAttribute("url", "/member");
		model.addAttribute("message", "비밀번호가 성공적으로 변경되었습니다.");
		return REDIRECT_PATH;
	}

	// 회원가입 페이지
	@GetMapping("/member/signup")
	public String getSignup() {
		log.info("/member/signup");
		return "user/member/signup";
	}
	// 로그인 페이지
	@GetMapping("/member/signin")
	public String getSignin() {
		log.info("/member/signup");
		return "user/member/signin";
	}
	// 로그인 결과 페이지
	@GetMapping("/member/signin/result")
	public String getSigninResult() {
		log.info("/member/signin/result");
		return "user/member/signinSuccess";
	}
	// 로그인 결과 페이지
	@GetMapping("/member/signin/result/fail")
	public String getSigninResultFail() {
		log.info("/member/signin/result/fail");
		return "user/member/signinFail";
	}
	// 로그인 결과 페이지
	@GetMapping("/member/signin/result/fail/naver")
	public String getSigninResultFailNaver(HttpSession session) {
		log.info("/member/signin/result/fail/naver");
		return "user/member/signinFailInNaver";
	}
	// 로그아웃 결과 페이지
	@GetMapping("/member/signout/result")
	public String getSignout() {
		log.info("/member/signout/result");
		return "user/member/signoutSuccess";
	}
	// 리다이렉트 페이지
	@GetMapping("/member/redirect")
	public String getRedirectParm(String url,String message, Model model) {
		log.info("/member/redirect");
		model.addAttribute("url", url);
		model.addAttribute("message", message);
		return REDIRECT_PATH;
	}
	// 접근 거부 페이지
	@GetMapping("/member/denied")
	public String getDenied() {
		log.info("/member/denied");
		return "user/member/denied";
	}

    public Map<String, String> validateHandling(Errors errors) {
        Map<String, String> validatorResult = new HashMap<>();
        for (FieldError error : errors.getFieldErrors()) {
            String validKeyName = String.format("valid_%s", error.getField());
            validatorResult.put(validKeyName, error.getDefaultMessage());
        }
        return validatorResult;
    }

	public void updateCurrentAuthRole(HttpSession session) {
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
	}
	public void sendInitPwdMail(MemberDto member) {
		ConfirmEmailDto confirmEmailDto = confirmEmailServiceImpl.saveNewKeyByMemberId(member.getId());
		String emailConfirmUri = ServletUriComponentsBuilder.fromCurrentContextPath().path("/member/find/password/confirm")
				.path("/id/")
				.path("" + member.getId())
				.path("/key/")
				.path(confirmEmailDto.getSecuredKey())
				.toUriString();
        String emailCon=""
        		+ "<p>안녕하세요. "+ member.getNickname() +"님. </p>"
        		+ "<div>아래 버튼을 클릭하여 비밀번호를 초기화하여 주세요. </div>"
        		+ "<a href=\""
        		+ emailConfirmUri
        		+ "\">비밀번호 초기화</a>";
        String subject = "[텀블업]  패스워드 초기화";
		emailServiceImpl.sendHtmlMail(member.getEmail(), subject, emailCon);
	}

	public void sendAuthMail(MemberDto member) {
		ConfirmEmailDto confirmEmailDto = confirmEmailServiceImpl.saveNewKeyByMemberId(member.getId());
		String emailConfirmUri = ServletUriComponentsBuilder.fromCurrentContextPath().path("/member/auth/mail/confirm")
				.path("/key/")
				.path(confirmEmailDto.getSecuredKey())
				.toUriString();
        String emailCon=""
        		+ "<p>안녕하세요. "+ member.getNickname() +"님. </p>"
        		+ "<div>아래 버튼을 클릭하여 인증을 완료하여 주세요. </div>"
        		+ "<a href=\""
        		+ emailConfirmUri
        		+ "\">이메일 인증</a>";
        String subject = "[텀블업]  이메일 인증 확인";
		emailServiceImpl.sendHtmlMail(member.getEmail(), subject, emailCon);
	}

}
