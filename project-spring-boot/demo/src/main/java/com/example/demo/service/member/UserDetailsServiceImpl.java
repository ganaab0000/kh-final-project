package com.example.demo.service.member;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.domain.Role;
import com.example.demo.domain.dto.MemberDto;
import com.example.demo.domain.dto.RoleCategoryDto;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
@AllArgsConstructor
public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	private MemberServiceImpl memberServiceImpl;
	@Autowired
	private RoleCategoryServiceImpl roleCategoryServiceImpl;

	@Transactional
	public int updatePwdById(MemberDto memberDto) {
		// 비밀번호 암호화
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		memberDto.setPwd(passwordEncoder.encode(memberDto.getPwd()));
		return memberServiceImpl.updatePwdById(memberDto);
	}

	@Transactional
	public MemberDto joinUser(MemberDto memberDto) {
		// 비밀번호 암호화
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		memberDto.setPwd(passwordEncoder.encode(memberDto.getPwd()));
		int id = memberServiceImpl.getNextId();
		memberDto.setId(id);
		memberServiceImpl.saveWithId(memberDto);

		return memberDto;
	}

	@Override
	public UserDetails loadUserByUsername(String userEmail) throws UsernameNotFoundException {
		Optional<MemberDto> userEntityWrapper = memberServiceImpl.findByEmail(userEmail);
		if(!userEntityWrapper.isPresent()) throw new UsernameNotFoundException("");
//		if(isDeleted) throw new UsernameNotFoundException("");
//		if(isOauth) throw new UsernameNotFoundException("");
		// oauth 로그인시, 일반 로그인 불가처리.
		// 에러메시지는 기존 방식대로 세션으로 처리.
		MemberDto userEntity = userEntityWrapper.get();
//		log.info(userEntity.toString());

		List<RoleCategoryDto> roleList = roleCategoryServiceImpl.findRoleByEmail(userEmail);
		List<GrantedAuthority> authorities = new ArrayList<>();
		if (roleList.size() > 0) {
			authorities.add(new SimpleGrantedAuthority(Role.ADMIN.getValue()));
			for (RoleCategoryDto role : roleList) {
				String prefix = "ROLE_ADMIN_";
				String auth = prefix + role.getName().toUpperCase();
				authorities.add(new SimpleGrantedAuthority(auth));
			}
		}
		authorities.add(new SimpleGrantedAuthority(Role.MEMBER.getValue()));
		if(userEntity.getIsEmailVerified().equals("Y")) {
			authorities.add(new SimpleGrantedAuthority(Role.MEMBER_MAIL.getValue()));
		}

		return new User(userEntity.getEmail(), userEntity.getPwd(), authorities);
	}
}
