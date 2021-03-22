package com.example.demo.service;

import java.util.List;

import com.example.demo.entity.dto.MemberSnakeDto;

public interface MemberService {

	public List<MemberSnakeDto> findAll();
}
