package com.example.demo.controller.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import com.example.demo.domain.vo.ProjectVo;
import com.example.demo.service.EmailServiceImpl;
import com.example.demo.service.NotificationServiceImpl;
import com.example.demo.service.member.ConfirmEmailServiceImpl;
import com.example.demo.service.member.MemberServiceImpl;
import com.example.demo.service.member.UserDetailsServiceImpl;
import com.example.demo.service.reserve.ReserveServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class ReserveController {
	
	@Autowired
    private ReserveServiceImpl reserveServiceImpl;
	
	//예약 페이지
	@GetMapping("/project/reserve/{id}")
	public String index(@PathVariable("id") String id, Model model, HttpSession session, int projectId, String additionalBilling, int rewardPrice, String rewardName) {
		String name = rewardName.replace(" ", "_");
		String additionalBillings = additionalBilling.replace(" ", "0");
		log.info("projectId : " + id);
		SessionMember member = (SessionMember) session.getAttribute("member");
		if (member == null)
			throw new InternalErrorCodeException("101");
		model.addAttribute("additionalBillings", additionalBillings);
		model.addAttribute("rewardPrice", rewardPrice);
		model.addAttribute("rewardName", name);
		model.addAttribute("memberId", member.getId());
		model.addAttribute("projectId", projectId);
		return "user/reserve/reserve";
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
	@GetMapping("/reserve/find")
	public String findByMemberId(Model model, HttpSession session) {
		SessionMember member = (SessionMember) session.getAttribute("member");
		if (member == null)
			throw new InternalErrorCodeException("101");
		List<ReserveDto> reserveDto = reserveServiceImpl.findByMemberId(member.getId());
		model.addAttribute("reserve", reserveDto);
		return "user/reserve/reserveComplete";
	}
	//예약 취소
	@PostMapping("/reserve/cancel")
	public String deleteReserve(int memberId, int projectId) {
		log.info("/reserve/cancel");
		reserveServiceImpl.deleteReserve(memberId, projectId);

		return "redirect:/user/reserve/reserveComplete";
	}
}
