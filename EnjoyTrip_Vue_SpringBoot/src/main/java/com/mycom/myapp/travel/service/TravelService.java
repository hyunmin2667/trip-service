package com.mycom.myapp.travel.service;

import java.util.List;

import org.springframework.web.bind.annotation.PathVariable;

import com.mycom.myapp.travel.dto.TravelDayDto;
import com.mycom.myapp.travel.dto.TravelPlaceDto;
import com.mycom.myapp.travel.dto.TravelPlacePostPublicDto;
import com.mycom.myapp.travel.dto.TravelPlanDto;

public interface TravelService {
	
	List<TravelPlanDto> travelPlanListPublic(String userId); 
	List<TravelPlacePostPublicDto> travelPlacePostPublic(String userId);
	
	// travel Plan
	int travelPlanInsert(TravelPlanDto dto); 
	List<TravelPlanDto> travelPlanList();
	int travelPlanUpdate(TravelPlanDto dto);
	int travelPlanDelete(int travelPlanId);
	
	// travelDay
	int travelDayInsert(TravelDayDto dto);
	List<TravelDayDto> travelDayList(int travelPlanId);
	int  travelDayUpdate(TravelDayDto dto);
	int travelDayDelete(@PathVariable int travelDayId);

	
	//travelPlace
	int travelPlaceInsert(TravelPlaceDto dto);
	List<TravelPlaceDto> travelPlaceList(int travelDayId);
	int travelPlaceUpdate(TravelPlaceDto dto);
	int travelPlaceDelete(TravelPlaceDto dto);
	 
}
