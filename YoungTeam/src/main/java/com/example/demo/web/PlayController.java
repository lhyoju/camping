package com.example.demo.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PlayController {
	
	@RequestMapping("/eat")
	public String eat() {
		return "/play/eat";
		
	}
	
	@RequestMapping("/play")
	public String play() {
		return "/play/play";
		
	}
	
	@RequestMapping("/see")
	public String see() {
		return "/play/see";
		
	}
}
