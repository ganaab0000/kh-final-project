package com.example.demo.domain.vo;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class RoleCheckVo {
	private int id;
	private String name;
	private String isChecked;
}
