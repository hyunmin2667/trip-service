package com.mycom.myapp.users.dto;

import java.util.List;

import lombok.Data;

@Data
public class UserDto {
	private String userId;
	private String userPassword;
	private String userName;
	private String userProfileImageUrl;
	
	private List<UserFollowDto> userFollowing;
	private List<UserFollowDto> userFollower;
}


