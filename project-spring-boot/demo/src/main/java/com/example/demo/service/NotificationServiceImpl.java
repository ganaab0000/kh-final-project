package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.domain.dto.NotificationDto;
import com.example.demo.repository.NotificationRepository;

@Service
public class NotificationServiceImpl implements NotificationService {

	@Autowired
	private NotificationRepository notificationRepository;

	@Override
	public int save(int memberId, String content) {
		return notificationRepository.save(memberId, content);
	}

	@Override
	public List<NotificationDto> getNotificationList(NotificationDto notificationDto, int pageNumber, int pageSize) {
		return notificationRepository.getNotificationList(notificationDto, pageNumber, pageSize);
	}

	@Override
	public int getCountNotificationList(NotificationDto notificationDto, int pageNumber, int pageSize) {
		return notificationRepository.getCountNotificationList(notificationDto, pageNumber, pageSize);
	}

}
