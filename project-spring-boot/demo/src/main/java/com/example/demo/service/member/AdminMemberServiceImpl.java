package com.example.demo.service.member;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.domain.dto.MemberDto;
import com.example.demo.domain.vo.MemberDetailVo;
import com.example.demo.repository.AdminMemberRepository;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {

	@Autowired
	private AdminMemberRepository adminMemberRepository;

	@Override
	public List<MemberDetailVo> getMemberDetailList(MemberDto memberDto, int pageNumber, int pageSize) {
		return adminMemberRepository.getMemberDetailList(memberDto, pageNumber, pageSize);
	}

	@Override
	public int getCountMemberDetailList(MemberDto memberDto, int pageNumber, int pageSize) {
		return adminMemberRepository.getCountMemberDetailList(memberDto, pageNumber, pageSize);
	}

	@Override
	public Optional<MemberDetailVo> findMemberDetailById(int memberId) {
		return adminMemberRepository.findMemberDetailById(memberId);
	}

}