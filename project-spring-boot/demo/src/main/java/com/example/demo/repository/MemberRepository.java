package com.example.demo.repository;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.domain.dto.MemberDto;
import com.example.demo.domain.vo.MemberVo;

@Mapper
public interface MemberRepository {

//	@Select("select * from member_id_seq.nextVal")
//	public int getIdSeq();

	@Select("select role_category.name member left join member_role_category"
			+ "on member.id = member_role_category.member_id"
			+ "left join role_category"
			+ "on member_role_category.role_category_id = role_category.id")
	public MemberVo findRoleByEmail(String email);

	@Select("select * from member")
	public List<MemberDto> findAll();

	@Insert("insert into member (id, email, nickname, pwd) values(member_id_seq.nextVal, #{email}, #{nickname}, #{pwd})")
	public int save(MemberDto memberDto);

	@Select("select * from member where email = #{email}")
	public Optional<MemberDto> findByEmail(String email);
}