package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.dto.MemberSnakeDto;
import com.example.demo.repository.MemberRepository;

@Service
public class MemberServiceimpl implements MemberService {

	@Autowired
	private MemberRepository memberRepository;

	@Override
	public List<MemberSnakeDto> findAll() {
		return memberRepository.findAll();
	}

}
