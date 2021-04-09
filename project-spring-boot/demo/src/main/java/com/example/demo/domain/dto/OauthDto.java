package com.example.demo.domain.dto;



import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class OauthDto {
	private int memberId;
	private String accessToken;
	private String provider;
	private String providerProfileImg;
}
