package com.example.demo.cs.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


import com.example.demo.cs.entity.FaqDto;
import com.example.demo.cs.entity.QnaDto;
import com.example.demo.cs.service.FaqService;
import com.example.demo.cs.service.QnaService;


@Controller
public class QnaController {
			
	private static final Logger log =
			LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private FaqService faqService;	
	
	@Autowired
	private QnaService qnaService; 
	
	

	
//	@GetMapping("/cs/answer")
//	public String answer() throws Exception{
//		
//	log.info("answer()");
//	
//	return "cs/answer";
//	}
	
	@GetMapping("/cs/question")
	public String answer(Model model) throws Exception {
		
		List<FaqDto> answerList = faqService.answerList();
				
		
		model.addAttribute("viewAll", answerList);		
		
//		log.info("answer() :"+answerList);
		
		return "cs/question";
		
	}
	
	@GetMapping("/cs/QWrite")
	public String qnaWriteForm() throws Exception{
		
		log.info("qnaWriteForm()");		
		
		return "cs/question";
	}
		
	@PostMapping("/cs/QWrite")
	public String qnaWrite(QnaDto qnaDto, Model model) throws Exception{
		
		log.info("qnaWrite()");
					
		model.addAttribute("msg", "등록!");
				
        qnaService.resister(qnaDto);	
      
				
		return "redirect:/cs/question";			
        }
	
	
	
//	@GetMapping("/cs/answer")
//	public String mail() {
//		return "cs/answer";
//	}
	
//	@PostMapping("/cs/answer")
//	public void sendMail(MailDto mailDto) {
//		qnaService.mailSend(mailDto);
//	}	
		
	
	
	
}
