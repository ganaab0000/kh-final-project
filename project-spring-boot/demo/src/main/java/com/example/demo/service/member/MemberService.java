package com.example.demo.service.member;

import java.util.List;
import java.util.Optional;

import com.example.demo.domain.dto.MemberDto;
import com.example.demo.domain.vo.MemberDetailVo;

public interface MemberService {
	public int getNextId();

	public List<MemberDto> findAll();

	public int save(MemberDto memberDto);

	public int updatePwdById(MemberDto memberDto);

	public int saveWithId(MemberDto memberDto);

	public Optional<MemberDto> findByEmail(String email);
	
	public MemberDto findById(Integer memberId);

	public Optional<MemberDetailVo> findMemberDetailByEmail(String email);

	public Optional<MemberDto> findByEmailAndPwd(MemberDto memberDto);

	public int updateAuthEmailById(int id);

	public int updateIsDeleted(int id);

	public int updateById(MemberDto memberDto);
}
