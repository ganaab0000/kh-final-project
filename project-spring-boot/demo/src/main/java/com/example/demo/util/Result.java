package com.example.demo.util;

import java.util.HashMap;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class Result {
	private String resultCode = "RSLT0000";
	private String resultMessage = "";
	private Object result = null;
	
	private Result() {}
	
	public Result(String resultCode, String resultMessage) {
		this.resultCode = resultCode;
		this.resultMessage = resultMessage;
		this.result = new HashMap<String, Object>();
	}
	
	public Result(String resultCode, String resultMessage, Object result) {
		this.resultCode = resultCode;
		this.resultMessage = resultMessage;
		this.result = result;
	}
	
	public String toJson() {
		ObjectMapper objMapper = new ObjectMapper();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("resultCode", resultCode);
		map.put("resultMessage", resultMessage);
		map.put("result", result);
		
		String rtn = "";
		try {
			rtn = objMapper.writeValueAsString(map);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rtn;
	}
}
