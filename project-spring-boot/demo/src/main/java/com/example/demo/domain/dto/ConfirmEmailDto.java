package com.example.demo.domain.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
@Component
public class ConfirmEmailDto {
	private int memberId;
	private Date dateExpired;
	private String securedKey;
}
