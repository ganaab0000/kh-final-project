package com.example.demo.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface VisitorPerDayRepository {

	@Insert("insert into visitor_per_day (member_id, date_visited) values(#{memberId}, trunc(sysdate))")
	public int save(int memberId);

}