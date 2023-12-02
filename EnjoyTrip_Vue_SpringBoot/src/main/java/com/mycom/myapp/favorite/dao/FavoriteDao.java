package com.mycom.myapp.favorite.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycom.myapp.favorite.dto.FavoriteDto;

@Mapper
public interface FavoriteDao {
	// favorite
	FavoriteDto regionFavoriteSearch(FavoriteDto dto);
	int regionFavoriteDelete(FavoriteDto dto);
	int regionFavoriteInsert(FavoriteDto dto); 
	List<FavoriteDto> regionFavoriteList(String userId);
}
