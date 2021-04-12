package com.example.demo.cs.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.cs.entity.FaqDto;
import com.example.demo.cs.entity.NoticeDto;
import com.example.demo.cs.entity.PagingVO;
import com.example.demo.cs.service.NoticeService;



@Controller
public class NoticeController {
	
	private static final Logger log =
			LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	
	@GetMapping("/cs/noticePage")
	public String noticeList(PagingVO vo, Model model 
			, @RequestParam(value="nowPage", required=false)String nowPage 
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception {		
	
		
		int total = noticeService.countNotice();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", noticeService.selectNotice(vo));
		return "cs/noticePage";
	}
	
	@GetMapping("/cs/noticeDetail")
	public String noticeDetail(int id, Model model) throws Exception{
		
		log.info("noticeDetail()");
		
		NoticeDto notice = noticeService.detail(id);
		
		model.addAttribute("notice", notice);
		
		return "cs/noticeDetail";
	}
	
}
