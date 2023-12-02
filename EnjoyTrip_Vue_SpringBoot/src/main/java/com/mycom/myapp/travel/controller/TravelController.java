package com.mycom.myapp.travel.controller;

import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.mycom.myapp.travel.dto.TravelDayDto;
import com.mycom.myapp.travel.dto.TravelPlaceDto;
import com.mycom.myapp.travel.dto.TravelPlacePostPublicDto;
import com.mycom.myapp.travel.dto.TravelPlanDto;
import com.mycom.myapp.travel.service.TravelService;

@RestController
//@CrossOrigin(origins="*", allowedHeaders="*")
public class TravelController {

	private TravelService travelService;
	public TravelController(TravelService travelService) {
		this.travelService = travelService;
	}
//	사용자 공개 여행 목록 조회, count
	@GetMapping(value="/travel/plan/{userId}")
	public List<TravelPlanDto> travelPlanListPublic(@PathVariable String userId){
		System.out.println(userId);
		List<TravelPlanDto> dto = travelService.travelPlanListPublic(userId);
		return dto;
	}
//	사용자 공개 장소 게시물 목록 조회, count
	@GetMapping(value="/travel/place_post_public/{userId}")
	public List<TravelPlacePostPublicDto> travelPlacePostPublic(@PathVariable String userId){
		System.out.println(userId);
		List<TravelPlacePostPublicDto> dto = travelService.travelPlacePostPublic(userId);
		return dto;
	}
//	여행 추가
	@PostMapping(value="/travel/plan")
	public int travelPlanInsert(@RequestBody TravelPlanDto dto) {
		return travelService.travelPlanInsert(dto);
	}
	
//	여행 list ( 전체)
	@GetMapping(value="/travel/plan")
	public List<TravelPlanDto> travelPlanList(){
		return travelService.travelPlanList();
	}

// 	여행 수정
	@PutMapping(value="/travel/plan")
	public int travelPlanUpdate(@RequestBody TravelPlanDto dto){
		System.out.println(dto);
		int result = travelService.travelPlanUpdate(dto);
		return result;
	}
	
//	여행 삭제
	@DeleteMapping(value="/travel/plan/{travelPlanId}")
	public int travelPlanDelete(@PathVariable int travelPlanId){
		System.out.println(travelPlanId);
		int result = travelService.travelPlanDelete(travelPlanId);
		return result;
	}
	
	
	// 날짜 조회
	@GetMapping(value="/travel/day/{travelPlanId}")
	public List<TravelDayDto> travelDayList(@PathVariable int travelPlanId){
		System.out.println(travelPlanId);
		
		return travelService.travelDayList(travelPlanId);
	}
	
	// 날짜 입력
	@PostMapping(value="/travel/day")
	public int travelDayInsert(@RequestBody TravelDayDto dto){
		System.out.println(dto);
		int result = travelService.travelDayInsert(dto);
		return result;
	}
	// 날짜 수정
	@PutMapping(value="/travel/day")
	public int travelDayUpdate(@RequestBody TravelDayDto dto){
		System.out.println(dto);
		int result = travelService.travelDayUpdate(dto);
		return result;
	}
	// 날짜 삭제
	@DeleteMapping(value="/travel/day/{travelDayId}")
	public int travelDayDelete(@PathVariable int travelDayId){
		System.out.println(travelDayId);
		int result = travelService.travelDayDelete(travelDayId);
		return result;
	}
	
	
	//장소
	// 장소 입력
	@PostMapping(value="/travel/place")
	public int travelPlaceInsert(@RequestBody TravelPlaceDto dto){
		System.out.println(dto);
		int result = travelService.travelPlaceInsert(dto);
		return result;
	}
	// 장소 조회
	@GetMapping(value="/travel/place/{travelDayId}")
	public List<TravelPlaceDto> travelPlaceList(@PathVariable int travelDayId){
		System.out.println(travelDayId);
		
		return travelService.travelPlaceList(travelDayId);
	}
	// 장소 수정
	@PutMapping(value="/travel/place")
	public int travelPlaceUpdate(@RequestBody TravelPlaceDto dto){
		System.out.println(dto);
		int result = travelService.travelPlaceUpdate(dto);
		return result;
	}
	// 장소 삭제
	@DeleteMapping(value="/travel/place") // 얘는 dto 형식으로 넘겨줘야 한다. ( 이유는 넘겨줘야 하는 조건이 객체 자체라 )
	public int travelPlaceDelete(@RequestBody TravelPlaceDto dto){
		System.out.println(dto);
		int result = travelService.travelPlaceDelete(dto);
		return result;
	}
	
}
