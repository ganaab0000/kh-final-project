package com.example.demo.controller.admin;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.admin.service.BlameService;
import com.example.demo.util.Result;

@Controller
@RequestMapping("/api/blame")
public class BlameController {
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private BlameService service;
	
	@RequestMapping("/regist")
	public @ResponseBody String regist(@RequestBody HashMap<String, Object> parameters) throws Exception {
		Result result = new Result("RSLT0000", "SUCCESS");
		
		try {
			
			if (parameters != null && parameters.size() > 0) {
				
				int successCnt = service.createBlame(parameters);
				
				if (successCnt <= 0) {
					result= new Result("RSLT7777", "등록에 실패하였습니다.");
				}
				
			} else {
				result= new Result("RSLT8888", "파라메터가 누락되었습니다.");
			}
			
		} catch (Exception e) {
		}
		
		return result.toJson();
	}
}
