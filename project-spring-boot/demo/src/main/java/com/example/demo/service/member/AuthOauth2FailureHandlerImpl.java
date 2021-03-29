package com.example.demo.service.member;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class AuthOauth2FailureHandlerImpl implements AuthenticationFailureHandler {

    private ObjectMapper objectMapper = new ObjectMapper();

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
		AuthenticationException exception) throws IOException, ServletException {
	    response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");

	    response.setStatus(HttpStatus.UNAUTHORIZED.value());
	    Map<String, Object> data = new HashMap<>();
	    data.put(
	        "timestamp",
	        Calendar.getInstance().getTime());
	    data.put(
	        "exception",
	        exception.getMessage());
	    System.out.println(exception.getMessage().toString());
	    if(exception.getMessage().contains("OAUTH_VALUE_NULL_NAVER")) {
	    	//naver reprompt page
	    	response.sendRedirect("/member/signin/result/fail/naver");
	    }else if(exception.getMessage().contains("authorization_request_not_found")) {
	    	response.sendRedirect("/member/signin/result/fail");
	    }else {
	    	response.getOutputStream()
	    	.println(objectMapper.writeValueAsString(data));
	    }

	}


}