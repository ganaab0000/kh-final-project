package com.example.demo.domain.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
@Component
public class MemberDto {
	private int id;
	private String email;
	private String nickname;
	private String pwd;
	private String isEmailVerified;
	private String isDeleted;
	private Date dateLoggedin;
	private Date dateCreated;
	private Date dateUpdated;
	private String address;
	private String phone;
	private String profileImg;
	private String profileTxt;

}
