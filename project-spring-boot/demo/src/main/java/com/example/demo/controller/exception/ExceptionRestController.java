package com.example.demo.controller.exception;

import java.time.LocalDate;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.WebRequest;

import lombok.extern.slf4j.Slf4j;

@ControllerAdvice
@ResponseBody
@Slf4j
public class ExceptionRestController {

	@ExceptionHandler({ RestInternalErrorCodeException.class })
	@ResponseBody
	public ResponseEntity<Map<String, Object>> handleRestException(final RuntimeException ex, Model model) {
        log.warn("error");
        String errCode = ex.getMessage() == null ? "500" : ex.getMessage();

        String msg;
        switch (errCode) {
        case "101":
            msg = "오류가 발생하였습니다. 다시 시도해주세요.";
            break;
        case "400": case "401": case "402":
        case "403":
            msg = "해당 자원에 대한 권한이 없습니다.";
            break;
        default:
            msg = "오류가 발생하였습니다. 다시 시도해주세요.";
            break;
        }
		Map<String, Object> body = new LinkedHashMap<>();
		body.put("isSuccess", false);
		body.put("errCode", errCode);
		body.put("errMsg", msg);

		return new ResponseEntity<>(body, HttpStatus.INTERNAL_SERVER_ERROR);
	}


}
