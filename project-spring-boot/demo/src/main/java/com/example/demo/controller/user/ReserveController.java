package com.example.demo.controller.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.config.auth.dto.SessionMember;
import com.example.demo.controller.exception.InternalErrorCodeException;
import com.example.demo.domain.dto.ReserveDto;
import com.example.demo.service.reserve.ReserveServiceImpl;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class ReserveController {
	
	@Autowired
    private ReserveServiceImpl reserveServiceImpl;
	
	//예약 페이지
	@GetMapping("/project/reserve/{id}")
	public String index(@PathVariable("id") String id, Model model, HttpSession session, int projectId, int additionalBillings, int rewardPrice, String rewardName) {
		String name = rewardName.replace(" ", "_");
		log.info("projectId : " + id);
		SessionMember member = (SessionMember) session.getAttribute("member");
		if (member == null) {
			throw new InternalErrorCodeException("101");
		}
		model.addAttribute("additionalBillings", additionalBillings);
		model.addAttribute("rewardPrice", rewardPrice);
		model.addAttribute("rewardName", name);
		model.addAttribute("memberId", member.getId());
		model.addAttribute("projectId", projectId);
		return "reserve/reserve";
	}
	//예약 신청
	@ResponseBody
	@RequestMapping("/project/reserve/reserve")
	public String insertReserve(String billingkey, int additionalBillings, String receiverName, int receiverPhone, String receiverAddress, String requestForDelivery, int memberId, int projectId) {
		log.info("/project/reserve/reserve");
		reserveServiceImpl.insertReserve(billingkey, additionalBillings, receiverName, receiverPhone, receiverAddress, requestForDelivery, memberId, projectId);

		return null;
	}
	//예약 확인
	@PostMapping("/project/reserve/find")
	public String findByMemberId(int memberId, HttpSession session) {
		log.info("/reserve/find");
		SessionMember member = (SessionMember) session.getAttribute("member");
		if (member == null) {
			throw new InternalErrorCodeException("101");
		}
		reserveServiceImpl.findByMemberId(memberId);

		return "redirect:/reserve";
	}
	//예약 취소
	@PostMapping("/project/reserve/cancel")
	public String deleteReserve(int memberId, int projectId) {
		log.info("/reserve/cancel");
		reserveServiceImpl.deleteReserve(memberId, projectId);

		return "redirect:/reserve";
	}
}
