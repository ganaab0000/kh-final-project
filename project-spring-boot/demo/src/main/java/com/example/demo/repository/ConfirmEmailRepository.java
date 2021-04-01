package com.example.demo.repository;

import java.util.Optional;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.domain.dto.ConfirmEmailDto;

@Mapper
public interface ConfirmEmailRepository {

	@Delete("delete from confirm_email where date_expired < current_timestamp")
	public int deleteWhenExpired();

	@Delete("delete from confirm_email where member_id = #{memberId} and date_expired < current_timestamp")
	public int deleteByMemberIdWhenExpired(int memberId);

	@Select("select * from confirm_email where member_id = #{memberId} and date_expired > current_timestamp")
	public Optional<ConfirmEmailDto> findByMemberIdWhenNotExpired(int memberId);

	@Delete("delete from confirm_email where member_id = #{memberId}")
	public int deleteByMemberId(int memberId);

	@Insert("insert into confirm_email (member_id, date_expired, secured_key) values(#{memberId}, #{dateExpired}, #{securedKey})")
	public int save(ConfirmEmailDto confirmEmailDto);


}