package com.example.demo.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GuideController {
	
	//이용시간 및 요금 안내 페이지
	@RequestMapping("/guide/fare")
	public String time_fare() {
		return "guide/fare";
	}
	
	//이용준수사항 안내 페이지
	@RequestMapping("/guide/rules")
	public String rulesUse() {
		return "guide/rules";
	}
	
	//편의시설 안내 페이지
	@RequestMapping("/guide/facility")
	public String convenience() {
		return "guide/facility";
	}
	
	//위치 및 교통정보 안내 페이지
	@RequestMapping("/guide/trafficInfo")
	public String trafficInformation() {
		return "guide/trafficInformation";
	}

}
