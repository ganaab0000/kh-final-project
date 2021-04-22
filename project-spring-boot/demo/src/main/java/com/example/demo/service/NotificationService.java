package com.example.demo.service;

import java.util.List;

import com.example.demo.domain.dto.NotificationDto;

public interface NotificationService {

	public int save(int memberId, String content);

	public List<NotificationDto> getNotificationList(NotificationDto notificationDto, int pageNumber, int pageSize);

	public int getCountNotificationList(NotificationDto notificationDto, int pageNumber, int pageSize);

}
