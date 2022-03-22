package com.example.demo.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TourController {
	
	//주변 먹거리 페이지
	@RequestMapping("/tour/eat")
	public String eat() {
		return "tour/eat";
	}
	
	//주변 즐길거리 페이지
	@RequestMapping("/tour/play")
	public String play() {
		return "tour/play";
	}
	
	//주변 볼거리 페이지
	@RequestMapping("/tour/see")
	public String see() {
		return "tour/see";	
	}
}
