package com.example.demo.service.member;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.domain.dto.MemberDto;
import com.example.demo.repository.MemberRepository;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberRepository memberRepository;

	@Override
	public int getNextId() {
		return memberRepository.getNextId();
	};

	@Override
	public List<MemberDto> findAll() {
		return memberRepository.findAll();
	};

	@Override
	public int save(MemberDto memberDto) {
		return memberRepository.save(memberDto);
	};

	@Override
	public int saveWithId(MemberDto memberDto) {
		return memberRepository.saveWithId(memberDto);
	};

	@Override
	public Optional<MemberDto> findByEmail(String email) {
		return memberRepository.findByEmail(email);
	}

	@Override
	public Optional<MemberDto> findByEmailAndPwd(MemberDto memberDto) {
		return memberRepository.findByEmailAndPwd(memberDto);
	}

	@Override
	public int updateAuthEmailById(int id) {
		return memberRepository.updateAuthEmailById(id);
	}

	@Override
	public int updateIsDeleted(int id) {
		return memberRepository.updateIsDeleted(id);
	}

	@Override
	public int updateById(MemberDto memberDto) {
		return memberRepository.updateById(memberDto);
	}

	@Override
	public int updatePwdById(MemberDto memberDto) {
		return memberRepository.updatePwdById(memberDto);
	};

}
