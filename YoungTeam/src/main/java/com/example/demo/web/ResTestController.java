package com.example.demo.web;


import java.util.List;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.ReservateService;
import com.example.demo.vo.ReservationVO;

@Controller
public class ResTestController {
	

	
	@Resource(name = "reservateTest")
	private ReservateService reservateService;
	
	@RequestMapping("/reservateTest.do")
	public String insetTest(HttpServletRequest request, Model model) {
		
		String siteNum = request.getParameter("siteNum");
		String resName = request.getParameter("resName");
		int price = Integer.parseInt(request.getParameter("price"));
		String phone = request.getParameter("phone");
		String carNum = request.getParameter("carNum");
		String carKinds = request.getParameter("carKinds");
		String payMethodSt = request.getParameter("payMethod");
		
		ReservationVO vo = new ReservationVO();
		Timestamp now = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat idFormat = new SimpleDateFormat("yyyyMMdd");
		String id = idFormat.format(now) + "[아이디이름]" + siteNum;
		String now2 = format.format(now);
		vo.setResid(id);
		vo.setResDay(now2);
		vo.setStartDay("2022/03/02");
		vo.setEndDay("2022/03/04");
		vo.setPrice(price);
		vo.setSitenum(siteNum);
		vo.setSiteStatus(2);
		vo.setUserid("syw");
		vo.setResname(resName);
		vo.setPhone(phone);
		vo.setCarnum(carNum);
		vo.setCarkinds(carKinds);
		if(payMethodSt == "card") {
			vo.setPaymethod(0);
		}else if(payMethodSt == "trans") {
			vo.setPaymethod(1);
		}
		vo.setPaystatus(0);
		reservateService.insertTest(vo);
		List<ReservationVO> list = reservateService.reservateTest();

		model.addAttribute("list", list);
		return "/reservation/test";
	}
	
	@RequestMapping("/deletTest.do")
	public String deleteTest(Model model) {
		reservateService.deleteTest("2022/02/21[아이디이름][숫자조합]");
		
		List<ReservationVO> list = reservateService.reservateTest();

		model.addAttribute("list", list);
		
		return "/reservation/test";
	}
	
}
