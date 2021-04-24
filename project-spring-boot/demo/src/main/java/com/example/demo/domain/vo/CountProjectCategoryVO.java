package com.example.demo.domain.vo;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class CountProjectCategoryVO {
	private int projectCategoryId;
	private int count;
	private String name;
}
