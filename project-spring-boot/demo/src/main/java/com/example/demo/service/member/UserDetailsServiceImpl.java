package com.example.demo.service.member;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

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

import com.example.demo.config.auth.dto.SessionMember;
import com.example.demo.domain.Role;
import com.example.demo.domain.dto.MemberDto;
import com.example.demo.domain.dto.RoleCategoryDto;
import com.example.demo.repository.RoleCategoryRepository;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
@AllArgsConstructor
public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	private MemberServiceImpl memberServiceImpl;
	@Autowired
	private RoleCategoryRepository roleCategoryRepository;

	@Transactional
	public int joinUser(MemberDto memberDto) {
		// 비밀번호 암호화
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		memberDto.setPwd(passwordEncoder.encode(memberDto.getPwd()));

//		if(isInvalidValue) throw new Exception();

		return memberServiceImpl.save(memberDto);
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

		List<RoleCategoryDto> roleList = roleCategoryRepository.findRoleByEmail(userEmail);
		List<GrantedAuthority> authorities = new ArrayList<>();
		if (roleList.size() > 0) {
			authorities.add(new SimpleGrantedAuthority(Role.ADMIN.getValue()));
			for (RoleCategoryDto role : roleList) {
				String suffix = "ROLE_ADMIN_";
				String auth = suffix + role.getName().toUpperCase();
				authorities.add(new SimpleGrantedAuthority(auth));
			}
		}
		authorities.add(new SimpleGrantedAuthority(Role.MEMBER.getValue()));

		return new User(userEntity.getEmail(), userEntity.getPwd(), authorities);
	}
}
