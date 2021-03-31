package com.example.demo.service;

import org.springframework.stereotype.Service;

@Service
public interface EmailService {
	public void sendSimpleMessage(String to, String subject, String text);
    public void sendHtmlMail(String to, String subject, String msg);
}