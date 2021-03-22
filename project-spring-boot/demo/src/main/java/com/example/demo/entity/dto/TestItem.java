package com.example.demo.entity.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
@Component
public class TestItem {
	private String id;
	private String name;
	private String detailImg;
}
