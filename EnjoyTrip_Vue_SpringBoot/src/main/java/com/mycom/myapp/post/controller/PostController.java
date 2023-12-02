package com.mycom.myapp.post.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.mycom.myapp.post.dto.PostDto;
import com.mycom.myapp.post.dto.PostSearchDto;
import com.mycom.myapp.post.service.PostService;

@RestController
public class PostController {
	
	PostService postService;

	public PostController(PostService postService) {
		this.postService = postService;
	}
	
	// 범위 검색 	 + 지역검색
	@GetMapping(value="/post")
	List<PostDto> postSearch( PostSearchDto dto){
		System.out.println(dto);
		return postService.postSearch(dto);
	}
	
}
