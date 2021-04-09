package com.example.demo.domain.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProjectFilteringVo {
	private Integer category;
	private Integer status;
	private Integer minArchiveRate;
	private Integer maxArchiveRate;
	private Integer minMoney;
	private Integer maxMoney;
	private Integer sort;
	private Integer page;
}
