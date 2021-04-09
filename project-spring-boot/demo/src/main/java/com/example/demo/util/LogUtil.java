package com.example.demo.util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class LogUtil {

	public void defaultLog(HttpServletRequest request) {
		String className = Thread.currentThread().getStackTrace()[2].getClassName();
		String methodName = Thread.currentThread().getStackTrace()[2].getMethodName();
		log.info(String.format("%s : %s : %s : %s", request.getMethod(), request.getRequestURI(), className, methodName));

	}

	public void defaultLog(HttpServletRequest request, String message) {
		String className = Thread.currentThread().getStackTrace()[2].getClassName();
		String methodName = Thread.currentThread().getStackTrace()[2].getMethodName();
		log.info(String.format("%s : %s : %s : %s : %s", request.getMethod(), request.getRequestURI(), message, className, methodName));
	}
}
