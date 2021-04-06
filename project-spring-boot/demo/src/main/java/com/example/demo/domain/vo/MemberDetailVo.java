package com.example.demo.domain.vo;

import java.util.Date;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class MemberDetailVo {
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

	private String provider;
	private String providerProfileImg;
}
