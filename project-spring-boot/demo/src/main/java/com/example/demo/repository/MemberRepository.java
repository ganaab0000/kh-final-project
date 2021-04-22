package com.example.demo.repository;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.domain.dto.MemberDto;
import com.example.demo.domain.dto.RoleCategoryDto;
import com.example.demo.domain.vo.MemberDetailVo;

@Mapper
public interface MemberRepository {

	@Select("select member_id_seq.nextVal from dual")
	public int getNextId();

	@Select("select * from member")
	public List<MemberDto> findAll();

	@Insert("insert into member (id, email, nickname, pwd) values(member_id_seq.nextVal, #{email}, #{nickname}, #{pwd})")
	public int save(MemberDto memberDto);

	@Update("update member set pwd=#{pwd} where id = #{id}")
	public int updatePwdById(MemberDto memberDto);

	@Insert("insert into member (id, email, nickname, pwd) values(#{id}, #{email}, #{nickname}, #{pwd})")
	public int saveWithId(MemberDto memberDto);

	@Select("select * from member where email = #{email}")
	public Optional<MemberDto> findByEmail(String email);

	@Select("select * from member left join oauth "
			+ "on member.id = oauth.member_id "
			+ "where member.email = #{email}")
	public Optional<MemberDetailVo> findMemberDetailByEmail(String email);

	@Select("select * from member where email = #{email} and pwd = #{pwd}")
	public Optional<MemberDto> findByEmailAndPwd(MemberDto memberDto);

	@Select("select * from member where id = #{memberId}")
	public MemberDto findById(int memberId);

	@Update("update member set is_email_verified='Y' where id = #{id}")
	public int updateAuthEmailById(int id);

	@Update("update member set is_deleted='Y', date_deleted=sysdate where id = #{id}")
	public int updateIsDeleted(int id);

	@Update("update member set is_blocked= "
			+ "CASE WHEN is_blocked='N' THEN 'Y' "
			+ "WHEN is_blocked='Y' THEN 'N' "
			+ "END, date_blocked=sysdate "
			+ "where id = #{id}")
	public int updateIsBlocked(int id);

	public int updateById(MemberDto memberDto);

}