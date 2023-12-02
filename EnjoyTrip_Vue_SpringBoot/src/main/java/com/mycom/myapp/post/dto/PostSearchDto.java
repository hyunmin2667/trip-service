package com.mycom.myapp.post.dto;

import lombok.Data;

@Data
public class PostSearchDto {
	private String userId;	// 특정 아이디만 보고 싶을 때
	private int travelPlaceId;	//특정 장소만 보고 싶을 때 
	private String postTitle; 	// 제목 검색
	private String postContent; // 내용 검색 ?
	private String title;	// 장소 이름  
	private int readcount;	// 조회수 정렬할 때 
	private int sidoCode;	// 시로 걸러낼 때 
	private int gugunCode; 	// 구군으로 걸러낼 때

	private double leftLatitude;	// 좌표로 걸러낼 때
	private double rightLatitude;	// 좌표로 걸러낼 때
	private double leftLongitude; 
	private double rightLongitude;
	
	private int boundary;
	private int likes;	// 좋아요순
	private int recent;	// 최신순
	private int followings;	//팔로우 필터
}
