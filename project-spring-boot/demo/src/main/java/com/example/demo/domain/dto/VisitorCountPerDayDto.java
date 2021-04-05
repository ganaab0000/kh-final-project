package com.example.demo.domain.dto;

import java.util.Date;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class VisitorCountPerDayDto {
	private int count;
	private Date dateVisited;
}
