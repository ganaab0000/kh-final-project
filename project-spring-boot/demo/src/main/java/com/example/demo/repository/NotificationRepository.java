package com.example.demo.repository;


import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.example.demo.domain.dto.NotificationDto;

@Mapper
public interface NotificationRepository {

	@Insert("insert into notification (id, member_id, content) values(notification_id_seq.nextVal, #{memberId}, #{content})")
	public int save(int memberId, String content);

	public List<NotificationDto> getNotificationList(NotificationDto notificationDto, int pageNumber, int pageSize);

	public int getCountNotificationList(NotificationDto notificationDto, int pageNumber, int pageSize);

}
