package com.example.demo.repository;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;


@Mapper
public interface TestAnnotationRepository {

	@Select("select 1 + 1 from dual")
	int selectCalc() throws Exception;

}
