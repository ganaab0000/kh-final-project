package com.example.demo.service.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class AuthOauth2FailureHandlerImpl implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		log.warn(String.format("%s : %s : %s", request.getMethod(), request.getRequestURI(), exception.getMessage()));
		if (exception.getMessage().contains("OAUTH_VALUE_NULL_NAVER")) {
			request.setAttribute("trueUrl", "/oauth2/authorization/renaver");
			request.setAttribute("falseUrl", "/member/signin");
			request.setAttribute("message", "필수 권한이 누락되었습니다. 권한 설정을 다시 해주세요.");
	        String url = "/member/redirect/confirm";
	        RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
	        requestDispatcher.forward(request, response);
		} else if (exception.getMessage().contains("authorization_request_not_found")) {
			request.setAttribute("url", "/member/signin");
			request.setAttribute("message", "계정정보를 받아오는 데 실패하였습니다. 다시 시도해주세요.");
	        String url = "/member/redirect";
	        RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
	        requestDispatcher.forward(request, response);
		} else {
			response.sendRedirect("/member/denied");
		}
	}

}