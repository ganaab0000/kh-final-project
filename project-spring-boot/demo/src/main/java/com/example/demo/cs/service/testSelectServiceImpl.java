package com.example.demo.cs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.cs.entity.FaqDto;
import com.example.demo.repository.FaqRepository;

@Service
public class testSelectServiceImpl implements testSelectService{
	
	@Autowired
	FaqRepository repository;
	
	@Override
	public List<FaqDto> list() throws Exception {
		// TODO Auto-generated method stub
		return repository.list();
	}

}
