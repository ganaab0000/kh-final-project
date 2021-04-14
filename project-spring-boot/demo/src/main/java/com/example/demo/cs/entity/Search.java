package com.example.demo.cs.entity;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
@Component
public class Search extends PagingVO{
	private String searchType; // 검색조건
	private String keyword;     // 검색어
	private String existFile;       // 
}
