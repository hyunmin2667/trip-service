package com.mycom.myapp.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycom.myapp.post.dto.PostDto;
import com.mycom.myapp.post.dto.PostSearchDto;

@Mapper
public interface PostDao {
	
	List<PostDto> postSearch(PostSearchDto dto);
}
