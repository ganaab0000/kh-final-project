package com.example.demo.cs.entity;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
@Component
public class QnaDto {
	private int id;
	private String header;
	private String email;
	private String title;
	private String content;
	private String path;
	private Date dateCreated;
	private String isConsent;
	private String isState;
	private String isDeleted;
}
