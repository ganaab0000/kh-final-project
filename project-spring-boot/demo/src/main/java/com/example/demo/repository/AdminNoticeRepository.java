package com.example.demo.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.example.demo.cs.entity.NoticeDto;

@Mapper
@Repository
public interface AdminNoticeRepository {
	
	@Insert("insert into notice (id, title, content, member_id) values (NOTICE_ID_SEQ.nextVal, #{title}, #{content}, #{memberId})")
	public void resister(NoticeDto noticeDto) throws Exception; 
	
	@Update("update notice set title=#{title}, content=#{content}, date_updated=sysdate where id=#{id}")
	public void update(NoticeDto noticeDto) throws Exception;
}
