package com.example.demo.service.member;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.OAuth2Error;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.example.demo.config.auth.dto.OAuthAttributes;
import com.example.demo.config.auth.dto.SessionMember;
import com.example.demo.domain.Role;
import com.example.demo.domain.dto.MemberDto;
import com.example.demo.domain.dto.OauthDto;
import com.example.demo.domain.vo.MemberDetailVo;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
//@RequiredArgsConstructor
@AllArgsConstructor
@Service
public class UserOAuth2ServiceImpl implements OAuth2UserService<OAuth2UserRequest, OAuth2User> {

	private UserDetailsServiceImpl userDetailsServiceImpl;
	private MemberServiceImpl memberVoServiceImpl;
	private OauthServiceImpl oauthServiceImpl;
	private HttpSession httpSession;

	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		OAuth2UserService<OAuth2UserRequest, ?> delegate = new DefaultOAuth2UserService();
		OAuth2User oAuth2User = delegate.loadUser(userRequest);

		// 현재 로그인 진행중인 서비스를 구분하는 코드, 지금은 구글만 사용하는 불필요한 기능이지만 이후 네이버 로그인 연동시 필요
		String registrationId = userRequest.getClientRegistration().getRegistrationId();

		// OAuth2 로그인 진행 시 키가되는 필드값을 이야기 합니다. PK와 같은 의미, 구글만 기본 코드 sub를 지원
		String userNameAttributedName = userRequest.getClientRegistration().getProviderDetails().getUserInfoEndpoint()
				.getUserNameAttributeName();

		// OAuth2UserService를 통해 가져온 OAuth2User의 attribute를 담을 클래스
		OAuthAttributes attributes = OAuthAttributes.of(registrationId, userNameAttributedName,
				oAuth2User.getAttributes());

		OAuth2Error oauth2Error;
		if (registrationId.equals("naver") || registrationId.equals("renaver")) {
			oauth2Error = new OAuth2Error("OAUTH_VALUE_NULL_NAVER");
		} else {
			oauth2Error = new OAuth2Error("OAUTH_VALUE_NULL");
		}
		if (attributes.getEmail() == null || attributes.getName() == null || attributes.getPicture() == null) {
			throw new OAuth2AuthenticationException(oauth2Error, oauth2Error.toString());
		}

		MemberDetailVo memberVo = saveOrUpdate(attributes, registrationId);
		HashSet<GrantedAuthority> authorities = userDetailsServiceImpl.getAuthorityList(memberVo);

		return new DefaultOAuth2User(authorities, attributes.getAttributes(), attributes.getNameAttributeKey());
	}

	private MemberDetailVo saveOrUpdate(OAuthAttributes attributes, String registrationId) {
		Optional<MemberDetailVo> opMemberDto = memberVoServiceImpl.findMemberDetailByEmail(attributes.getEmail());
		if (!opMemberDto.isPresent()) {
			MemberDto memberDto = new MemberDto();
			memberDto.setId(memberVoServiceImpl.getNextId());
			memberDto.setEmail(attributes.getEmail());
			memberDto.setNickname(attributes.getName());
			memberDto.setPwd("none");
			memberVoServiceImpl.saveWithId(memberDto);
			memberVoServiceImpl.updateAuthEmailById(memberDto.getId()); //?
			OauthDto oauthDto = new OauthDto();
			oauthDto.setAccessToken(String.valueOf(attributes.getAttributes().get(attributes.getNameAttributeKey())));
			oauthDto.setMemberId(memberDto.getId());
			oauthDto.setProvider(registrationId);
			oauthDto.setProviderProfileImg(attributes.getPicture());
			oauthServiceImpl.save(oauthDto);
			opMemberDto = memberVoServiceImpl.findMemberDetailByEmail(attributes.getEmail());
		}
		MemberDetailVo memberVo = opMemberDto.get();
		//update recent image
		memberVo.setProviderProfileImg(attributes.getPicture()); //? //just for test now //will be removed
		return memberVo;
	}

}
