package com.example.demo.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GuideController {
	
	@RequestMapping("/time_fare")
	public String time_fare() {
		return "/guide/time_fare";
	}
	
	@RequestMapping("/rulesUse")
	public String rulesUse() {
		return "/guide/rulesUse";
	}
	
	@RequestMapping("/convenience")
	public String convenience() {
		return "/guide/convenience";
	}
	
	@RequestMapping("/trafficInformation")
	public String trafficInformation() {
		return "/guide/trafficInformation";
	}

}
