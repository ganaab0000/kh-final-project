package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.entity.dto.MemberDto;

@Mapper
public interface TestXmlRepository {

	@Select("select * from member")
	public List<MemberDto> findAll();

}
