package com.example.demo.controller.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.config.auth.dto.SessionMember;
import com.example.demo.controller.exception.InternalErrorCodeException;
import com.example.demo.domain.dto.NotificationDto;
import com.example.demo.repository.NotificationRepository;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class NotificationController {
	@Autowired
	NotificationRepository notificationRepository;

	// 메인 페이지
	@GetMapping("/member/notification")
	public String index(NotificationDto notificationDto, HttpSession session, Integer pageNumber, Integer pageSize, Model model) {
		log.info("/notification : ");
		SessionMember member = (SessionMember) session.getAttribute("member");
		if (member == null)
			throw new InternalErrorCodeException("101");
		int memberId = member.getId();
		notificationDto.setMemberId(memberId);
		if(pageNumber == null) pageNumber = 1;
		if(pageSize == null) pageSize = 10;

		int blockSize = 10;
		int startBlock = (pageNumber-1) / blockSize * blockSize + 1;
		int endBlock = startBlock + blockSize - 1;
		int count = notificationRepository.getCountNotificationList(notificationDto, pageNumber, pageSize);

		int fixedEndBlock = (count + pageSize - 1) / pageSize;
		if(endBlock > fixedEndBlock){
			endBlock = fixedEndBlock;
		}

		model.addAttribute("countNotificationList", count);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("fixedEndBlock", fixedEndBlock);
		model.addAttribute("notificationList", notificationRepository.getNotificationList(notificationDto, pageNumber, pageSize));

		return "user/notification/index";
	}

}
