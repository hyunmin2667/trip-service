package com.mycom.myapp.post.dto;

import lombok.Data;

@Data
public class PostDto {
	private int postId;
	private String userId;
	private int travelPlaceId; 
	private String postTitle; 
	private String postContent; 
	private int imageId; 
	private String imageName; 
	private int imageSize; 
	private String imageType; 
	private String imageUrl; 
	private String imageUploadDate; 
	private int contentId; 
	private int contentTypeId; 
	private String title; 
	private String addr1; 
	private String addr2; 
	private String zipcode;
	private String tel;
	private String firstImage;
	private String firstImage2;
	private int readcount; 
	private int sidoCode; 
	private int gugunCode; 
	private double latitude;
	private double longitude; 
	private String mlevel;
	private int likes;
	
}
