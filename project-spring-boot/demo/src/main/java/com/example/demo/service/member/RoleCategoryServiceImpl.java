package com.example.demo.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.example.demo.domain.dto.RoleCategoryDto;
import com.example.demo.repository.RoleCategoryRepository;

public class RoleCategoryServiceImpl implements RoleCategoryService {

	@Autowired
	private RoleCategoryRepository roleCategoryRepository;

	@Override
	public List<RoleCategoryDto> findRoleByEmail(String email) {
		return roleCategoryRepository.findRoleByEmail(email);
	}

}
