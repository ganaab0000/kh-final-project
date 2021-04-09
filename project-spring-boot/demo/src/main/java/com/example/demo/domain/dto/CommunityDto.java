package com.example.demo.domain.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommunityDto {
	private Integer id;
	private String content;
	private String isDeleted;
	private Date dateCreated;
	private Date dateUpdated;
	private Integer projectId;
	private Integer memberId;
	private Integer communityCategoryId;
	private Integer parentCommunityId;
}
