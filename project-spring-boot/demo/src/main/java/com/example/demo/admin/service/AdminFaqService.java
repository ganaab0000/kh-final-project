package com.example.demo.admin.service;

import com.example.demo.cs.entity.FaqDto;

public interface AdminFaqService {
	
	public void resister(FaqDto faqDto) throws Exception;
	
	public void update(FaqDto faqDto) throws Exception;
}
