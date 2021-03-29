package com.example.demo.service.member;

import java.io.IOException;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.example.demo.config.auth.dto.SessionMember;
import com.example.demo.domain.dto.MemberDto;

@Component
public class AuthSuccessHandlerImpl implements AuthenticationSuccessHandler {
	@Autowired
	private HttpSession httpSession;
	@Autowired
	private MemberServiceImpl memberServiceImpl;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
//        Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
//        if (roles.contains("ROLE_ADMIN")) {
//            response.sendRedirect("/admin");
//            return;
//        }

		System.out.println(authentication.getPrincipal().toString());
		System.out.println(authentication.getName());

		Optional<MemberDto> userEntityWrapper = memberServiceImpl.findByEmail(authentication.getName());
		MemberDto member = userEntityWrapper.get();
		System.out.println(member.toString());
		httpSession.setAttribute("member", new SessionMember(member));
    	response.sendRedirect("/member/signin/result");

	}

}
