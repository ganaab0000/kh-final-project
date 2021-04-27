package com.example.demo.controller.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.cs.entity.NoticeDto;
import com.example.demo.cs.entity.PagingVO;
import com.example.demo.cs.entity.QnaDto;
import com.example.demo.cs.service.QnaService;

@Controller
public class AdminQnaController {
	
	private static final Logger log =
			LoggerFactory.getLogger(AdminQnaController.class);
	
	@Autowired
	QnaService qnaService;
	
	
	 @GetMapping("/admin/qnaList")
		public String noticeList(PagingVO vo, Model model 
				, @RequestParam(value="nowPage", required=false)String nowPage 
				, @RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception {
			
			int total = qnaService.countQna();
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
			model.addAttribute("viewAll", qnaService.selectQna(vo));
			return "admin/faq/qnaList";
		}
	 
	 @GetMapping("/admin/qRead")
		public String qnaDetail(int id, Model model) throws Exception{
			
			log.info("qnaDetail()");
			
			QnaDto qna = qnaService.qRead(id);
			
			model.addAttribute("qna", qna);
			
			return "admin/faq/QnaRead";
		}	
	 	 
	 @PostMapping("/admin/QisState")
	 public String confirmState(QnaDto qnaDto, Model model) throws Exception{
		 
		 log.info("confirmState()");
		 
		 qnaService.confirmState(qnaDto);		 
		 
		 model.addAttribute("msg", "수정완료");
		 
		return "redirect:/admin/qnaList";		 
	 }
	 @PostMapping("/admin/QDelete")
		public String qnaDelete(QnaDto qnaDto, Model model) throws Exception{
		
		 log.info("qnaDelete()");
		 
		 qnaService.delete(qnaDto);		 
		 
		 model.addAttribute("msg", "삭제완료");
		 
		return "redirect:/admin/qnaList";	
		 
	 }

}
