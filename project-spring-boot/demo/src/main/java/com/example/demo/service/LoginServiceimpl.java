package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.dto.MemberDto;
import com.example.demo.repository.MemberRepository;

@Service
public class LoginServiceimpl implements LoginService {

	@Autowired
	private MemberRepository memberRepository;

	@Override
	public List<MemberDto> findAll() {
		return memberRepository.findAll();
	}

}
