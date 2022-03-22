package com.example.demo.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IntroduceController {
	
	
	@RequestMapping("/introduce")
	public String reservation() {
		return "/introduce/introduce";
	}
	
	@RequestMapping("/facilityLayout")
	public String facilityLayout() {
		return "/introduce/facilityLayout";
	}
	
	@RequestMapping("/facilityInfo")
	public String facilityInfo() {
		return "/introduce/facilityInfo";
	}
	
}
