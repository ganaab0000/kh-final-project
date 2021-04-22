package com.example.demo.controller.admin;


import java.util.Date;

import org.apache.ibatis.annotations.Select;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.domain.dto.VisitorCountPerDayDto;
import com.example.demo.service.StatServiceImpl;
import com.google.gson.Gson;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@AllArgsConstructor
public class HomeAdminController {
	private StatServiceImpl statServiceImpl;

	@GetMapping("/admin")
	public String getSignin(@DateTimeFormat(pattern="yyyy-MM-dd") Date startDate,
			@DateTimeFormat(pattern="yyyy-MM-dd") Date endDate, Model model) {
		if(startDate == null) {
			startDate = new Date(0); //1970/1/1
		}
		if(endDate == null) {
			endDate = new Date();
		}
		log.info("/admin" +  " : " + startDate.toString() + " : " + endDate.toString());
	    Gson gson = new Gson();

		model.addAttribute("propCountMemberCreated", statServiceImpl.getCountMemberCreated(startDate, endDate));
		model.addAttribute("propCountMemberDeleted", statServiceImpl.getCountMemberDeleted(startDate, endDate));
		model.addAttribute("propCountMemberBlocked", statServiceImpl.getCountMemberBlocked(startDate, endDate));

		model.addAttribute("propCountProjectByStatus1", statServiceImpl.getCountProjectByStatus(startDate, endDate, 1));
		model.addAttribute("propCountProjectByStatus2", statServiceImpl.getCountProjectByStatus(startDate, endDate, 2));
		model.addAttribute("propCountProjectByStatus3", statServiceImpl.getCountProjectByStatus(startDate, endDate, 3));

		model.addAttribute("propCountProjectBlame", statServiceImpl.getCountProjectBlame(startDate, endDate));

		model.addAttribute("propCountReserveByStatus1", statServiceImpl.getCountReserveByStatus(startDate, endDate, 1));
		model.addAttribute("propCountReserveByStatus2", statServiceImpl.getCountReserveByStatus(startDate, endDate, 2));
		model.addAttribute("propCountReserveByStatus3", statServiceImpl.getCountReserveByStatus(startDate, endDate, 3));

		model.addAttribute("propCountGroupProjectCategory", gson.toJson(statServiceImpl.getCountGroupProjectCategory(startDate, endDate)));
		model.addAttribute("propVisitorCountByDate", gson.toJson(statServiceImpl.getVisitorCountByDate(startDate, endDate)));

		return "admin/main/index";
	}

}
