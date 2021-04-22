package com.example.demo.cs.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.cs.entity.FaqDto;
import com.example.demo.cs.entity.Search;
import com.example.demo.cs.service.FaqService;

@Controller
public class AnswerController {
			
	private static final Logger log =
			LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private FaqService faqService;
	
//	@GetMapping("/cs/answer")
//	public String answer() throws Exception{
//		
//	log.info("answer()");
//	
//	return "cs/answer";
//	}
	
	@GetMapping("/cs/answer")
	public String answer(Model model) throws Exception {
		
		List<FaqDto> answerList = faqService.answerList();
				
		
		model.addAttribute("viewAll", answerList);		
		
		log.info("answer() :"+answerList);
		
		return "cs/answer";
		
	}
}
