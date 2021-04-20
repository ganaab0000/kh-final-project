package com.example.demo.domain.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProjectFilteringVo {
	private String keyword;
	private Integer category;
	private Integer status;
	
	private Integer rate;
	private Integer minRate;
	private Integer maxRate;
	
	private Integer collected;
	private Integer minCollected;
	private Integer maxCollected;
	
	private Integer sort;
	private Integer page;
	
	private Integer memberId;
}
