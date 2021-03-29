package com.example.demo.domain.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UploadFileDTO {
	private int id;
	private String uploadName;
	private String saveName;
	private long fileSize;
	private String fileType;
	private int memberId;
	private Date dateCreated;

}