package com.example.demo.cs.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.cs.entity.FaqDto;
import com.example.demo.cs.entity.PagingVO;
import com.example.demo.cs.entity.Search;
import com.example.demo.repository.FaqRepository;

@Service
public class FaqServiceImpl implements FaqService{
	private static Logger log =
			LoggerFactory.getLogger(FaqServiceImpl.class);
	
	@Autowired
	FaqRepository repository;	

	
	
	@Override
	public List<FaqDto> list() throws Exception {
		// TODO Auto-generated method stub
		return repository.list();
	}
	
	@Override
	public int countFaq() throws Exception {
		// TODO Auto-generated method stub
		return repository.countFaq();
	}


	@Override
	public List<FaqDto> selectFaq(PagingVO vo) throws Exception{
		// TODO Auto-generated method stub
		return repository.selectFaq(vo);
	}

	@Override
	public ArrayList<FaqDto> searchList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return repository.searchList(search);
	}

	@Override
	public FaqDto detail(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return repository.detail(id);
	}

	@Override
	public List<FaqDto> FaqResult( Search search) throws Exception {
		// TODO Auto-generated method stub
		return repository.FaqResult(search);
	}

	
	
}
