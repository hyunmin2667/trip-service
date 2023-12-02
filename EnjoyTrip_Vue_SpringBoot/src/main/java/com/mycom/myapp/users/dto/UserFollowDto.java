package com.mycom.myapp.users.dto;

import lombok.Data;

@Data
public class UserFollowDto {
	private String followerUserId;
	private String followingUserId;
}


