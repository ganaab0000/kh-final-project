package com.example.demo.controller.exception;


public class RestInternalErrorCodeException extends RuntimeException{

	private static final long serialVersionUID = 1L;

	public RestInternalErrorCodeException() {
        super();
    }

	public RestInternalErrorCodeException(String message) {
        super(message);
    }

    public RestInternalErrorCodeException(String message, Throwable cause) {
        super(message, cause);
    }

}

