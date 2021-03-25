package com.example.demo.service;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.example.demo.config.auth.dto.OAuthAttributes;
import com.example.demo.config.auth.dto.SessionMember;
import com.example.demo.domain.Role;
import com.example.demo.domain.dto.MemberDto;
import com.example.demo.domain.dto.RoleCategoryDto;
import com.example.demo.repository.MemberRepository;
import com.example.demo.repository.RoleCategoryRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RequiredArgsConstructor
@Service
public class CustomOAuth2UserService implements OAuth2UserService<OAuth2UserRequest, OAuth2User> {

	private final MemberRepository memberRepository;
	private final RoleCategoryRepository roleCategoryRepository;
	private final HttpSession httpSession;

	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2UserService delegate = new DefaultOAuth2UserService();
        OAuth2User oAuth2User = delegate.loadUser(userRequest);

        //현재 로그인 진행중인 서비스를 구분하는 코드, 지금은 구글만 사용하는 불필요한 기능이지만 이후 네이버 로그인 연동시 필요
        String registrationId = userRequest.getClientRegistration().getRegistrationId() ;

        //OAuth2 로그인 진행 시 키가되는 필드값을 이야기 합니다. PK와 같은 의미, 구글만 기본 코드 sub를 지원
        String userNameAttributedName = userRequest.getClientRegistration().getProviderDetails().getUserInfoEndpoint().getUserNameAttributeName() ;

        //OAuth2UserService를 통해 가져온 OAuth2User의 attribute를 담을 클래스
        OAuthAttributes attributes = OAuthAttributes.of(registrationId, userNameAttributedName, oAuth2User.getAttributes()) ;


      log.info("start");
      log.info(registrationId);
      log.info(userNameAttributedName);
      log.info(oAuth2User.getAttributes().get("name"));
      log.info(oAuth2User.getAttributes().get("email"));
      log.info(oAuth2User.getAttributes().get("picture"));
      log.info(attributes.toString());
      log.info(attributes.getEmail());
      log.info(attributes.getName());
      log.info(attributes.getPicture());



        OAuth2Error oauth2Error;
		if(registrationId.equals("naver") || registrationId.equals("renaver")) {
	          oauth2Error = new OAuth2Error("OAUTH_VALUE_NULL_NAVER");
		}else {
	          oauth2Error = new OAuth2Error("OAUTH_VALUE_NULL");
		}
        if( attributes.getEmail() == null
	        || attributes.getName() == null
	        || attributes.getPicture() == null ) {
	        throw new OAuth2AuthenticationException(oauth2Error, oauth2Error.toString());
        }

        MemberDto member = saveOrUpdate(attributes) ;
        //SessionUser : 세션에 사용자 정보를 담기위한 Dto, User 클래스보다 좋음
        httpSession.setAttribute("member", new SessionMember(member));

      List<RoleCategoryDto> roleList = roleCategoryRepository.findRoleByEmail(member.getEmail());
      log.info(roleList.toString());
      List<GrantedAuthority> authorities = new ArrayList<>();
      if (roleList.size() > 0) {
			log.info(Role.ADMIN.getValue());
          authorities.add(new SimpleGrantedAuthority(Role.ADMIN.getValue()));
          for (RoleCategoryDto role : roleList) {
				String suffix = "ROLE_ADMIN_";
				String auth = suffix + role.getName().toUpperCase();
				log.info(auth);
                  authorities.add(new SimpleGrantedAuthority(auth));
			}
      } else {
			log.info(Role.MEMBER.getValue());
          authorities.add(new SimpleGrantedAuthority(Role.MEMBER.getValue()));
      }
      authorities.add(new SimpleGrantedAuthority(Role.MEMBER_AUTH.getValue()));

        return new DefaultOAuth2User(
		authorities,
//		        Collections.singleton(authorities),
		        //Collections.singleton(new SimpleGrantedAuthority(Role.MEMBER.getValue())),
		attributes.getAttributes(),
		attributes.getNameAttributeKey());
	}

	private MemberDto saveOrUpdate(OAuthAttributes attributes) {

		Optional<MemberDto> userEntityWrapper = memberRepository.findByEmail(attributes.getEmail());
//		MemberDto userEntity = userEntityWrapper.get();

          MemberDto member;
		if(!userEntityWrapper.isPresent()) {
			  member = new MemberDto();
	          member.setId(memberRepository.getNextId());
	          member.setEmail(attributes.getEmail());
	          member.setNickname(attributes.getName());
	          member.setProfileImg(attributes.getPicture());
	          member.setPwd("none");//attributes.getNameAttributeKey()
			memberRepository.saveWithId(member);
		}else {
			member = userEntityWrapper.get();
		}

//        MemberDto member = memberRepository.findOneByEmail(attributes.getEmail());
//            .map(entity -> entity.update(attributes.getName(), attributes.getPicture()))
//            .orElse(attributes.toEntity()) ;
	//          return memberRepository.save(member);
          return member;
	}

}
