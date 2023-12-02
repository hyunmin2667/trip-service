package com.mycom.myapp.favorite.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.mycom.myapp.favorite.dto.FavoriteDto;
import com.mycom.myapp.favorite.service.FavoriteService;

@RestController
public class FavoriteController {
	
	FavoriteService favoriteService;

	public FavoriteController(FavoriteService favoriteService) {
		this.favoriteService = favoriteService;
	}

	//장소 즐겨찾기 추가 삭제	//원래 즐겨찾기 돼있으면 삭제, 아니면 추가
	@PutMapping(value="/favorite")
	int regionFavoriteUpdate(@RequestBody  FavoriteDto dto) {
		System.out.println(dto);
		// 여기서 favorite에 있는지 없는지 확인하자
		if(favoriteService.regionFavoriteSearch(dto) == null) {
			return favoriteService.regionFavoriteInsert(dto);
		}
//		return attractionService.regionFavoriteUpdate(dto)
		else {
			return favoriteService.regionFavoriteDelete(dto);
		}
	}
	
	@GetMapping(value="/favorite/{userId}")
	List<FavoriteDto> regionFavoriteList(@PathVariable String userId){
		System.out.println(userId);
		return favoriteService.regionFavoriteList( userId);
	}
}
