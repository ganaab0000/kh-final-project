package com.example.demo.controller.reserve;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.domain.dto.ReserveDto;
import com.example.demo.service.reserve.ReserveServiceImpl;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class ReserveController {
	
	@Autowired
    private ReserveServiceImpl reserveServiceImpl;
	
	
	@GetMapping("/reserve")
	public String index() {
		log.info("/reserve");
		return "reserve/reserve";
	}
	
	@GetMapping("/reserve/import")
	public String port() {
		log.info("/reserve");
		return "reserve/import";
	}
	
	//예약 신청
	@PostMapping("/reserve/reserve")
	public String insertReserve(ReserveDto reserveDto) {
		log.info("/reserve/reserve");
		log.info(reserveDto.toString());
		reserveServiceImpl.insertReserve(reserveDto);

		return "redirect:/reserve/import";
	}
	//예약 확인
	@PostMapping("/reserve/find")
	public String findByMemberId(int memberId) {
		log.info("/reserve/find");
		reserveServiceImpl.findByMemberId(memberId);

		return "redirect:/reserve";
	}
	//예약 취소
	@PostMapping("/reserve/cancel")
	public String deleteReserve(int memberId, int projectId) {
		log.info("/reserve/cancel");
		reserveServiceImpl.deleteReserve(memberId, projectId);

		return "redirect:/reserve";
	}
}
