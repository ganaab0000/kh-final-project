package com.example.demo.domain.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReserveVo {
	private int id;
	private String billingkey;
	private int additionalBillings;
	private Date dateCreated;
	private String receiverName;
	private int receiverPhone;
	private String receiverAddress;
	private String requestForDelivery;
	private int reserveStatusCategoryId;
	private int memberId;
	private int projectId;
}
