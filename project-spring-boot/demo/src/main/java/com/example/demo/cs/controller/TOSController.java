package com.example.demo.cs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cs")
public class TOSController {
		
		
		private static final Logger log =
			LoggerFactory.getLogger(TOSController.class);
	
	
		@GetMapping("/tos")
		public String Tos() {
			return "cs/tos";
		}
}
