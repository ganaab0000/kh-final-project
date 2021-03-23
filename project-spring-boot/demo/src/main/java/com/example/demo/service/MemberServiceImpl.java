package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
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
import com.example.demo.repository.MemberRepository;
import com.example.demo.repository.RoleCategoryRepository;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
@AllArgsConstructor
public class MemberServiceImpl implements UserDetailsService {

	@Autowired
	private MemberRepository memberRepository;

	@Autowired
	private RoleCategoryRepository roleCategoryRepository;

    @Transactional
    public int joinUser(MemberDto memberDto) {
        // 비밀번호 암호화
    	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        memberDto.setPwd(passwordEncoder.encode(memberDto.getPwd()));

        return memberRepository.save(memberDto);
    }

    @Override
    public UserDetails loadUserByUsername(String userEmail) throws UsernameNotFoundException {
        Optional<MemberDto> userEntityWrapper = memberRepository.findByEmail(userEmail);
        MemberDto userEntity = userEntityWrapper.get();

        List<RoleCategoryDto> roleList = roleCategoryRepository.findRoleByEmail(userEmail);
        log.info(roleList.toString());
        List<GrantedAuthority> authorities = new ArrayList<>();
        if (roleList.size() > 0) {
            authorities.add(new SimpleGrantedAuthority(Role.ADMIN.getValue()));
            for (RoleCategoryDto role : roleList) {
				log.info(role.getName());
	            //authorities.add(new SimpleGrantedAuthority(Role.ADMIN.getValue()));
			}
        } else {
            authorities.add(new SimpleGrantedAuthority(Role.MEMBER.getValue()));
        }

        return new User(userEntity.getEmail(), userEntity.getPwd(), authorities);
    }
}
