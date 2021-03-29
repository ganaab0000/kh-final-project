package com.example.demo.domain.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProjectFilteringVo {
	private int category;
	private int ongoing;
	private int minArchiveRate;
	private int maxArchiveRate;
	private int minMoney;
	private int maxMoney;
	private int sort;
}
