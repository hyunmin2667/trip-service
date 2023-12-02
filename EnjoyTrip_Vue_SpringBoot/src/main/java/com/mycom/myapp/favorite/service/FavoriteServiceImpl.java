package com.mycom.myapp.favorite.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mycom.myapp.favorite.dao.FavoriteDao;
import com.mycom.myapp.favorite.dto.FavoriteDto;

@Service
public class FavoriteServiceImpl implements FavoriteService{
	private FavoriteDao favoriteDao;
	
	public FavoriteServiceImpl(FavoriteDao favoriteDao) {
		this.favoriteDao =favoriteDao;
	}

	@Override
	public FavoriteDto regionFavoriteSearch(FavoriteDto dto) {
		// TODO Auto-generated method stub
		return favoriteDao.regionFavoriteSearch(dto);
	}

	@Override
	public int regionFavoriteDelete(FavoriteDto dto) {
		// TODO Auto-generated method stub
		return favoriteDao.regionFavoriteDelete(dto);
	}

	@Override
	public int regionFavoriteInsert(FavoriteDto dto) {
		// TODO Auto-generated method stub
		return favoriteDao.regionFavoriteInsert(dto);
	}

	@Override
	public List<FavoriteDto> regionFavoriteList(String userId) {
		// TODO Auto-generated method stub
		return favoriteDao.regionFavoriteList(userId);
	}
	
	
}
