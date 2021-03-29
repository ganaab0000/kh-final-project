package com.example.demo.domain.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProjectDto {
	private int id;
	private String title;
	private String subTitle;
	private int TargetAmount;
	private Date dateProjectStarted;
	private Date dateProjectClosed;
	private String hashTag;
	private String thumbImg;
	private String mainImg;
	private String summary;
	private String story;
	private String writerName;
	private String writerProfileImg;
	private String writerSnsInstargram;
	private String writerSnsFacebook;
	private String writerPhone;
	private String writerEmail;
	private Date dateCreated;
	private Date dateUpdated;
	private int memberId;
	private int projectCategoryId;
	private int projectStatusCategoryId;
}
