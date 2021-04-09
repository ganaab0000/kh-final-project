package com.example.demo.controller.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminNoticeController {
	private static final Logger log =
			LoggerFactory.getLogger(AdminNoticeController.class);
	
	/*
	 * @Autowired AdminNoticeService adminNoticeService;
	 */
	
	@GetMapping("notice/noticeWrite")
	public String noticeWrite() throws Exception{
		
		log.info("noticeWrite()");
		
		return "admin/notice/noticeWrite";
	}
}
