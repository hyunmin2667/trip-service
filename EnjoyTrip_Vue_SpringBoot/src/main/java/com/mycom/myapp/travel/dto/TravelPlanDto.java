package com.mycom.myapp.travel.dto;

import lombok.Data;

@Data
public class TravelPlanDto {
	private int travelPlanId;
	private String userId;
	private String travelPlanTitle;
	private String travelPlanStartDate;
	private String travelPlanEndDate;
	private String travelPlanIsPrivate;
	
	
//	List<TravelDayDto> travelDay;
	
}


