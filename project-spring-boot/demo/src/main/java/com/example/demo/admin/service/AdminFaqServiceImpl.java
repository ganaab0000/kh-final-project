package com.example.demo.admin.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.cs.entity.FaqDto;
import com.example.demo.repository.AdminFaqRepository;

@Service
public class AdminFaqServiceImpl implements AdminFaqService{
	private static Logger log =
			LoggerFactory.getLogger(AdminFaqServiceImpl.class);
	
	@Autowired
	private AdminFaqRepository repository;

	@Override
	public void resister(FaqDto faqDto) throws Exception{
		// TODO Auto-generated method stub
		repository.resister(faqDto);
	}

	@Override
	public void update(FaqDto faqDto) throws Exception {
		// TODO Auto-generated method stub
		repository.update(faqDto);
	}

	@Override
	public void Fdelete(FaqDto faqDto) throws Exception {
		// TODO Auto-generated method stub
		repository.Fdelete(faqDto);
	}

	
	
	
}
