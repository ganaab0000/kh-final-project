package com.example.demo.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.domain.dto.RoleCategoryDto;
import com.example.demo.domain.vo.RoleCheckVo;
import com.example.demo.repository.RoleCategoryRepository;

@Service
public class RoleCategoryServiceImpl implements RoleCategoryService {

	@Autowired
	private RoleCategoryRepository roleCategoryRepository;

	@Override
	public List<RoleCategoryDto> findRoleByEmail(String email) {
		return roleCategoryRepository.findRoleByEmail(email);
	}

	@Override
	public List<RoleCheckVo> findAllRoleByMemberId(int memberId) {
		return roleCategoryRepository.findAllRoleByMemberId(memberId);
	}

	@Override
	public int save(int memberId, int roleCategoryId) {
		return roleCategoryRepository.save(memberId, roleCategoryId);
	}

	@Override
	public int delete(int memberId, int roleCategoryId) {
		return roleCategoryRepository.delete(memberId, roleCategoryId);
	}

}
