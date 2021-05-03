package com.example.demo.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface AdminProjectRepository {
	public int selectProjectListCount(HashMap<String, Object> parameters) throws DataAccessException;
	public List<HashMap<String, Object>> selectProjectList(HashMap<String, Object> parameters) throws DataAccessException;
	public int selectProjectListEndCount() throws DataAccessException;
	public List<HashMap<String, Object>> selectProjectListEnd(HashMap<String, Object> parameters) throws DataAccessException;
	public HashMap<String, Object> selectProjectInfo(HashMap<String, Object> parameters) throws DataAccessException;
	public int updateProjectStatus(HashMap<String, Object> parameters) throws DataAccessException;
}
