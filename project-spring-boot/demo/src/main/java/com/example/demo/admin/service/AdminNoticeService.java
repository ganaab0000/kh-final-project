package com.example.demo.admin.service;

import com.example.demo.cs.entity.NoticeDto;


public interface AdminNoticeService {
	
	public void resister(NoticeDto noticeDto) throws Exception;
	
	public void update(NoticeDto noticeDto) throws Exception;	
	
	public void Ndelete(NoticeDto noticeDto) throws Exception;
}
