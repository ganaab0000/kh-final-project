package com.example.demo.domain.dto;

import java.util.Date;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class VisitorPerDayDto {
	private int memberId;
	private Date dateVisited;
}
