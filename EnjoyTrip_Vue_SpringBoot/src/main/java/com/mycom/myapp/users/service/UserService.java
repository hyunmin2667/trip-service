package com.mycom.myapp.users.service;

import java.util.List;

import com.mycom.myapp.users.dto.UserDto;
import com.mycom.myapp.users.dto.UserFollowDto;

public interface UserService {
	UserDto userDetail(String userId); // 사용자 정보
	int userInsert(UserDto dto); // 사용자 등록
	UserDto login(UserDto dto);
	int userUpdate(UserDto dto); // 사용자 수정
	int userDelete(String userId); // 사용자 삭제
	
	List<UserFollowDto> userFollowing(String userId);
	List<UserFollowDto> userFollower(String userId);
	int userFollowDelete(UserFollowDto dto);
	
}
