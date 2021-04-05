package com.example.demo.controller.exception;


import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

public class RoleMemberException extends RuntimeException{

	private static final long serialVersionUID = 1L;

	public RoleMemberException(String message) {
        super(message);
    }

    public RoleMemberException(String message, Throwable cause) {
        super(message, cause);
    }
}

