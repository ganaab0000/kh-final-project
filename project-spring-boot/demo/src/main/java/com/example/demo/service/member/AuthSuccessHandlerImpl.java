package com.example.demo.service.member;

import java.io.IOException;
import java.util.Optional;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.example.demo.config.auth.dto.SessionMember;
import com.example.demo.domain.dto.MemberDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class AuthSuccessHandlerImpl implements AuthenticationSuccessHandler {
	@Autowired
	private HttpSession httpSession;
	@Autowired
	private MemberServiceImpl memberServiceImpl;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
		log.info(String.format("%s : %s", request.getMethod(), request.getRequestURI()));
		Optional<MemberDto> opMemberDto = memberServiceImpl.findByEmail(authentication.getName());
		MemberDto memberDto = opMemberDto.get();
		httpSession.setAttribute("member", new SessionMember(memberDto));

        Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
        if (roles.contains("ROLE_MEMBER_BLOCK")) {
			request.setAttribute("trueUrl", "/");
			request.setAttribute("falseUrl", "/");
			request.setAttribute("message", "차단된 멤버입니다. 자세한 사항은 고객센터로 문의 바랍니다.");
	        String url = "/member/redirect/confirm";
	        RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
	        requestDispatcher.forward(request, response);
            return;
        }
        if (roles.contains("ROLE_MEMBER_DEL")) {
			request.setAttribute("trueUrl", "/");
			request.setAttribute("falseUrl", "/");
			request.setAttribute("message", "탈퇴한 멤버입니다. 자세한 사항은 고객센터로 문의 바랍니다.");
	        String url = "/member/redirect/confirm";
	        RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
	        requestDispatcher.forward(request, response);
            return;
        }
        if (roles.contains("ROLE_ADMIN")) {
			request.setAttribute("trueUrl", "/admin");
			request.setAttribute("falseUrl", "/member");
			request.setAttribute("message", "관리자 페이지로 이동하겠습니까?");
	        String url = "/member/redirect/confirm";
	        RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
	        requestDispatcher.forward(request, response);
            return;
        }
    	response.sendRedirect("/member");
	}
}
