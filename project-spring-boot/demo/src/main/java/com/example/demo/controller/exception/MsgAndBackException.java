package com.example.demo.controller.exception;


import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_FOUND)
public class MsgAndBackException extends RuntimeException{

	private static final long serialVersionUID = 1L;

	public MsgAndBackException(String message) {
        super(message);
    }

    public MsgAndBackException(String message, Throwable cause) {
        super(message, cause);
    }
}

