package com.example.demo.domain.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReserveDto {
	private Integer id;
	private String billingkey;
	private Integer additionalBillings;
	private Date dateCreated;
	private String receiverName;
	private Integer receiverPhone;
	private String receiverAddress;
	private String requestForDelivery;
	private Integer reserveStatusCategoryId;
	private Integer memberId;
	private Integer projectId;
}
