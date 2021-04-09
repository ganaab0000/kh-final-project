package com.example.demo.service;

import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j2;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

@Log4j2
@Service
public class EmailServiceImpl implements EmailService {
	@Autowired
	public JavaMailSender emailSender;

	public void sendSimpleMessage(String to, String subject, String text) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(to);
		message.setSubject(subject);
		message.setText(text);
		emailSender.send(message);
	}

    public void sendHtmlMail(String to, String subject, String msg) {
        try {
        	MimeMessage mimeMessage = emailSender.createMimeMessage();
        	MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "utf-8");
        	mimeMessage.setContent(msg, "text/html");
        	helper.setText(msg, true);
        	helper.setTo(to);
        	helper.setSubject(subject);
        	emailSender.send(mimeMessage);
        } catch (MessagingException ex) {
            log.error(EmailServiceImpl.class.getName());
        }
    }
}