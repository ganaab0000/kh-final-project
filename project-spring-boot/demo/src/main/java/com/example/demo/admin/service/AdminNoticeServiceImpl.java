package com.example.demo.admin.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.cs.entity.NoticeDto;
import com.example.demo.repository.AdminNoticeRepository;

@Service
public class AdminNoticeServiceImpl implements AdminNoticeService{
	private static Logger log =
			LoggerFactory.getLogger(AdminNoticeServiceImpl.class);
	
	@Autowired
	private AdminNoticeRepository repository;

	@Override
	public void resister(NoticeDto noticeDto) throws Exception{
		// TODO Auto-generated method stub
		repository.resister(noticeDto);
	}

	@Override
	public void update(NoticeDto noticeDto) throws Exception {
		// TODO Auto-generated method stub
		repository.update(noticeDto);
	}

	@Override
	public void Ndelete(NoticeDto noticeDto) throws Exception {
		// TODO Auto-generated method stub
		repository.Ndelete(noticeDto);
	}

	
	
	
}
