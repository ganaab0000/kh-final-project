package com.example.demo.repository;

import java.util.Optional;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.domain.dto.VisitorCountPerDayDto;

@Mapper
public interface VisitorCountPerDayRepository {

	@Select("select * from visitor_count_per_day where date_visited = trunc(sysdate)")
	public Optional<VisitorCountPerDayDto> findBySysdate();

	@Insert("insert into visitor_count_per_day (count, DATE_VISITED) values (1, trunc(sysdate))")
	public int save();

	@Update("update visitor_count_per_day set count=count+1 where date_visited = trunc(sysdate)")
	public int update();

}