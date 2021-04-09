package com.example.demo.repository;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.example.demo.cs.entity.FaqDto;
import com.example.demo.cs.entity.NoticeDto;
import com.example.demo.cs.entity.PagingVO;


@Mapper
@Repository
public interface NoticeRepository {
	
	@Select("select * from notice	where is_deleted = 'N' 	order by ID desc")
	public List<NoticeDto> list() throws Exception;
	
	@Select("SELECT COUNT(*) FROM NOTICE where is_deleted = 'N'")
	public int countNotice() throws Exception;
	
	@Select("SELECT * FROM (SELECT ROWNUM RN, A.* "
			+ "FROM (SELECT * FROM NOTICE WHERE is_deleted = 'N' ORDER BY ID DESC) A) "
			+ "WHERE RN BETWEEN #{start} AND #{end}")
	public List<NoticeDto> selectNotice(PagingVO vo);
	
	@Select("select id, title, content, date_created, date_updated from notice where id= #{id} ")
	public NoticeDto detail(Integer id) throws Exception;
}
