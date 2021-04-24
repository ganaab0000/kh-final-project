package com.example.demo.service.member;

import java.util.List;

import com.example.demo.domain.dto.RoleCategoryDto;
import com.example.demo.domain.vo.RoleCheckVo;

public interface RoleCategoryService {
	public List<RoleCategoryDto> findRoleByEmail(String email);

	public List<RoleCheckVo> findAllRoleByMemberId(int memberId);

	public int save(int memberId, int roleCategoryId);

	public int delete(int memberId, int roleCategoryId);
}
