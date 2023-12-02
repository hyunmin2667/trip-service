package com.mycom.myapp.attractionAll.service;

import java.util.List;

import com.mycom.myapp.attractionAll.dto.AttractionAllDto;
import com.mycom.myapp.attractionAll.dto.AttractionSearchBoundaryDto;
import com.mycom.myapp.attractionAll.dto.RegionDto;

public interface AttractionAllService {
	List<AttractionAllDto> attractionAllSearchBoundary(AttractionSearchBoundaryDto dto);
	List<RegionDto> regionSearch(String searchKeyword);
}
