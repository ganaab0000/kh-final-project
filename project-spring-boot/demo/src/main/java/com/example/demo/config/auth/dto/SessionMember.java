package com.example.demo.config.auth.dto;

import java.io.Serializable;

import com.example.demo.domain.dto.MemberDto;
import com.example.demo.domain.vo.MemberDetailVo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@ToString
@Getter
public class SessionMember implements Serializable {
	private static final long serialVersionUID = 1L;
	private static final String FILE_API_URL = "/api/file/";
	private static final String DEFAULT_PROFILE_IMG = "/img/default_profile_img.jpg";

	private int id;
	private String nickname;
	private String email;
	private String profileImgUrl;

	public SessionMember(MemberDto member) {
		this.id = member.getId();
		this.nickname = member.getNickname();
		this.email = member.getEmail();
		this.profileImgUrl = member.getProfileImg() == 0? DEFAULT_PROFILE_IMG : FILE_API_URL + member.getProfileImg();
	}

	public SessionMember(MemberDetailVo member) {
		this.id = member.getId();
		this.nickname = member.getNickname();
		this.email = member.getEmail();
		this.profileImgUrl = member.getProviderProfileImg();
	}

	public MemberDto toMemberDto() {
		MemberDto member = new MemberDto();
		member.setId(id);
		member.setNickname(nickname);
		member.setEmail(email);
		return member;
	}

}
