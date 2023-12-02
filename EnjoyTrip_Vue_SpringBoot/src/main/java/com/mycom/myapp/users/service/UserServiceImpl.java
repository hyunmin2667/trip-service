package com.mycom.myapp.users.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mycom.myapp.users.dao.UserDao;
import com.mycom.myapp.users.dto.UserDto;
import com.mycom.myapp.users.dto.UserFollowDto;

@Service
public class UserServiceImpl implements UserService {

	private UserDao userDao;
	
	public UserServiceImpl(UserDao userDao) {
		this.userDao = userDao;
	}
	
	@Override
	public UserDto userDetail(String userId) {
		return userDao.userDetail(userId);
	}
	
	@Override
	public UserDto login(UserDto userDto) {
		UserDto dto = userDao.login(userDto.getUserId());

		System.out.println("controller : " + dto);
		if(dto != null && userDto.getUserPassword().equals(dto.getUserPassword())) {
			dto.setUserPassword(null);
			return dto;
		}
		return null;
	}


	@Override
	public int userInsert(UserDto dto) {
		return userDao.userInsert(dto);
	}

	@Override
	public int userUpdate(UserDto dto) {
		return userDao.userUpdate(dto);
	}

	@Override
	public int userDelete(String userId) {
		return userDao.userDelete(userId);
	}

	@Override
	public List<UserFollowDto> userFollowing(String userId) {
		
		return userDao.userFollowing(userId);
	}

	@Override
	public List<UserFollowDto> userFollower(String userId) {
		// TODO Auto-generated method stub
		return userDao.userFollower(userId);
	}


	@Override
	public int userFollowDelete(UserFollowDto dto) {
		// TODO Auto-generated method stub
		return userDao.userFollowDelete(dto);
	}

}
