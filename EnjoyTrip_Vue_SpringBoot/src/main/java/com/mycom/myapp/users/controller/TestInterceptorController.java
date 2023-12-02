package com.mycom.myapp.users.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

// json 리턴으로 테스트
// jsp 사용X
@RestController // @Controller + @ResponseBody
public class TestInterceptorController {
	
	@GetMapping("/login")
	public String m1() {
		System.out.println("/login");
		return "/login";
	}

}
