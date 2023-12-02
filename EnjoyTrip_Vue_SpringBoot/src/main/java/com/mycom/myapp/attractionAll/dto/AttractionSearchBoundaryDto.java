package com.mycom.myapp.attractionAll.dto;

import lombok.Data;

@Data
public class AttractionSearchBoundaryDto {
//	private int contentId;
	private String searchKeyWord;
	
	private double leftLatitude;
	private double leftLongitude;
	private double rightLatitude;
	private double rightLongitude;
	
	// sido code와 guguncode가 있을 때 다른 결과를 낼 것
	private int sidoCode;
	private int gugunCode ; 
	
}
