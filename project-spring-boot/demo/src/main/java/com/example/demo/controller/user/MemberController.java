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

	// ?????? ?????????
	@GetMapping("/member")
	public String index(HttpServletRequest request) {
		logUtil.defaultLog(request);
		return "user/member/index";
	}

	// ????????? ?????????
	@GetMapping("/member/signin")
	public String getSignin(HttpSession session, HttpServletRequest request) {
		logUtil.defaultLog(request);
		SessionMember member = (SessionMember) session.getAttribute("member");
		if (member != null)
			return "user/member/index";
		return "user/member/signin";
	}

	// ?????? ?????? ?????? ??? ?????? ?????????
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

	// ?????? ?????? ?????? ??????
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
		model.addAttribute("message", "??????????????? ?????? ???????????????.");
		return REDIRECT_PATH;
	}

	// ???????????? ?????? ?????????
	@GetMapping("/member/change/password")
	public String getChangePwd(HttpServletRequest request) {
		logUtil.defaultLog(request);
		return "user/member/editMyPwd";
	}

	// ???????????? ?????? ??????
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
		model.addAttribute("message", "??????????????? ?????????????????????. ?????? ??????????????? ?????????.");
		return REDIRECT_PATH;
	}

	// ?????? ?????? ?????????
	@GetMapping("/member/withdraw")
	public String getWithdraw(HttpServletRequest request) {
		logUtil.defaultLog(request);
		return "user/member/withdraw";
	}

	// ?????? ?????? ??????
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
		model.addAttribute("message", "??????????????? ?????????????????????.");
		return REDIRECT_PATH;
	}

	// ???????????? ??????
	@PostMapping("/member/signup")
	public String postSignup(@Valid MemberDto memberDto, Errors errors, Model model, HttpServletRequest request) {
		logUtil.defaultLog(request);
		if (errors.hasErrors()) {
			model.addAttribute("memberDto", memberDto);
			Map<String, String> validatorResult = validateHandling(errors);
			for (String key : validatorResult.keySet()) {
				model.addAttribute(key, validatorResult.get(key));
			}
			model.addAttribute("message", "???????????? ???????????? ????????????. ");
			return "user/member/signup";
		}
		MemberDto joinMember = userServiceimpl.joinUser(memberDto);
		model.addAttribute("url", "/member/signin");
		String greetings = "??????????????? ??????????????????! ???????????????. " + joinMember.getNickname() + "???. ????????? ????????? ???????????????.";
		notificationServiceImpl.save(joinMember.getId(), greetings);
		try {
			sendAuthMail(joinMember);
		} catch (MailSendException e) {
			log.warn("/member/signup : " + joinMember.toString() + e.getMessage());
			model.addAttribute("message", "????????? ?????????????????????. ?????? ?????? ????????? ?????????????????????. ????????? ?????? ???????????? ?????? ?????? ????????????.");
			return REDIRECT_PATH;
		}
		model.addAttribute("message", "????????? ?????? ???????????????. ????????? ???????????? ????????? ????????? ?????????.");
		return REDIRECT_PATH;
	}

	// ????????? ?????? ??????
	@GetMapping("/member/auth/mail/submit")
	public String getSubmitMail(HttpSession session, Model model, HttpServletRequest request) {
		logUtil.defaultLog(request);
		SessionMember member = (SessionMember) session.getAttribute("member");
		if (member == null)
			throw new InternalErrorCodeException("101");
		sendAuthMail(member.toMemberDto());
		model.addAttribute("url", "/member");
		model.addAttribute("message", "????????? ?????????????????????. ???????????? ????????? ???????????? ????????? ?????? ????????????.");
		return REDIRECT_PATH;
	}

	// ????????? ?????? ??????
	@GetMapping("/member/auth/mail/confirm/id/{id}/key/{key}")
	public String getComfirmMail(@PathVariable String id, @PathVariable String key, HttpSession session, Model model,
			HttpServletRequest request) {
		logUtil.defaultLog(request);
		return postComfirmMail(id, key, session, model, request);
	}

	// ????????? ?????? ?????? ??????
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
		model.addAttribute("message", "??????????????? ?????????????????????.");
		return REDIRECT_PATH;
	}

	// ???????????? ?????? ??????
	@GetMapping("/member/find/password/submit")
	public String getSubmitPwd(HttpServletRequest request) {
		logUtil.defaultLog(request);
		return "user/member/findMyPwd";
	}

	// ???????????? ?????? ?????? ??????
	@PostMapping("/member/find/password/submit")
	public String postSubmitPwd(String email, Model model, HttpServletRequest request) {
		logUtil.defaultLog(request);
		Optional<MemberDto> opMember = memberServiceImpl.findByEmail(email);
		if (!opMember.isPresent())
			throw new InternalErrorCodeException("102");
		MemberDto member = opMember.get();
		sendInitPwdMail(member);
		model.addAttribute("url", "/member");
		model.addAttribute("message", "????????? ?????????????????????. ????????? ?????? ????????????.");
		return REDIRECT_PATH;
	}

	// ???????????? ?????? ??????
	@GetMapping("/member/find/password/confirm/id/{id}/key/{key}")
	public String getComfirmPwd(@PathVariable String id, @PathVariable String key, Model model,
			HttpServletRequest request) {
		logUtil.defaultLog(request);
		model.addAttribute("id", id);
		model.addAttribute("key", key);
		return "user/member/findMyPwdConfirm";
	}

	// ???????????? ?????? ?????? ??????
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
		model.addAttribute("message", "??????????????? ??????????????? ?????????????????????.");
		return REDIRECT_PATH;
	}

	// ???????????? ?????????
	@GetMapping("/member/signup")
	public String getSignup(HttpServletRequest request) {
		logUtil.defaultLog(request);
		return "user/member/signup";
	}

	// ??????????????? ?????????
	@RequestMapping("/member/redirect")
	public String getRedirect(HttpServletRequest request) {
		logUtil.defaultLog(request);
		return REDIRECT_PATH;
	}

	// ??????????????? ?????????
	@RequestMapping("/member/redirect/confirm")
	public String getRedirectConfirm(HttpServletRequest request) {
		logUtil.defaultLog(request);
		return REDIRECT_CONFIRM_PATH;
	}

	// ?????? ?????? ?????????
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
		// customUser ??????. set Password Null.
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
		String emailCon = "" + "<p>???????????????. #1???. </p>" + "<div>?????? ????????? ???????????? ??????????????? ??????????????? ?????????. </div>"
				+ "<a href=\"#2\">???????????? ?????????</a>";
		emailCon = emailCon.replace("#1", member.getNickname());
		emailCon = emailCon.replace("#2", emailConfirmUri);
		String subject = "[?????????]  ???????????? ?????????";
		emailServiceImpl.sendHtmlMail(member.getEmail(), subject, emailCon);
	}

	public void sendAuthMail(MemberDto member) {
		ConfirmEmailDto confirmEmailDto = confirmEmailServiceImpl.saveNewKeyByMemberId(member.getId());
		String emailConfirmUri = ServletUriComponentsBuilder.fromCurrentContextPath().path("/member/auth/mail/confirm")
				.path("/id/").path("" + member.getId()).path("/key/").path(confirmEmailDto.getSecuredKey())
				.toUriString();
		String emailCon = "" + "<p>???????????????. #1???. </p>" + "<div>?????? ????????? ???????????? ????????? ???????????? ?????????. </div>"
				+ "<a href=\"#2\">????????? ??????</a>";
		emailCon = emailCon.replace("#1", member.getNickname());
		emailCon = emailCon.replace("#2", emailConfirmUri);
		String subject = "[?????????]  ????????? ?????? ??????";
		emailServiceImpl.sendHtmlMail(member.getEmail(), subject, emailCon);
	}

}
