package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.domain.dto.RoleCategoryDto;

@Mapper
public interface RoleCategoryRepository {

	@Select("select role_category.name from member left join member_role_category "
			+ "on member.id = member_role_category.member_id "
			+ "left join role_category "
			+ "on member_role_category.role_category_id = role_category.id where member.email = #{email}")
	public List<RoleCategoryDto> findRoleByEmail(String email);

}