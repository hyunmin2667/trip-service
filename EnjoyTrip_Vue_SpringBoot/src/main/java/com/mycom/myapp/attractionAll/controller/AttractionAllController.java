package com.mycom.myapp.attractionAll.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.mycom.myapp.attractionAll.dto.AttractionAllDto;
import com.mycom.myapp.attractionAll.dto.AttractionSearchBoundaryDto;
import com.mycom.myapp.attractionAll.dto.RegionDto;
import com.mycom.myapp.attractionAll.service.AttractionAllService;
import com.mycom.myapp.favorite.dto.FavoriteDto;

@RestController
public class AttractionAllController {
	
	AttractionAllService attractionService;

	public AttractionAllController(AttractionAllService attractionService) {
		this.attractionService = attractionService;
	}
	
	// 범위 검색 	 + 지역검색
	@GetMapping(value="/attractions")
	List<AttractionAllDto> attractionAllSearchBoundary(AttractionSearchBoundaryDto dto){
		System.out.println(dto);
		return attractionService.attractionAllSearchBoundary(dto);
	}
	
	//지역 검색기능
	@GetMapping(value="/region/{searchKeyword}")
	List<RegionDto> regionSearch(@PathVariable String searchKeyword){
		System.out.println(searchKeyword);
		return attractionService.regionSearch(searchKeyword);
	}
	

	
	
}
