package com.example.demo.controller.exception;

public class ExceptionRestController {
//  @Override
//  protected ResponseEntity<Object> handleMethodArgumentNotValid(
//      MethodArgumentNotValidException ex, HttpHeaders headers,
//      HttpStatus status, WebRequest request) {
//
//      Map<String, Object> body = new LinkedHashMap<>();
//      body.put("timestamp", LocalDate.now());
//      body.put("status", status.value());
//
//      List<String> errors = ex.getBindingResult()
//              .getFieldErrors()
//              .stream()
//              .map(x -> x.getDefaultMessage())
//              .collect(Collectors.toList());
//
//      body.put("errors", errors);
//
//      return new ResponseEntity<>(body, HttpStatus.BAD_REQUEST);
//  }
//  // 400
//  @ExceptionHandler({
////          MemberJoinException.class,
//          RuntimeException.class
//  })
//  public ResponseEntity<Object> BadRequestException(final RuntimeException ex) {
//      log.warn("error", ex);
//      return ResponseEntity.badRequest().body(ex.getMessage());
//  }
//
//  // 401
//  @ExceptionHandler({ AccessDeniedException.class })
//  public ResponseEntity handleAccessDeniedException(final AccessDeniedException ex) {
//      log.warn("error", ex);
//      return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(ex.getMessage());
//  }
//
//  // 500
//  @ExceptionHandler({ Exception.class })
//  public ResponseEntity<Object> handleAll(final Exception ex) {
//      log.info(ex.getClass().getName());
//      log.error("error", ex);
//      return new ResponseEntity<>(ex.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
//  }

}
