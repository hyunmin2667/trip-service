package com.mycom.myapp.post.service;

import java.util.List;

import com.mycom.myapp.post.dto.PostDto;
import com.mycom.myapp.post.dto.PostSearchDto;

public interface PostService {
	List<PostDto>postSearch (PostSearchDto dto);
	
}
