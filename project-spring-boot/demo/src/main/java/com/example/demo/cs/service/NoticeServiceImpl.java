package com.example.demo.cs.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.cs.entity.NoticeDto;
import com.example.demo.cs.entity.PagingVO;
import com.example.demo.repository.NoticeRepository;


@Service
public class NoticeServiceImpl implements NoticeService{
	
	private static Logger log =
			LoggerFactory.getLogger(NoticeServiceImpl.class);
	
	@Autowired
	NoticeRepository repository;
		
	
	@Override
	public List<NoticeDto> list() throws Exception {
		// TODO Auto-generated method stub
		return repository.list();
	}


	@Override
	public int countNotice() throws Exception {
		// TODO Auto-generated method stub
		return repository.countNotice();
	}


	@Override
	public List<NoticeDto> selectNotice(PagingVO vo) throws Exception{
		// TODO Auto-generated method stub
		return repository.selectNotice(vo);
	}


	@Override
	public NoticeDto detail(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return repository.detail(id);
	}
	
}
