package com.example.demo.admin.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.BlameRepository;

@Service
public class BlameServiceImpl implements BlameService {
	
	@Autowired
	private BlameRepository mapper;

	@Override
	public int createBlame(HashMap<String, Object> parameters) throws Exception {
		// TODO Auto-generated method stub
		return mapper.insertBlame(parameters);
	}

}
