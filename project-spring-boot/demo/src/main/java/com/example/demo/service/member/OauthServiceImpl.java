package com.example.demo.service.member;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.domain.dto.OauthDto;
import com.example.demo.repository.OauthRepository;

@Service
public class OauthServiceImpl implements OauthService {

	@Autowired
	private OauthRepository oauthRepository;

	@Override
	public int save(OauthDto oauthDto) {
		return oauthRepository.save(oauthDto);
	}


}
