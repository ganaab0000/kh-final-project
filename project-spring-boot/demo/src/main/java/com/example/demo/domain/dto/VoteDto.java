package com.example.demo.domain.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class VoteDto {
	private Integer memberId;
	private Integer projectId;
}
