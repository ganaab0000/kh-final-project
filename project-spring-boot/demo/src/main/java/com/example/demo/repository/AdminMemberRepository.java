package com.example.demo.repository;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.domain.dto.MemberDto;
import com.example.demo.domain.vo.MemberDetailVo;

@Mapper
public interface AdminMemberRepository {

	public List<MemberDetailVo> getMemberDetailList(MemberDto memberDto, int pageNumber, int pageSize);

	public int getCountMemberDetailList(MemberDto memberDto, int pageNumber, int pageSize);

	@Select("select * from member left join oauth "
			+ "on member.id = oauth.member_id "
			+ "where member.id = #{id}")
	public Optional<MemberDetailVo> findMemberDetailById(int memberId);

}
