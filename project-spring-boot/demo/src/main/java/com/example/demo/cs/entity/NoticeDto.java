package com.example.demo.cs.entity;


import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
@Component
public class NoticeDto {
	private int id;
	private String title;
	private String content;
	private Date dateCreated;
	private Date dateUpdated;
	private String isDeleted;
	private int memberId;
}
