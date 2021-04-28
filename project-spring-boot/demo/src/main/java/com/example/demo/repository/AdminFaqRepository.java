package com.example.demo.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.example.demo.cs.entity.FaqDto;

@Mapper
@Repository
public interface AdminFaqRepository {
	
	@Insert("insert into faq (id, title, content, member_id) values (FAQ_ID_SEQ.nextVal, #{title}, #{content}, 1)")
	public void resister(FaqDto faqDto) throws Exception; 
	
	@Update("update faq set title=#{title}, content=#{content}, date_updated=sysdate where id=#{id}")
	public void update(FaqDto faqDto) throws Exception;
	
	@Update("update faq set IS_DELETED=#{isDeleted} where id=#{id}")
	public void Fdelete(FaqDto faqDto) throws Exception;	
}
