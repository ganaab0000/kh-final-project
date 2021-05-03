package com.example.demo.repository;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface BlameRepository {
	public int insertBlame(HashMap<String, Object> parameters) throws DataAccessException;
}
