package com.example.demo.domain.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RewardVo {
	private Integer id;
	private Integer price;
	private String name;
	private String ex;
	private Integer limit;
	private Integer count;
	private String delichk;
	private Date deliveryDate;
	private Integer projectId;
	private String optionForm;
	private String Save;
}
