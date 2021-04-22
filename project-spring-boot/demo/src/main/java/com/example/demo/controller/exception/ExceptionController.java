package com.example.demo.controller.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import lombok.extern.slf4j.Slf4j;

@ControllerAdvice
@Slf4j
public class ExceptionController {
    private final static String REDIRECT_PATH = "user/member/redirectWithMessage";

    @ExceptionHandler({ InternalErrorCodeException.class })
    public String handleInternalErrorCodeException(final RuntimeException ex, Model model) {
        log.warn("error", ex);
        String errCode = ex.getMessage() == null ? "500" : ex.getMessage();
        String url, msg;
        switch (errCode) {
        case "101":
            url = "/";
            msg = "오류가 발생하였습니다. 다시 시도해주세요.";
            break;
        case "102":
            url = "/member/signout";
            msg = "존재하지 않거나 탈퇴된 회원입니다. 가입 후 다시 시도해주세요.";
            break;
        case "200":
            url = "/";
            msg = "입력값이 유효하지 않습니다. 다시 시도해주세요.";
            break;
        case "300":
            url = "/";
            msg = "유효한 키가 존재하지 않습니다. 다시 시도해주세요.";
            break;
        case "400": case "401": case "402":
        case "403":
            url = "/";
            msg = "해당 자원에 대한 권한이 없습니다.";
            break;
        case "701":
            url = "/member/change/password";
            msg = "비밀번호가 일치하지 않습니다.";
            break;
        case "702":
            url = "/member/withdraw";
            msg = "비밀번호가 일치하지 않습니다.";
            break;
        default:
            url = "/";
            msg = "오류가 발생하였습니다. 다시 시도해주세요.";
            break;
        }
        model.addAttribute("url", url);
        model.addAttribute("message", String.format("%s (%s)", msg, errCode));
        return REDIRECT_PATH;
    }

    @ExceptionHandler({ java.sql.SQLIntegrityConstraintViolationException.class })
    public String handleSQLIntegrityConstraintViolationException(final RuntimeException ex, Model model) {
        log.warn("error", ex);
        model.addAttribute("url", "/");
        model.addAttribute("message", "중복된 값이 입력되었습니다. 다시 시도해주세요.");
        return REDIRECT_PATH;
    }

    @ExceptionHandler({ org.springframework.mail.MailSendException.class })
    public String handleSendFailException(final RuntimeException ex, Model model) {
        log.warn("error", ex);
        model.addAttribute("url", "/");
        model.addAttribute("message", "메일 전송에 실패하였습니다. 잠시 후에 다시 시도해주세요.");
        return REDIRECT_PATH;
    }

    // All
//    @ExceptionHandler({ Exception.class })
//    public String handleAll(final Exception ex, Model model) {
//        log.warn("error", ex);
//        model.addAttribute("url", "/");
//        model.addAttribute("message", "오류가 발생하였습니다. 다시 시도해주세요.");
//        return REDIRECT_PATH;
//    }

}
