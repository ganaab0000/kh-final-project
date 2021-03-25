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

//        if(true) {
//      throw new Exception("");
//            throw new UsernameNotFoundException("");
//        }

		return memberServiceImpl.save(memberDto);
	}

	@Override
	public UserDetails loadUserByUsername(String userEmail) throws UsernameNotFoundException {
		Optional<MemberDto> userEntityWrapper = memberServiceImpl.findByEmail(userEmail);
		System.out.println("test1");
		if(!userEntityWrapper.isPresent()) throw new UsernameNotFoundException("");
		System.out.println("test2");
		//unsername not일 경우, 하단 InternalAuthenticationServiceException:
		MemberDto userEntity = userEntityWrapper.get();
		System.out.println("test3");
		log.info(userEntity.toString());
		// oauth ID, 로그인 금지.
//      throw new UsernameNotFoundException(userEmail);
//		if (!userEntityWrapper.isPresent()) {
//			System.out.println("???");
////			throw new Error("adf");
//			throw new UsernameNotFoundException("");
////			throw new UsernameNotFoundException("aetetsdfsdfsf");
////			throw new UsernameNotFoundException("adfasf", new Throwable("tesstdf", new Throwable("aaa")));
//		}
		//? 여기서 설정하면 안되는데??
//		httpSession.setAttribute("member", new SessionMember(userEntity));

		List<RoleCategoryDto> roleList = roleCategoryRepository.findRoleByEmail(userEmail);
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

		return new User(userEntity.getEmail(), userEntity.getPwd(), authorities);
	}
}
