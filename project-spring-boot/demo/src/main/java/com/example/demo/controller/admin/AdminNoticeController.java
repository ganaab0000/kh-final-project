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

import com.example.demo.admin.service.AdminNoticeService;
import com.example.demo.cs.entity.FaqDto;
import com.example.demo.cs.entity.NoticeDto;
import com.example.demo.cs.entity.PagingVO;
import com.example.demo.cs.entity.Search;
import com.example.demo.cs.service.NoticeService;

@Controller
public class AdminNoticeController {
	
	private static final Logger log =
			LoggerFactory.getLogger(AdminNoticeController.class);
	
	
	 @Autowired 
	 AdminNoticeService adminNoticeService;
	 
	 @Autowired
	 NoticeService noticeService;
	
	 @GetMapping("/admin/noticeList")
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
			return "admin/notice/noticeList";
		}
	 
	 @GetMapping("/admin/nRead")
		public String noticeDetail(int id, Model model) throws Exception{
			
			log.info("noticeDetail()");
			
			NoticeDto notice = noticeService.detail(id);
			
			model.addAttribute("notice", notice);
			
			return "admin/notice/nAdminRead";
		}	
	
	@GetMapping("/admin/noticeWrite")
	public String noticeWriteForm() throws Exception{
		
		log.info("noticeWriteForm()");		
		
		return "admin/notice/noticeWrite";
	}
	
	@PostMapping("/admin/noticeWrite")
	public String noticeWrite(NoticeDto noticeDto, Model model) throws Exception{
		
		adminNoticeService.resister(noticeDto);
		
		model.addAttribute("msg", "등록!");
		
		return "redirect:cs/noticePage";			
	}
	
	@GetMapping("/admin/nModify")
	public String getModify(int id, Model model) throws Exception {
		log.info("getModify()");
		
		model.addAttribute(noticeService.detail(id));
		
		return "admin/notice/nModify";
	}
	
	@PostMapping("/admin/nModify")
	public String postModify(NoticeDto noticeDto, Model model) throws Exception {
		log.info("postModify()");
		
		adminNoticeService.update(noticeDto);
		
		model.addAttribute("msg", "수정완료");
		
		return "redirect:/admin/noticeList";
	}
	
	@RequestMapping("admin/nAdminSeach")
	public String FaqSearch(Search search, Model model) throws Exception {
		
		ArrayList<NoticeDto> searchList = noticeService.searchList(search);
		
		
		model.addAttribute("viewAll", searchList);
		model.addAttribute("search", search);
		
		log.info("FaqSearch() :"+searchList);
		
		return "admin/notice/nAdminSeach";
		
	}
	
}
