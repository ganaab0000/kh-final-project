package com.example.demo.cs.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.cs.entity.FaqDto;
import com.example.demo.cs.entity.PagingVO;
import com.example.demo.cs.entity.Search;
import com.example.demo.cs.service.FaqService;


@Controller
@RequestMapping("/cs")
public class FaqController {
	private static final Logger log =
			LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private FaqService faqService;
	
	@GetMapping("/faq")
	public void list(Model model) throws Exception {
		List<FaqDto> faqList = faqService.list();
		
		model.addAttribute("faqlist", faqList);
	
	}
	
	@GetMapping("faqPage")
	public String faqList(PagingVO vo, Model model 
			, @RequestParam(value="nowPage", required=false)String nowPage 
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception {
		
		int total = faqService.countFaq();
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
		model.addAttribute("viewAll", faqService.selectFaq(vo));
		return "cs/faqPage";
	}
	
	@GetMapping("seachResult")
	public String SeachResult() throws Exception{
		
		log.info("search");
		
		return "cs/seachResult";
	}
	
	@RequestMapping("seachResult2")
	public String FaqSearch(Search search, Model model) throws Exception {
		
		ArrayList<FaqDto> searchList = faqService.searchList(search);
		
		
		model.addAttribute("viewAll", searchList);
		model.addAttribute("search", search);
		
		log.info("FaqSearch() :"+searchList);
		
		return "cs/seachResult";
		
	}
	
	@GetMapping("faqDetail")
	public String faqDetail(int id, Model model) throws Exception{
		
		log.info("faqDetail()");
		
		FaqDto faq = faqService.detail(id);
		
		model.addAttribute("faq", faq);
		
		return "cs/faqDetail";
	}	

	@GetMapping("seachResult3")
	public String FaqResult(Search search , Model model 
			, @RequestParam(value="nowPage", required=false)String nowPage 
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception {
		
		List<FaqDto> FaqResult = faqService.FaqResult(search);
		
		model.addAttribute("viewAll", FaqResult);	
		model.addAttribute("search", search);
		
		int total = faqService.countFaq();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		PagingVO vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				
		 model.addAttribute("paging", vo);
				
		log.info("FaqResult() :"+FaqResult);
		
		return "cs/seachResult2";
	}
}
