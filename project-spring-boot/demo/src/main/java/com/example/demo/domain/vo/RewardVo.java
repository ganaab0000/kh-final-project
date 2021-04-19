package com.example.demo.domain.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RewardVo {
	private Integer id;
	private Integer price;
	private String name;
	private String detail;
	private Integer maxStock;
	private Integer currentStock;
	private String isAddressRequired;
	private Date dateDeliveryEstimated;
	private Integer projectId;
	private String optionForm;
	private String Save;
}
