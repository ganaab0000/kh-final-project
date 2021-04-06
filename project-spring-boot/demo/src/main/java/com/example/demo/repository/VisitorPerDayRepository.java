package com.example.demo.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface VisitorPerDayRepository {

	@Insert("insert into VISITOR_PER_DAY (memberId) values(#{memberId})")
	public int save(int memberId);

}