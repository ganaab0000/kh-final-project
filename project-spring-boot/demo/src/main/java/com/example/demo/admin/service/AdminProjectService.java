package com.example.demo.admin.service;

import java.util.HashMap;
import java.util.List;

public interface AdminProjectService {
	public int getProjectListCount(HashMap<String, Object> parameters) throws Exception;
	public List<HashMap<String, Object>> getProjectList(HashMap<String, Object> parameters) throws Exception;
	public int getProjectListEndCount() throws Exception;
	public List<HashMap<String, Object>> getProjectListEnd(HashMap<String, Object> parameters) throws Exception;
	public HashMap<String, Object> getProjectInfo(HashMap<String, Object> parameters) throws Exception;
	public int modifyProjectStatus(HashMap<String, Object> parameters) throws Exception;
}
