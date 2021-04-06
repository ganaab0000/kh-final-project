package com.example.demo.controller.exception;


public class InternalErrorCodeException extends RuntimeException{

	private static final long serialVersionUID = 1L;

	public InternalErrorCodeException() {
        super();
    }

	public InternalErrorCodeException(String message) {
        super(message);
    }

    public InternalErrorCodeException(String message, Throwable cause) {
        super(message, cause);
    }

}

