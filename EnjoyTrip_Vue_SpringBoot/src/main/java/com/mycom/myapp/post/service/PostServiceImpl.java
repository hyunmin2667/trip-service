package com.mycom.myapp.post.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mycom.myapp.post.dao.PostDao;
import com.mycom.myapp.post.dto.PostDto;
import com.mycom.myapp.post.dto.PostSearchDto;

@Service
public class PostServiceImpl implements PostService {

	private PostDao postDao;
	
	public PostServiceImpl(PostDao postDao) {
		this.postDao = postDao;
	}

	@Override
	public List<PostDto> postSearch(PostSearchDto dto) {
		// TODO Auto-generated method stub
		System.out.println(postDao.postSearch(dto));
		return postDao.postSearch(dto);
	}

	


}
