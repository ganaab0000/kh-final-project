package com.example.demo.cs.service;


import java.util.List;


import com.example.demo.cs.entity.NoticeDto;
import com.example.demo.cs.entity.PagingVO;

public interface NoticeService {
	
	public List<NoticeDto> list() throws Exception;
	
	// 게시물 총 갯수
	public int countNotice() throws Exception;

	// 페이징 처리 게시글 조회
	public List<NoticeDto> selectNotice(PagingVO vo) throws Exception;
	
	public NoticeDto detail(Integer id) throws Exception; 
}
