package com.example.demo.service.member;


import org.apache.ibatis.annotations.Insert;


public interface VisitorPerDayService {

	@Insert("insert into visitor_per_day (member_id, date_visited) values(#{memberId}, trunc(sysdate))")
	public int save(int memberId);

}
