package com.example.demo.controller.person;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.service.UserDetailsServiceImpl;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
public class MemberRestController {
	@Autowired
    private UserDetailsServiceImpl memberServiceimpl;

}
