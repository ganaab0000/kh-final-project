package com.example.demo.admin.service;

import java.util.HashMap;
import java.util.List;

public interface AdminBlameService {
	public int getBlameListCount(HashMap<String, Object> parameters) throws Exception;
	public List<HashMap<String, Object>> getBlameList(HashMap<String, Object> parameters) throws Exception;
	public HashMap<String, Object> getBlameInfo(HashMap<String, Object> parameters) throws Exception;
	public int createBlameReply(HashMap<String, Object> parameters) throws Exception;
	public int modifyBlameReply(HashMap<String, Object> parameters) throws Exception;
}
