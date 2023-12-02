package com.mycom.myapp.attractionAll.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycom.myapp.attractionAll.dto.AttractionAllDto;
import com.mycom.myapp.attractionAll.dto.AttractionSearchBoundaryDto;
import com.mycom.myapp.attractionAll.dto.RegionDto;
import com.mycom.myapp.favorite.dto.FavoriteDto;

@Mapper
public interface AttractionAllDao {
	List<AttractionAllDto> attractionAllSearchBoundary(AttractionSearchBoundaryDto dto);
	List<RegionDto> regionSearch(String searchKeyword);
	
}
