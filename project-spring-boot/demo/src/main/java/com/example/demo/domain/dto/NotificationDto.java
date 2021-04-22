package com.example.demo.domain.dto;

import java.util.Date;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NotificationDto {
	private int id;
	private int memberId;
	private String content;
	private Date dateCreated;
	private String isRead;
}
