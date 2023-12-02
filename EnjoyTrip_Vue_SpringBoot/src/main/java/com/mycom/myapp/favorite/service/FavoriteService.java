package com.mycom.myapp.favorite.service;

import java.util.List;

import com.mycom.myapp.favorite.dto.FavoriteDto;


public interface FavoriteService {
	FavoriteDto regionFavoriteSearch(FavoriteDto dto);
	int regionFavoriteDelete(FavoriteDto dto);
	int regionFavoriteInsert(FavoriteDto dto); 
	List<FavoriteDto> regionFavoriteList(String userId);
}
