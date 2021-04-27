package com.example.demo.cs.service;

import java.util.List;

import com.example.demo.cs.entity.FaqDto;
import com.example.demo.cs.entity.PagingVO;
import com.example.demo.cs.entity.QnaDto;
import com.example.demo.cs.entity.Search;

public interface QnaService {
	public List<FaqDto> list() throws Exception;
	
	public void resister(QnaDto qnaDto) throws Exception;
	
	public int countQna() throws Exception;
	
	public List<QnaDto> selectQna(PagingVO vo) throws Exception;
	
	public QnaDto qRead(Integer id) throws Exception; 
	
	public List<QnaDto> QnaResult(Search search) throws Exception;
	
	public void confirmState(QnaDto qnaDto) throws Exception;
	
	public void delete(QnaDto qnaDto) throws Exception;
//	 public int saveFile(QnaFileVO file) throws Exception;
}
