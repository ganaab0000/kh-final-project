package com.example.demo.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.domain.dto.MemberDto;
import com.example.demo.service.member.AdminMemberServiceImpl;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class MemberAdminController {
	@Autowired
	AdminMemberServiceImpl adminMemberServiceImpl;

	// 메인 페이지
	@GetMapping("/admin/member")
	public String index(MemberDto memberDto, Integer pageNumber, Integer pageSize, Model model) {
		log.info("/admin/member : " + memberDto.toString());
		if (pageNumber == null)
			pageNumber = 1;
		if (pageSize == null)
			pageSize = 10;

		int blockSize = 10;
		int startBlock = (pageNumber - 1) / blockSize * blockSize + 1;
		int endBlock = startBlock + blockSize - 1;
		int count = adminMemberServiceImpl.getCountMemberDetailList(memberDto, pageNumber, pageSize);

		int fixedEndBlock = (count + pageSize - 1) / pageSize;
		if (endBlock > fixedEndBlock) {
			endBlock = fixedEndBlock;
		}

		model.addAttribute("countMemberDetailList", count);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("fixedEndBlock", fixedEndBlock);
		model.addAttribute("memberDetailList",
				adminMemberServiceImpl.getMemberDetailList(memberDto, pageNumber, pageSize));

		return "admin/member/index";
	}

}
