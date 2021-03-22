package com.example.demo.entity.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
@Component
public class MemberSnakeDto {
	private int id;
	private String email;
	private String nickname;
	private String pwd;
	private String is_email_verified;
	private String is_deleted;
	private Date date_loggedin;
	private Date date_created;
	private Date date_updated;
	private String address;
	private String phone;
	private String profile_img;
	private String profile_detail;
}
