package com.example.demo.domain.dto;



import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class OauthDto {
	private int id;
	private int memberId;
	private int accessToken;
	private int provider;
	private int providerProfileImg;
}
