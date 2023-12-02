package com.mycom.myapp.users.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycom.myapp.users.dto.UserDto;
import com.mycom.myapp.users.dto.UserFollowDto;

@Mapper
public interface UserDao {
	UserDto userDetail(String userId); // 사용자 정보
	int userInsert(UserDto dto); // 사용자 등록
	UserDto login(String userId);
	int userUpdate(UserDto dto); // 사용자 수정
	int userDelete(String userId); // 사용자 삭제
	
	List<UserFollowDto> userFollower(String userId);
	List<UserFollowDto> userFollowing(String userId);
	int userFollowDelete(UserFollowDto dto);
}
