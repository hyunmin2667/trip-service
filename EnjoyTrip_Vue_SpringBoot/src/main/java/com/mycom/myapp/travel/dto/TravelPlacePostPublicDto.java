package com.mycom.myapp.travel.dto;

import lombok.Data;

@Data
public class TravelPlacePostPublicDto {
	private int travelPlanId;
	private int travelDayId;
	private int travelPlaceId;
	private String travelDayDate;
	private int travelDayDayOfPlan;
	private String userId;
	private String travelPlanTitle;
	private String travelPlanStartDate;
	private String travelPlanEndDate;
	private int tavelPlanIsPrivate;
//	<result column="travel_plan_id" property="travelPlanId"/>
//	<result column="travel_day_id" property="travelDayId"/>
//	<result column="travel_place_id" property="travelPlaceId"/>
//	<result column="travel_day_date" property="travelDayDate"/>
//	<result column="travel_day_day_of_plan" property="travelDayDayOfPlan"/>
//	<result column="user_id" property="userId"/>
//	<result column="travel_plan_title" property="travelPlanTitle"/>
//	<result column="travel_plan_start_date" property="travelPlanStartDate"/>
//	<result column="travel_plan_end_date" property="travelPlanEndDate"/>
//	<result column="travel_plan_is_private" property="tavelPlanIsPrivate"/>
	
}
