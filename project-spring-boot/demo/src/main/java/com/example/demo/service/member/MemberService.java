package com.example.demo.service.member;

import java.util.List;
import java.util.Optional;


import com.example.demo.domain.dto.MemberDto;

public interface MemberService {
	public int getNextId();
	public List<MemberDto> findAll();
	public int save(MemberDto memberDto);
	public int saveWithId(MemberDto memberDto);
	public Optional<MemberDto> findByEmail(String email);
}
