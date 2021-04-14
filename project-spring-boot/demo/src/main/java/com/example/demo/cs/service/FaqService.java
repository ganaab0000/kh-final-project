package com.example.demo.cs.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.cs.entity.FaqDto;
import com.example.demo.cs.entity.PagingVO;
import com.example.demo.cs.entity.Search;


public interface FaqService {
	
		
	public List<FaqDto> list() throws Exception;
	
	// 게시물 총 갯수
	public int countFaq() throws Exception;

	// 페이징 처리 게시글 조회
	public List<FaqDto> selectFaq(PagingVO vo) throws Exception;
	
	public abstract ArrayList<FaqDto> searchList(Search search) throws Exception;
		
	public FaqDto detail(Integer id) throws Exception; 	
	
	public List<FaqDto> FaqResult(Search search) throws Exception;
}
