package com.example.demo.admin.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.AdminBlameRepository;

@Service
public class AdminBlameServiceImpl implements AdminBlameService {
	
	@Autowired
	private AdminBlameRepository mapper;

	@Override
	public int getBlameListCount(HashMap<String, Object> parameters) throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectBlameListCount(parameters);
	}

	@Override
	public List<HashMap<String, Object>> getBlameList(HashMap<String, Object> parameters) throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectBlameList(parameters);
	}

	@Override
	public HashMap<String, Object> getBlameInfo(HashMap<String, Object> parameters) throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectBlameInfo(parameters);
	}

	@Override
	public int createBlameReply(HashMap<String, Object> parameters) throws Exception {
		// TODO Auto-generated method stub
		return mapper.insertBlameReply(parameters);
	}

	@Override
	public int modifyBlameReply(HashMap<String, Object> parameters) throws Exception {
		// TODO Auto-generated method stub
		return mapper.updateBlameReply(parameters);
	}

}
