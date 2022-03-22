package com.example.demo.web;


import java.util.List;

import javax.annotation.Resource;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.ReservateService;
import com.example.demo.vo.ReservationVO;

@Controller
public class TestController {

	@Resource(name = "reservateTest")
	private ReservateService reservateService;


	@RequestMapping("/reservateTest")
	public String reservateTest(Model model) {
		List<ReservationVO> list = reservateService.reservateTest();

		model.addAttribute("list", list);
		return "/reservation/test";
	}

	
}
