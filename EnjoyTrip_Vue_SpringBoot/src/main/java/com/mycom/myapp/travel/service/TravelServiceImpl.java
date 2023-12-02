package com.mycom.myapp.travel.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mycom.myapp.travel.dao.TravelDao;
import com.mycom.myapp.travel.dto.TravelDayDto;
import com.mycom.myapp.travel.dto.TravelPlaceDto;
import com.mycom.myapp.travel.dto.TravelPlacePostPublicDto;
import com.mycom.myapp.travel.dto.TravelPlanDto;

@Service
public class TravelServiceImpl implements TravelService {

	private TravelDao travelDao;
	
	public TravelServiceImpl(TravelDao travelDao) {
		this.travelDao = travelDao;
	}

	@Override
	public List<TravelPlanDto> travelPlanListPublic(String userId) {
		// TODO Auto-generated method stub
		return travelDao.travelPlanListPublic(userId);
	}


	//travelPlan
	@Override
	public int travelPlanInsert(TravelPlanDto dto) {
		// TODO Auto-generated method stub
		return travelDao.travelPlanInsert(dto);
	}
	@Override
	public List<TravelPlacePostPublicDto> travelPlacePostPublic(String userId) {
		// TODO Auto-generated method stub
//		List<TravelPlacePostPublicDto> 
		return travelDao.travelPlacePostPublic(userId);
	}
	@Override
	public List<TravelPlanDto> travelPlanList() {
		// TODO Auto-generated method stub
		return travelDao.travelPlanList();
	}
	@Override
	public int travelPlanDelete(int travelPlanId) {
		// TODO Auto-generated method stub
		return travelDao.travelPlanDelete(travelPlanId);
	}
	@Override
	public int travelPlanUpdate(TravelPlanDto dto) {
		// TODO Auto-generated method stub
		int result = travelDao.travelPlanUpdate(dto);
		return result;
	}

	
	// travelDay
	@Override
	public int travelDayInsert(TravelDayDto dto) {
		// TODO Auto-generated method stub
		int result = travelDao.travelDayInsert(dto);
		return result;
	}

	@Override
	public List<TravelDayDto> travelDayList(int travelPlanId) {
		// TODO Auto-generated method stub
		return travelDao.travelDayList(travelPlanId);
	}

	@Override
	public int travelDayUpdate(TravelDayDto dto) {
		// TODO Auto-generated method stub
		return  travelDao.travelDayUpdate(dto);
	}

	@Override
	public int travelDayDelete(int travelDayId) {
		// TODO Auto-generated method stub
		return  travelDao.travelDayDelete(travelDayId);
	}

	
	// travelPlace
	@Override
	public int travelPlaceInsert(TravelPlaceDto dto) {
		// TODO Auto-generated method stub
		return travelDao.travelPlaceInsert(dto);
	}

	@Override
	public List<TravelPlaceDto> travelPlaceList(int travelDayId) {
		// TODO Auto-generated method stub
		return travelDao.travelPlaceList(travelDayId);
	}

	@Override
	public int travelPlaceUpdate(TravelPlaceDto dto) {
		// TODO Auto-generated method stub
		return travelDao.travelPlaceUpdate(dto);
	}

	@Override
	public int travelPlaceDelete(TravelPlaceDto dto) {
		// TODO Auto-generated method stub
		return travelDao.travelPlaceDelete(dto);
	}

	


}
