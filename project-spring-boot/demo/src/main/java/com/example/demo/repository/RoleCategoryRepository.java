package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.domain.dto.RoleCategoryDto;
import com.example.demo.domain.vo.RoleCheckVo;

@Mapper
public interface RoleCategoryRepository {

	@Select("select role_category.id, role_category.name from member join member_role_category "
			+ "on member.id = member_role_category.member_id "
			+ "join role_category "
			+ "on member_role_category.role_category_id = role_category.id where member.email = #{email}")
	public List<RoleCategoryDto> findRoleByEmail(String email);

	@Select("" +
			"SELECT t5.id, t5.name, case when t5.id = role_category_id then 'Y' else 'N' end as is_checked " +
			"FROM (select t1.id member_id, t3.name, t3.id from role_category t3 " +
			"CROSS JOIN (select id from member where id = #{memberId}) t1) t5 " +
			"LEFT JOIN member_role_category t7 on t5.id = t7.role_category_id and t5.member_id = t7.member_id " +
			""
	)
	public List<RoleCheckVo> findAllRoleByMemberId(int memberId);

	@Insert("insert into member_role_category (member_id, role_category_id) values(#{memberId}, #{roleCategoryId})")
	public int save(int memberId, int roleCategoryId);

	@Delete("delete from member_role_category where member_id=#{memberId} and role_category_id=#{roleCategoryId}")
	public int delete(int memberId, int roleCategoryId);

}