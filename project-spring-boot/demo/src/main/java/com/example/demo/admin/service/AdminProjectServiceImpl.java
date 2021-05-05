package com.example.demo.admin.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.AdminProjectRepository;

@Service
public class AdminProjectServiceImpl implements AdminProjectService {
	
	@Autowired
	private AdminProjectRepository mapper;

	@Override
	public int getProjectListCount(HashMap<String, Object> parameters) throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectProjectListCount(parameters);
	}

	@Override
	public List<HashMap<String, Object>> getProjectList(HashMap<String, Object> parameters) throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectProjectList(parameters);
	}

	@Override
	public int getProjectListEndCount() throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectProjectListEndCount();
	}

	@Override
	public List<HashMap<String, Object>> getProjectListEnd(HashMap<String, Object> parameters) throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectProjectListEnd(parameters);
	}

	@Override
	public HashMap<String, Object> getProjectInfo(HashMap<String, Object> parameters) throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectProjectInfo(parameters);
	}

	@Override
	public int modifyProjectStatus(HashMap<String, Object> parameters) throws Exception {
		// TODO Auto-generated method stub
		return mapper.updateProjectStatus(parameters);
	}

}
