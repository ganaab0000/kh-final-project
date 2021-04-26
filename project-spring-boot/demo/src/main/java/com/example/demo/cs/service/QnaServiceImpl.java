package com.example.demo.cs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.cs.entity.FaqDto;
import com.example.demo.cs.entity.PagingVO;
import com.example.demo.cs.entity.QnaDto;
import com.example.demo.cs.entity.Search;
import com.example.demo.repository.FaqRepository;

@Service
public class QnaServiceImpl implements QnaService{
	
	@Autowired
	FaqRepository repository;
		
	@Override
	public List<FaqDto> list() throws Exception {
		// TODO Auto-generated method stub
		return repository.list();
	}

	@Override
	public void resister(QnaDto qnaDto) throws Exception {
		// TODO Auto-generated method stub
		repository.resister(qnaDto);
	}

	@Override
	public int countQna() throws Exception {
		// TODO Auto-generated method stub
		return repository.countQna();
	}

	@Override
	public List<QnaDto> selectQna(PagingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return repository.selectQna(vo);
	}

	@Override
	public QnaDto qRead(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return repository.qRead(id);
	}

	@Override
	public List<QnaDto> QnaResult(Search search) throws Exception {
		// TODO Auto-generated method stub
		return repository.QnaResult(search);
	}

	@Override
	public void confirmState(QnaDto qnaDto) throws Exception {
		// TODO Auto-generated method stub
		repository.confirmState(qnaDto);
	}

}
