package com.example.demo.service;

import java.util.List;

import com.example.demo.entity.dto.MemberDto;

public interface LoginService {

	public List<MemberDto> findAll();
}
