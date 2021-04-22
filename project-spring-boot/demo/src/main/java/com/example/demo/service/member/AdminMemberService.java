package com.example.demo.service.member;

import java.util.List;
import java.util.Optional;


import com.example.demo.domain.dto.MemberDto;
import com.example.demo.domain.vo.MemberDetailVo;

public interface AdminMemberService {

	public List<MemberDetailVo> getMemberDetailList(MemberDto memberDto, int pageNumber, int pageSize);

	public int getCountMemberDetailList(MemberDto memberDto, int pageNumber, int pageSize);

	public Optional<MemberDetailVo> findMemberDetailById(int memberId);

}
