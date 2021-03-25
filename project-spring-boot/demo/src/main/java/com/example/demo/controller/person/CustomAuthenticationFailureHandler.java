package com.example.demo.controller.person;

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

import com.fasterxml.jackson.databind.ObjectMapper;
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {

    private ObjectMapper objectMapper = new ObjectMapper();

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
		AuthenticationException exception) throws IOException, ServletException {

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
	    	//https://nid.naver.com/oauth2.0/authorize?response_type=code&state=k85_WZtb0e-mZgXiTVdI3ET7ACAfNq_PCB40jPFDTwk%3D
	    	//&redirect_uri=http%3A%2F%2Flocalhost%3A9090%2Flogin%2Foauth2%2Fcode%2Fnaver
	    	//&client_id=xxxxx&oauth_os=
	    	//&inapp_view=&locale=ko_KR&oauth_token=VuF2mSaIC264sR9c2D
			try {
		            String clientId = "xxxxx";//애플리케이션 클라이언트 아이디값";
		            String redirectURI;
			        redirectURI = URLEncoder.encode("http://localhost:9090/login/oauth2/code/naver", "UTF-8");
		            SecureRandom random = new SecureRandom();
		            String state = new BigInteger(130, random).toString();
		            String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
//		            String apiURL = "/oauth2/authorization/naver?response_type=code";
		            apiURL += "&client_id=" + clientId;
		            apiURL += "&redirect_uri=" + redirectURI;
		            apiURL += "&state=" + state;
		            apiURL += "&auth_type=" + "reprompt";

//		            httpSession.setAttribute("state", state);
		            System.out.println(apiURL);
			    	response.sendRedirect("/member/signin/result/fail/naver");

			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
//	    	response.sendRedirect("/");
	    	//naver reprompt page
	    }else if(exception.getMessage().contains("authorization_request_not_found")) {
	    	response.sendRedirect("/member/signin/result/fail");
	    }else {
	    	response.getOutputStream()
	    	.println(objectMapper.writeValueAsString(data));
	    }

	}


}