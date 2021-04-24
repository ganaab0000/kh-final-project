package com.example.demo.controller.user;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.mail.MailSendException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.example.demo.config.auth.dto.SessionMember;
import com.example.demo.controller.exception.InternalErrorCodeException;
import com.example.demo.domain.Role;
import com.example.demo.domain.dto.ConfirmEmailDto;
import com.example.demo.domain.dto.MemberDto;
import com.example.demo.service.EmailServiceImpl;
import com.example.demo.service.NotificationServiceImpl;
import com.example.demo.service.member.ConfirmEmailServiceImpl;
import com.example.demo.service.member.MemberServiceImpl;
import com.example.demo.service.member.UserDetailsServiceImpl;
import com.example.demo.util.LogUtil;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@AllArgsConstructor
public class MemberController {
	private final static String REDIRECT_PATH = "user/member/redirectWithMessage";
	private final static String REDIRECT_CONFIRM_PATH = "user/member/redirectWithConfirm";
	private LogUtil logUtil;
	private MemberServiceImpl memberServiceImpl;
	private UserDetailsServiceImpl userServiceimpl;
	private EmailServiceImpl emailServiceImpl;
	private ConfirmEmailServiceImpl confirmEmailServiceImpl;
	private NotificationServiceImpl notificationServiceImpl;

	// 메인 페이지
	@GetMapping("/member")
	public String index(HttpServletRequest request) {
		logUtil.defaultLog(request);
		return "user/member/index";
	}

	// 로그인 페이지
	@GetMapping("/member/signin")
	public String getSignin(HttpSession session, HttpServletRequest request) {
		logUtil.defaultLog(request);
		SessionMember member = (SessionMember) session.getAttribute("member");
		if (member != null)
			return "user/member/index";
		return "user/member/signin";
	}

	// 회원 정보 조회 및 수정 페이지
	@GetMapping("/member/edit/info")
	public String getEditMemInfo(HttpSession session, Model model, HttpServletRequest request) {
		logUtil.defaultLog(request);
		SessionMember member = (SessionMember) session.getAttribute("member");
		if (member == null)
			throw new InternalErrorCodeException("101");
		Optional<MemberDto> opMemberDto = memberServiceImpl.findByEmail(member.getEmail());
		if (!opMemberDto.isPresent())
			throw new InternalErrorCodeException("102");
		model.addAttribute("memberDto", opMemberDto.get());
		return "user/member/editMyInfo";
	}

	// 회원 정보 수정 처리
	@PostMapping("/member/edit/info")
	public String postEditMemInfo(MemberDto newMemberDto, HttpSession session, Model model,
			HttpServletRequest request) {
		logUtil.defaultLog(request);
		SessionMember member = (SessionMember) session.getAttribute("member");
		if (member == null)
			throw new InternalErrorCodeException("101");
		Optional<MemberDto> opMemberDto = memberServiceImpl.findByEmail(member.getEmail());
		if (!opMemberDto.isPresent())
			throw new InternalErrorCodeException("102");
		MemberDto oriMemberDto = opMemberDto.get();
		newMemberDto.setId(oriMemberDto.getId());
		System.out.println(newMemberDto.toString());
		int isSuccess = memberServiceImpl.updateById(newMemberDto);
		if (isSuccess == 0)
			throw new InternalErrorCodeException();
		member.setProfileImgUrl(newMemberDto.getProfileImg());
		member.setNickname(newMemberDto.getNickname());
		session.setAttribute("member", member);
		model.addAttribute("url", "/member/edit/info");
		model.addAttribute("message", "성공적으로 수정 되었습니다.");
		return REDIRECT_PATH;
	}

	// 패스워드 변경 페이지
	@GetMapping("/member/change/password")
	public String getChangePwd(HttpServletRequest request) {
		logUtil.defaultLog(request);
		return "user/member/editMyPwd";
	}

	// 패스워드 변경 처리
	@PostMapping("/member/change/password")
	public String postChangePwd(String oriPassword, String newPassword, HttpSession session, Model model,
			HttpServletRequest request) {
		logUtil.defaultLog(request);
		SessionMember member = (SessionMember) session.getAttribute("member");
		if (member == null)
			throw new InternalErrorCodeException("101");
		Optional<MemberDto> opMemberDto = memberServiceImpl.findByEmail(member.getEmail());
		if (!opMemberDto.isPresent())
			throw new InternalErrorCodeException("102");
		MemberDto memberDto = opMemberDto.get();
		boolean isCorrected = userServiceimpl.isCorrectedPwd(memberDto, oriPassword);
		if (!isCorrected)
			throw new InternalErrorCodeException("701");
		memberDto.setPwd(newPassword);
		int isSuccess = userServiceimpl.updatePwdById(memberDto);
		if (isSuccess == 0)
			throw new InternalErrorCodeException();
		model.addAttribute("url", "/member/signout");
		model.addAttribute("message", "성공적으로 변경되었습니다. 다시 로그인하여 주세요.");
		return REDIRECT_PATH;
	}

	// 회원 탈퇴 페이지
	@GetMapping("/member/withdraw")
	public String getWithdraw(HttpServletRequest request) {
		logUtil.defaultLog(request);
		return "user/member/withdraw";
	}

	// 회원 탈퇴 처리
	@PostMapping("/member/withdraw")
	public String postWithdraw(String password, HttpSession session, Model model, HttpServletRequest request) {
		logUtil.defaultLog(request);
		SessionMember member = (SessionMember) session.getAttribute("member");
		if (member == null)
			throw new InternalErrorCodeException("101");
		Optional<MemberDto> opMemberDto = memberServiceImpl.findByEmail(member.getEmail());
		if (!opMemberDto.isPresent())
			throw new InternalErrorCodeException("102");
		MemberDto memberDto = opMemberDto.get();
		boolean isCorrected = userServiceimpl.isCorrectedPwd(memberDto, password);
		if (!isCorrected)
			throw new InternalErrorCodeException("702");
		int isSuccess = memberServiceImpl.updateIsDeleted(memberDto.getId());
		if (isSuccess == 0)
			throw new InternalErrorCodeException();
		model.addAttribute("url", "/member/signout");
		model.addAttribute("message", "성공적으로 탈퇴되었습니다.");
		return REDIRECT_PATH;
	}

	// 회원가입 처리
	@PostMapping("/member/signup")
	public String postSignup(@Valid MemberDto memberDto, Errors errors, Model model, HttpServletRequest request) {
		logUtil.defaultLog(request);
		if (errors.hasErrors()) {
			model.addAttribute("memberDto", memberDto);
			Map<String, String> validatorResult = validateHandling(errors);
			for (String key : validatorResult.keySet()) {
				model.addAttribute(key, validatorResult.get(key));
			}
			model.addAttribute("message", "입력값이 유효하지 않습니다. ");
			return "user/member/signup";
		}
		MemberDto joinMember = userServiceimpl.joinUser(memberDto);
		model.addAttribute("url", "/member/signin");
		String greetings = "회원가입을 축하드립니다! 안녕하세요. " + joinMember.getNickname() + "님. 텀블업 가입을 환영합니다.";
		notificationServiceImpl.save(joinMember.getId(), greetings);
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
	public String getSubmitMail(HttpSession session, Model model, HttpServletRequest request) {
		logUtil.defaultLog(request);
		SessionMember member = (SessionMember) session.getAttribute("member");
		if (member == null)
			throw new InternalErrorCodeException("101");
		sendAuthMail(member.toMemberDto());
		model.addAttribute("url", "/member");
		model.addAttribute("message", "메일이 발송되었습니다. 수신받은 메일을 확인하여 인증을 완료 해주세요.");
		return REDIRECT_PATH;
	}

	// 이메일 인증 확인
	@GetMapping("/member/auth/mail/confirm/id/{id}/key/{key}")
	public String getComfirmMail(@PathVariable String id, @PathVariable String key, HttpSession session, Model model,
			HttpServletRequest request) {
		logUtil.defaultLog(request);
		return postComfirmMail(id, key, session, model, request);
	}

	// 이메일 인증 확인 처리
	@PostMapping("/member/auth/mail/confirm")
	public String postComfirmMail(@PathVariable String id, @PathVariable String key, HttpSession session, Model model,
			HttpServletRequest request) {
		logUtil.defaultLog(request);
		int memberId = Integer.parseInt(id);
		Optional<ConfirmEmailDto> opConfirmEmailDto = confirmEmailServiceImpl.findByMemberIdWhenNotExpired(memberId);
		confirmEmailServiceImpl.deleteByMemberId(memberId);
		if (!opConfirmEmailDto.isPresent() || !opConfirmEmailDto.get().getSecuredKey().equals(key))
			throw new InternalErrorCodeException("300");
		int isSuccess = memberServiceImpl.updateAuthEmailById(memberId);
		if (isSuccess == 0)
			throw new InternalErrorCodeException();
		SessionMember member = (SessionMember) session.getAttribute("member");
		if (member != null)
			updateCurrentAuthRole(session);
		model.addAttribute("url", "/member");
		model.addAttribute("message", "성공적으로 인증되었습니다.");
		return REDIRECT_PATH;
	}

	// 패스워드 찾기 신청
	@GetMapping("/member/find/password/submit")
	public String getSubmitPwd(HttpServletRequest request) {
		logUtil.defaultLog(request);
		return "user/member/findMyPwd";
	}

	// 패스워드 찾기 신청 처리
	@PostMapping("/member/find/password/submit")
	public String postSubmitPwd(String email, Model model, HttpServletRequest request) {
		logUtil.defaultLog(request);
		Optional<MemberDto> opMember = memberServiceImpl.findByEmail(email);
		if (!opMember.isPresent())
			throw new InternalErrorCodeException("102");
		MemberDto member = opMember.get();
		sendInitPwdMail(member);
		model.addAttribute("url", "/member");
		model.addAttribute("message", "메일이 발송되었습니다. 메일을 확인 해주세요.");
		return REDIRECT_PATH;
	}

	// 패스워드 찾기 확인
	@GetMapping("/member/find/password/confirm/id/{id}/key/{key}")
	public String getComfirmPwd(@PathVariable String id, @PathVariable String key, Model model,
			HttpServletRequest request) {
		logUtil.defaultLog(request);
		model.addAttribute("id", id);
		model.addAttribute("key", key);
		return "user/member/findMyPwdConfirm";
	}

	// 패스워드 찾기 확인 처리
	@PostMapping("/member/find/password/confirm")
	public String postComfirmPwd(String id, String key, String password, Model model, HttpServletRequest request) {
		logUtil.defaultLog(request);
		int memberId = Integer.parseInt(id);
		MemberDto memberDto = new MemberDto();
		memberDto.setId(memberId);
		memberDto.setPwd(password);
		Optional<ConfirmEmailDto> opConfirmEmailDto = confirmEmailServiceImpl.findByMemberIdWhenNotExpired(memberId);
		confirmEmailServiceImpl.deleteByMemberId(memberId);
		if (!opConfirmEmailDto.isPresent() || !opConfirmEmailDto.get().getSecuredKey().equals(key))
			throw new InternalErrorCodeException("300");
		int isSuccess = userServiceimpl.updatePwdById(memberDto);
		if (isSuccess == 0)
			throw new InternalErrorCodeException();
		model.addAttribute("url", "/member");
		model.addAttribute("message", "비밀번호가 성공적으로 변경되었습니다.");
		return REDIRECT_PATH;
	}

	// 회원가입 페이지
	@GetMapping("/member/signup")
	public String getSignup(HttpServletRequest request) {
		logUtil.defaultLog(request);
		return "user/member/signup";
	}

	// 리다이렉트 페이지
	@RequestMapping("/member/redirect")
	public String getRedirect(HttpServletRequest request) {
		logUtil.defaultLog(request);
		return REDIRECT_PATH;
	}

	// 리다이렉트 페이지
	@RequestMapping("/member/redirect/confirm")
	public String getRedirectConfirm(HttpServletRequest request) {
		logUtil.defaultLog(request);
		return REDIRECT_CONFIRM_PATH;
	}

	// 접근 거부 페이지
	@GetMapping("/member/denied")
	public String getDenied(HttpServletRequest request) {
		logUtil.defaultLog(request);
		throw new InternalErrorCodeException("403");
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
		// customUser 작성. set Password Null.
		User newUser = new User(oriUser.getUsername(), "", oriUser.isEnabled(), oriUser.isAccountNonExpired(),
				oriUser.isCredentialsNonExpired(), oriUser.isAccountNonLocked(), authorities);
		UsernamePasswordAuthenticationToken newAuth = new UsernamePasswordAuthenticationToken(newUser,
				auth.getCredentials(), authorities);
		SecurityContext context = SecurityContextHolder.getContext();
		context.setAuthentication(newAuth);
		SecurityContextHolder.setContext(context);
		session.setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY,
				SecurityContextHolder.getContext());
	}

	public void sendInitPwdMail(MemberDto member) {
		ConfirmEmailDto confirmEmailDto = confirmEmailServiceImpl.saveNewKeyByMemberId(member.getId());
		String emailConfirmUri = ServletUriComponentsBuilder.fromCurrentContextPath()
				.path("/member/find/password/confirm").path("/id/").path("" + member.getId()).path("/key/")
				.path(confirmEmailDto.getSecuredKey()).toUriString();
		String emailCon = "" + "<p>안녕하세요. #1님. </p>" + "<div>아래 버튼을 클릭하여 비밀번호를 초기화하여 주세요. </div>"
				+ "<a href=\"#2\">비밀번호 초기화</a>";
		emailCon = emailCon.replace("#1", member.getNickname());
		emailCon = emailCon.replace("#2", emailConfirmUri);
		String subject = "[텀블업]  패스워드 초기화";
		emailServiceImpl.sendHtmlMail(member.getEmail(), subject, emailCon);
	}

	public void sendAuthMail(MemberDto member) {
		ConfirmEmailDto confirmEmailDto = confirmEmailServiceImpl.saveNewKeyByMemberId(member.getId());
		String emailConfirmUri = ServletUriComponentsBuilder.fromCurrentContextPath().path("/member/auth/mail/confirm")
				.path("/id/").path("" + member.getId()).path("/key/").path(confirmEmailDto.getSecuredKey())
				.toUriString();
		String emailCon = "" + "<p>안녕하세요. #1님. </p>" + "<div>아래 버튼을 클릭하여 인증을 완료하여 주세요. </div>"
				+ "<a href=\"#2\">이메일 인증</a>";
		emailCon = emailCon.replace("#1", member.getNickname());
		emailCon = emailCon.replace("#2", emailConfirmUri);
		String subject = "[텀블업]  이메일 인증 확인";
		emailServiceImpl.sendHtmlMail(member.getEmail(), subject, emailCon);
	}

}
