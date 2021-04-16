package com.example.demo.service.member;

import java.util.HashSet;
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

import com.example.demo.domain.Role;
import com.example.demo.domain.dto.MemberDto;
import com.example.demo.domain.dto.RoleCategoryDto;
import com.example.demo.domain.vo.MemberDetailVo;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	private MemberServiceImpl memberServiceImpl;
	@Autowired
	private RoleCategoryServiceImpl roleCategoryServiceImpl;
	@Autowired
	private HttpSession httpsession;

	@Transactional
	public boolean isCorrectedPwd(MemberDto memberDto, String plainPwd) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		return passwordEncoder.matches(plainPwd, memberDto.getPwd());
	}

	@Transactional
	public int updatePwdById(MemberDto memberDto) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		memberDto.setPwd(passwordEncoder.encode(memberDto.getPwd()));
		return memberServiceImpl.updatePwdById(memberDto);
	}

	@Transactional
	public MemberDto joinUser(MemberDto memberDto) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		memberDto.setPwd(passwordEncoder.encode(memberDto.getPwd()));
		int id = memberServiceImpl.getNextId();
		memberDto.setId(id);
		memberServiceImpl.saveWithId(memberDto);
		return memberDto;
	}

	@Transactional
	public HashSet<GrantedAuthority> getAuthorityList(MemberDetailVo memberVo) {
		List<RoleCategoryDto> roleList = roleCategoryServiceImpl.findRoleByEmail(memberVo.getEmail());
		HashSet<GrantedAuthority> authorities = new HashSet<>();
		if (roleList.size() > 0) {
			authorities.add(new SimpleGrantedAuthority(Role.ADMIN.getValue()));
			for (RoleCategoryDto role : roleList) {
				String prefix = "ROLE_ADMIN_";
				String auth = prefix + role.getName().toUpperCase();
				authorities.add(new SimpleGrantedAuthority(auth));
			}
		}
		authorities.add(new SimpleGrantedAuthority(Role.MEMBER.getValue()));
		if(memberVo.getIsEmailVerified().equals("Y"))
			authorities.add(new SimpleGrantedAuthority(Role.MEMBER_MAIL.getValue()));
		if(memberVo.getIsDeleted().equals("Y"))
			authorities.add(new SimpleGrantedAuthority(Role.MEMBER_DEL.getValue()));
		if(memberVo.getIsBlocked().equals("Y"))
			authorities.add(new SimpleGrantedAuthority(Role.MEMBER_BLOCK.getValue()));
		if(memberVo.getProvider() != null)
			authorities.add(new SimpleGrantedAuthority(Role.MEMBER_OAUTH.getValue()));
		return authorities;
	}

	@Override
	public UserDetails loadUserByUsername(String userEmail) throws UsernameNotFoundException {
		Optional<MemberDetailVo> opMemberVo = memberServiceImpl.findMemberDetailByEmail(userEmail);
		if(!opMemberVo.isPresent()) throw new UsernameNotFoundException(userEmail);

		MemberDetailVo memberVo = opMemberVo.get();
		HashSet<GrantedAuthority> authorities = getAuthorityList(memberVo);
		if(authorities.contains(new SimpleGrantedAuthority(Role.MEMBER_DEL.getValue()))) {
			httpsession.setAttribute("MEMBER_SIGNIN_EXCEPTION", "탈퇴한 회원입니다. 궁금하신 것이 있으신 경우 문의 기능을 사용해주세요.");
			throw new UsernameNotFoundException(userEmail);
		}
		if(authorities.contains(new SimpleGrantedAuthority(Role.MEMBER_BLOCK.getValue()))) {
			httpsession.setAttribute("MEMBER_SIGNIN_EXCEPTION", "차단된 회원입니다. 궁금하신 것이 있으신 경우 문의 기능을 사용해주세요.");
			throw new UsernameNotFoundException(userEmail);
		}
		if(authorities.contains(new SimpleGrantedAuthority(Role.MEMBER_OAUTH.getValue()))) {
			httpsession.setAttribute("MEMBER_SIGNIN_EXCEPTION", "SNS로 가입된 아이디입니다. SNS를 통해 로그인해 주세요.");
			throw new UsernameNotFoundException(userEmail);
		}
		return new User(memberVo.getEmail(), memberVo.getPwd(), authorities);
	}
}
