package com.example.demo.controller.exception;



import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;


import lombok.extern.slf4j.Slf4j;

@ControllerAdvice
@Slf4j
public class ExceptionController {
    private final static String REDIRECT_PATH = "user/member/redirectWithMessage";

	@ExceptionHandler({ java.sql.SQLIntegrityConstraintViolationException.class })
	public String handleSQLIntegrityConstraintViolationException(final RuntimeException ex, Model model) {
		log.warn("error", ex);
		model.addAttribute("url", "-1");
		model.addAttribute("message", "중복된 값이 입력되었습니다.");
		return REDIRECT_PATH;
	}

	@ExceptionHandler({ org.springframework.mail.MailSendException.class })
	public String handleSendFailException(final RuntimeException ex, Model model) {
		log.warn("error", ex);
		model.addAttribute("url", "-1");
		model.addAttribute("message", "이메일 전송에 실패하였습니다. 잠시 후에 다시 시도 부탁드립니다.");
		return REDIRECT_PATH;
	}

	@ExceptionHandler({ RoleMemberException.class })
	public String handleNeedRoleMember(final RuntimeException ex, Model model) {
		log.warn("error", ex);
		model.addAttribute("url", "/member/signin");
		model.addAttribute("message", "로그인이 필요합니다. 로그인하여 주세요.");
		return REDIRECT_PATH;
	}

	@ExceptionHandler({ MsgAndBackException.class })
	public String handleMsgAndBackException(final RuntimeException ex, Model model) {
		log.warn("error", ex);
		model.addAttribute("url", "-1");
		model.addAttribute("message", ex.getMessage());
		return REDIRECT_PATH;
	}

//    @Override
//    protected ResponseEntity<Object> handleMethodArgumentNotValid(
//        MethodArgumentNotValidException ex, HttpHeaders headers,
//        HttpStatus status, WebRequest request) {
//
//        Map<String, Object> body = new LinkedHashMap<>();
//        body.put("timestamp", LocalDate.now());
//        body.put("status", status.value());
//
//        List<String> errors = ex.getBindingResult()
//                .getFieldErrors()
//                .stream()
//                .map(x -> x.getDefaultMessage())
//                .collect(Collectors.toList());
//
//        body.put("errors", errors);
//
//        return new ResponseEntity<>(body, HttpStatus.BAD_REQUEST);
//    }

//	// 400
//	@ExceptionHandler({ TestException.class })
//	public String BadRequestException(final RuntimeException ex, Model model) {
//		log.warn("error", ex);
//		// redirect
//
//		model.addAttribute("url", "/");
//		model.addAttribute("message", "로그인이 필요합니다. 로그인하여 주세요.");
//		return REDIRECT_PATH;
//	}
//
//	// 400
//	@ExceptionHandler({ Test2Exception.class })
//	public ResponseEntity<Object> Test2Exception(final RuntimeException ex) {
//		log.warn("error", ex);
//		return ResponseEntity.badRequest().body(ex.getMessage());
//	}


//    // 400
//    @ExceptionHandler({
////            MemberJoinException.class,
//            RuntimeException.class
//    })
//    public ResponseEntity<Object> BadRequestException(final RuntimeException ex) {
//        log.warn("error", ex);
//        return ResponseEntity.badRequest().body(ex.getMessage());
//    }
//
//    // 401
//    @ExceptionHandler({ AccessDeniedException.class })
//    public ResponseEntity handleAccessDeniedException(final AccessDeniedException ex) {
//        log.warn("error", ex);
//        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(ex.getMessage());
//    }
//
//    // 500
//    @ExceptionHandler({ Exception.class })
//    public ResponseEntity<Object> handleAll(final Exception ex) {
//        log.info(ex.getClass().getName());
//        log.error("error", ex);
//        return new ResponseEntity<>(ex.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
//    }

}
