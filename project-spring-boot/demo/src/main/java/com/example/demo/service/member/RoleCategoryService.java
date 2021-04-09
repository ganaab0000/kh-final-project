package com.example.demo.service.member;

import java.util.List;

import com.example.demo.domain.dto.RoleCategoryDto;

public interface RoleCategoryService {
	public List<RoleCategoryDto> findRoleByEmail(String email);
}
