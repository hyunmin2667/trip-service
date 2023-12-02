package com.mycom.myapp.users.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.mycom.myapp.users.dto.UserDto;
import com.mycom.myapp.users.dto.UserFollowDto;
import com.mycom.myapp.users.service.UserService;

@RestController
//@CrossOrigin(origins="*", allowedHeaders="*")
public class UserController {

	UserService userService;
	public UserController(UserService userService) {
		this.userService = userService;
	}
	
	
	// get Follower
	@GetMapping(value="/users/follower/{userId}")
	public List<UserFollowDto> userFollower(@PathVariable String userId) {
		System.out.println(userId);
		List<UserFollowDto> dto = userService.userFollower(userId);
		return dto;
	}
	// delete Follow
	@DeleteMapping(value="/users/follower")
	public int userFollowDelete(@RequestBody UserFollowDto dto) {
		System.out.println(dto);
		int result = userService.userFollowDelete(dto);
		return result;
	}
	// Get Following
	@GetMapping(value="/users/following/{userId}")
	public List<UserFollowDto> userFollowing(@PathVariable String userId) {
		List<UserFollowDto> dto = userService.userFollowing(userId);
		return dto;
	}
	
	
	@GetMapping(value="/users/{userId}")
	public UserDto userDetail(@PathVariable String userId) {
		UserDto dto = userService.userDetail(userId);
		return dto;
	}

	@PostMapping(value="/login")
	public Map<String, String> login(@RequestBody UserDto dto, HttpSession session) {
		UserDto userDto = userService.login(dto);
		Map<String, String> map = new HashMap<>();
		
		// 성공
		if(userDto != null) {
			session.setAttribute("userDto", userDto); // 서버용도
			System.out.println("controller : " + userDto);
			map.put("result", "success");
			map.put("userName", userDto.getUserName());
			map.put("userProfileImageUrl", userDto.getUserProfileImageUrl());
		} else {
			// 실패
			map.put("result", "fail");
		}
		
		return map;
	}
	
	@GetMapping(value="/logout")
	public Map<String, String> logout(HttpSession session) {
		session.invalidate();

		Map<String, String> map = new HashMap<>();
		map.put("result", "success");
		return map;
	}
	
	@PostMapping(value="/register")
	public int userInsert(@RequestBody UserDto dto) {
		return userService.userInsert(dto);
	}
	
	@PutMapping(value="/users")
	public int userUpdate(@RequestBody UserDto dto) {
		return userService.userUpdate(dto);
	}
	
	@DeleteMapping(value="/users/{userId}")
	public int userDelete(@PathVariable String userId) {
		return userService.userDelete(userId);
	}
}
