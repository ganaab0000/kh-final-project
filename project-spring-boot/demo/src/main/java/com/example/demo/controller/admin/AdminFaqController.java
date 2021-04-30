package com.example.demo.controller.admin;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.admin.service.AdminFaqService;
import com.example.demo.cs.entity.FaqDto;
import com.example.demo.cs.entity.PagingVO;
import com.example.demo.cs.entity.Search;
import com.example.demo.cs.service.FaqService;



@Controller
public class AdminFaqController {
	
	private static final Logger log =
			LoggerFactory.getLogger(AdminFaqController.class);
	
	
	 @Autowired 
	 AdminFaqService adminFaqService;
	 
	 @Autowired
	 FaqService faqService;
	
	 @GetMapping("/admin/faqList")
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
			return "admin/faq/faqList";
		}
	 
	 @GetMapping("/admin/fRead")
		public String faqDetail(int id, Model model) throws Exception{
			
			log.info("faqRead()");
			
			FaqDto faq = faqService.detail(id);
			
			model.addAttribute("faq", faq);
			
			return "admin/faq/fAdminRead";
		}	
	
	@GetMapping("/admin/faqWrite")
	public String faqWriteForm() throws Exception{
		
		log.info("faqWriteForm()");		
		
		return "admin/faq/faqWrite";
	}
	
	@PostMapping("/admin/faqWrite")
	public String faqWrite(FaqDto faqDto, Model model) throws Exception{
		
		adminFaqService.resister(faqDto);
		
		model.addAttribute("msg", "등록!");
		
		return "redirect:faqList";			
	}
	
	@GetMapping("/admin/fModify")
	public String getModify(int id, Model model) throws Exception {
		log.info("getModify()");
		
		model.addAttribute(faqService.detail(id));
		
		return "admin/faq/fModify";
	}
	
	@PostMapping("/admin/fModify")
	public String postModify(FaqDto faqDto, Model model) throws Exception {
		log.info("postModify()");
		
		adminFaqService.update(faqDto);
		
		model.addAttribute("msg", "수정완료");
		
		return "redirect:/admin/faqList";
	}
	
	@RequestMapping("admin/fAdminSeach")
	public String FaqSearch(Search search, Model model) throws Exception {
		
		ArrayList<FaqDto> searchList = faqService.searchList(search);
		
		
		model.addAttribute("viewAll", searchList);
		model.addAttribute("search", search);
		
		log.info("FaqSearch() :"+searchList);
		
		return "admin/faq/fAdminSeach";
		
	}
	
	 @PostMapping("/admin/FDelete")
		public String faqDelete(FaqDto faqDto, Model model) throws Exception{
		
		 log.info("faqDelete()");
		 
		 adminFaqService.Fdelete(faqDto);		 
		 
		 model.addAttribute("msg", "삭제완료");
		 
		return "redirect:/admin/faqList";	
		 
	 }
}
