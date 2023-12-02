package com.mycom.myapp.attractionAll.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mycom.myapp.attractionAll.dao.AttractionAllDao;
import com.mycom.myapp.attractionAll.dto.AttractionAllDto;
import com.mycom.myapp.attractionAll.dto.AttractionSearchBoundaryDto;
import com.mycom.myapp.attractionAll.dto.RegionDto;

@Service
public class AttractionAllServiceImpl implements AttractionAllService{
	private AttractionAllDao attractionAllDao;
	
	public AttractionAllServiceImpl(AttractionAllDao attractionAllDao) {
		this.attractionAllDao =attractionAllDao;
	}
	
	@Override
	public List<AttractionAllDto> attractionAllSearchBoundary(AttractionSearchBoundaryDto dto){
		return attractionAllDao.attractionAllSearchBoundary(dto);
	}

	@Override
	public List<RegionDto> regionSearch(String searchKeyword) {
		// TODO Auto-generated method stub
		return attractionAllDao.regionSearch(searchKeyword);
	}
}
