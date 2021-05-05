package com.example.demo.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface AdminBlameRepository {
	public int selectBlameListCount(HashMap<String, Object> parameters) throws DataAccessException;
	public List<HashMap<String, Object>> selectBlameList(HashMap<String, Object> parameters) throws DataAccessException;
	public HashMap<String, Object> selectBlameInfo(HashMap<String, Object> parameters) throws DataAccessException;
	public int insertBlameReply(HashMap<String, Object> parameters) throws DataAccessException;
	public int updateBlameReply(HashMap<String, Object> parameters) throws DataAccessException;
}
