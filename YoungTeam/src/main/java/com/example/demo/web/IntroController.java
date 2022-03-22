package com.example.demo.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IntroController {
	
	//캠핑장 소개 페이지
	@RequestMapping("/intro")
	public String reservation() {
		return "introduce/introduce";
	}
	
	//캠핑장 시설 배치도 페이지
	@RequestMapping("/intro/facilityLayout")
	public String facilityLayout() {
		return "introduce/facilityLayout";
	}
	
	//캠핑장 시설 안내 페이지
	@RequestMapping("/intro/facilityInfo")
	public String facilityInfo() {
		return "introduce/facilityInfo";
	}
	
}
