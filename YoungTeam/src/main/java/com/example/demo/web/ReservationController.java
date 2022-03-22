package com.example.demo.web;



import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.core.ParameterizedTypeReference;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.service.ReservateService;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.ResDateManVO;
import com.example.demo.vo.ReservationVO;


@Controller
public class ReservationController {

	@Resource(name = "reservateTest")
	private ReservateService reservateService;

	@RequestMapping("/reservation")
	public String reservation(Model model) {



		List<ResDateManVO> list = reservateService.resDateManSel();
		model.addAttribute("list", list);
		return "/reservation/reservation";
	}

	@RequestMapping("/reservation2")
	public String reservation2(HttpSession session, Model model) {
		String userid = (String)session.getAttribute("userid");

		List<MemberVO> list = reservateService.resSelNP(userid);
		model.addAttribute("list", list);
		return "/reservation/reservation2";
	}

	@RequestMapping("/pay")
	public String pay() {
		return "/reservation/pay";
	}

	@RequestMapping("/vbank")
	public String vbankPay( HttpServletRequest request, HttpSession session) {
		String siteNum = request.getParameter("siteNum");
		String resName = request.getParameter("resName");
		int price = Integer.parseInt(request.getParameter("price"));
		String phone = request.getParameter("phone");
		String carNum = request.getParameter("carNum");
		String carKinds = request.getParameter("carKinds");
		String payMethod = request.getParameter("payMethod");
		String startDay = request.getParameter("startDay");
		String endDay = request.getParameter("endDay");
		String userid = (String)session.getAttribute("userid");
		int back = Integer.parseInt(request.getParameter("back"));



		ReservationVO vo = new ReservationVO();
		Timestamp now = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat idFormat = new SimpleDateFormat("yyyyMMdd");
		String id = idFormat.format(now) + userid + siteNum;
		String now2 = format.format(now);
		vo.setResid(id);
		vo.setResDay(now2);
		vo.setStartDay(startDay);
		vo.setEndDay(endDay);
		vo.setPrice(price);
		vo.setSitenum(siteNum);
		vo.setSiteStatus(2);
		vo.setUserid(userid);
		vo.setResname(resName);
		vo.setPhone(phone);
		vo.setCarnum(carNum);
		vo.setCarkinds(carKinds);
		vo.setPaymethod(1);
		vo.setPaystatus(1);

		reservateService.insertTest(vo);

		if(back == 1) {
			String resDateEnd = request.getParameter("resDateEnd");
			String resDateId1 = startDay + siteNum + userid;
			String resDateId2 = resDateEnd + siteNum + userid;
			ResDateManVO vo2 = new ResDateManVO();
			ResDateManVO vo3 = new ResDateManVO();
			vo2.setResDate(startDay);
			vo2.setResDateManId(resDateId1);
			vo2.setSitenum(siteNum);
			vo2.setUserid(userid);
			vo2.setResid(vo.getResid());
			vo2.setResstatus(1);
			reservateService.resDatemanIns(vo2);
			vo3.setResDate(resDateEnd);
			vo3.setResDateManId(resDateId2);
			vo3.setSitenum(siteNum);
			vo3.setUserid(userid);
			vo3.setResid(vo.getResid());
			vo3.setResstatus(1);
			reservateService.resDatemanIns(vo3);
		}else if(back == 2) {
			String resDateMid = request.getParameter("resDateMid");
			String resDateEnd = request.getParameter("resDateEnd");

			String resDateId1 = startDay + siteNum + userid;
			String resDateId2 = resDateMid + siteNum + userid;
			String resDateId3 = resDateEnd + siteNum + userid;
			ResDateManVO vo2 = new ResDateManVO();
			ResDateManVO vo3 = new ResDateManVO();
			ResDateManVO vo4 = new ResDateManVO();
			vo2.setResDate(startDay);
			vo2.setResDateManId(resDateId1);
			vo2.setSitenum(siteNum);
			vo2.setUserid(userid);
			vo2.setResid(vo.getResid());
			vo2.setResstatus(1);
			reservateService.resDatemanIns(vo2);
			vo3.setResDate(resDateMid);
			vo3.setResDateManId(resDateId2);
			vo3.setSitenum(siteNum);
			vo3.setUserid(userid);
			vo3.setResid(vo.getResid());
			vo3.setResstatus(1);
			reservateService.resDatemanIns(vo3);
			vo4.setResDate(resDateEnd);
			vo4.setResDateManId(resDateId3);
			vo4.setSitenum(siteNum);
			vo4.setUserid(userid);
			vo4.setResid(vo.getResid());
			vo4.setResstatus(1);
			reservateService.resDatemanIns(vo4);
		}
		return "/reservation/vbankPay";



	}

	@RequestMapping("/confirm")
	public ModelAndView confirm(@ModelAttribute ReservationVO r, Model model, HttpSession session, HttpServletRequest request) {

		String userid = (String)session.getAttribute("userid");
		ModelAndView mv=new ModelAndView();
		if(userid != null) {
			int page = 1;
			int limit = 10;
			if(request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			String find_name=request.getParameter("find_name");
			String find_field=request.getParameter("find_field");
			r.setFind_field(find_field);
			r.setFind_name("%"+find_name+"%");
			r.setUserid(userid);
			int rescount = this.reservateService.resManListCount(r);

			r.setStartrow((page-1)*10+1);
			r.setEndrow(r.getStartrow()+limit-1);

			List<ReservationVO> resManList=this.reservateService.resManList(r);

			int maxpage=(int)((double)rescount/limit+0.95);
			int startpage=(((int)((double)page/10+0.9))-1)*10+1;
			int endpage=maxpage;
			if(endpage > startpage+10-1) endpage=startpage+10-1;


			mv.addObject("resManList",resManList);
			mv.addObject("page",page);
			mv.addObject("startpage",startpage);
			mv.addObject("endpage",endpage);
			mv.addObject("maxpage",maxpage);
			mv.addObject("rescount",rescount);	
			mv.addObject("find_field",find_field);
			mv.addObject("find_name", find_name);
			mv.addObject("rescount", rescount);
			mv.setViewName("/reservation/confirm");

		}else {

			mv.setViewName("/reservation/confirm");
		}
		return mv;
	}

	@RequestMapping("/confirmPay")
	public String confirmPay(HttpServletRequest request) {

		String resid = request.getParameter("resid");
		reservateService.confirmPay(resid);
		reservateService.confirmPay2(resid);

		return "redirect:/admin";
	}

	@RequestMapping("/resCon")
	public ModelAndView resCon(@ModelAttribute ReservationVO r, HttpServletRequest request,  HttpSession session) {

		String siteNum = request.getParameter("siteNum");
		String resName = request.getParameter("resName");
		int price = Integer.parseInt(request.getParameter("price"));
		String phone = request.getParameter("phone");
		String carNum = request.getParameter("carNum");
		String carKinds = request.getParameter("carKinds");
		String payMethod = request.getParameter("payMethod");
		String startDay = request.getParameter("startDay");
		String endDay = request.getParameter("endDay");
		String userid = (String)session.getAttribute("userid");
		int back = Integer.parseInt(request.getParameter("back"));
		String mid = request.getParameter("mid");
		System.out.println(mid);


		ReservationVO vo = new ReservationVO();
		Timestamp now = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat idFormat = new SimpleDateFormat("yyyyMMdd");
		String id = idFormat.format(now) + userid + siteNum;
		String now2 = format.format(now);
		vo.setResid(id);
		vo.setResDay(now2);
		vo.setStartDay(startDay);
		vo.setEndDay(endDay);
		vo.setPrice(price);
		vo.setSitenum(siteNum);
		vo.setSiteStatus(2);
		vo.setUserid(userid);
		vo.setResname(resName);
		vo.setPhone(phone);
		vo.setCarnum(carNum);
		vo.setCarkinds(carKinds);
		vo.setPaystatus(0);
		vo.setPaymethod(0);


		vo.setMid(mid);
		reservateService.insertTest(vo);
		List<ReservationVO> list = this.reservateService.resCon(userid);

		if(back == 1) {
			String resDateEnd = request.getParameter("resDateEnd");
			String resDateId1 = startDay + siteNum + userid;
			String resDateId2 = resDateEnd + siteNum + userid;
			ResDateManVO vo2 = new ResDateManVO();
			ResDateManVO vo3 = new ResDateManVO();
			vo2.setResDate(startDay);
			vo2.setResDateManId(resDateId1);
			vo2.setSitenum(siteNum);
			vo2.setUserid(userid);
			vo2.setResid(vo.getResid());
			vo2.setResstatus(0);
			reservateService.resDatemanIns(vo2);
			vo3.setResDate(resDateEnd);
			vo3.setResDateManId(resDateId2);
			vo3.setSitenum(siteNum);
			vo3.setUserid(userid);
			vo3.setResid(vo.getResid());
			vo3.setResstatus(0);
			reservateService.resDatemanIns(vo3);
		}else if(back == 2) {
			String resDateMid = request.getParameter("resDateMid");
			String resDateEnd = request.getParameter("resDateEnd");

			String resDateId1 = startDay + siteNum + userid;
			String resDateId2 = resDateMid + siteNum + userid;
			String resDateId3 = resDateEnd + siteNum + userid;
			ResDateManVO vo2 = new ResDateManVO();
			ResDateManVO vo3 = new ResDateManVO();
			ResDateManVO vo4 = new ResDateManVO();
			vo2.setResDate(startDay);
			vo2.setResDateManId(resDateId1);
			vo2.setSitenum(siteNum);
			vo2.setUserid(userid);
			vo2.setResid(vo.getResid());
			vo2.setResstatus(0);
			reservateService.resDatemanIns(vo2);
			vo3.setResDate(resDateMid);
			vo3.setResDateManId(resDateId2);
			vo3.setSitenum(siteNum);
			vo3.setUserid(userid);
			vo3.setResid(vo.getResid());
			vo3.setResstatus(0);
			reservateService.resDatemanIns(vo3);
			vo4.setResDate(resDateEnd);
			vo4.setResDateManId(resDateId3);
			vo4.setSitenum(siteNum);
			vo4.setUserid(userid);
			vo4.setResid(vo.getResid());
			vo4.setResstatus(0);
			reservateService.resDatemanIns(vo4);
		}


		ModelAndView mv=new ModelAndView();
		int page = 1;
		int limit = 10;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		String find_name=request.getParameter("find_name");
		String find_field=request.getParameter("find_field");
		r.setFind_field(find_field);
		r.setFind_name("%"+find_name+"%");
		r.setUserid(userid);
		int rescount = this.reservateService.resManListCount(r);

		r.setStartrow((page-1)*10+1);
		r.setEndrow(r.getStartrow()+limit-1);

		List<ReservationVO> resManList=this.reservateService.resManList(r);

		int maxpage=(int)((double)rescount/limit+0.95);
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		int endpage=maxpage;
		if(endpage > startpage+10-1) endpage=startpage+10-1;


		mv.addObject("resManList",resManList);
		mv.addObject("page",page);
		mv.addObject("startpage",startpage);
		mv.addObject("endpage",endpage);
		mv.addObject("maxpage",maxpage);
		mv.addObject("rescount",rescount);	
		mv.addObject("find_field",find_field);
		mv.addObject("find_name", find_name);
		mv.addObject("rescount", rescount);
		mv.setViewName("redirect:/confirm");
		return mv;
	}


	@RequestMapping("/refund")
	public String refund(HttpServletRequest request) {
		String resid = request.getParameter("resid");
		reservateService.refund(resid);
		/*
		 * reservateService.resDel(resid); reservateService.resvdel(resid);
		 */
		return "redirect:/confirm";
	}
	@RequestMapping("/cancelPay")
	public String cancelPay(HttpServletRequest request) {
		String resid = request.getParameter("resid");
		reservateService.resDel(resid);
		reservateService.resvdel(resid);
		return "redirect:/admin";
	}

	@RequestMapping("/reservation.do")
	public String resDayPick(HttpServletRequest request, Model model) {

		String resDateStart = request.getParameter("startDay");
		String resDateMid;
		String resDateEnd;
		ResDateManVO vo1 = new ResDateManVO();
		ResDateManVO vo2 = new ResDateManVO();
		ResDateManVO vo3 = new ResDateManVO();
		vo1.setResDate(resDateStart);
		reservateService.resDatemanIns(vo1);
		if(request.getParameter("resDateMid").isEmpty()) {
			resDateEnd = request.getParameter("resDateEnd");
			vo2.setResDate(resDateEnd);
			reservateService.resDatemanIns(vo2);	


		}else {
			resDateMid = request.getParameter("resDateMid");
			resDateEnd = request.getParameter("resDateEnd");
			vo2.setResDate(resDateMid);
			vo3.setResDate(resDateEnd);
			reservateService.resDatemanIns(vo2);
			reservateService.resDatemanIns(vo3);
		}

		List<ResDateManVO> list = reservateService.resDateManSel();
		model.addAttribute("list", list);

		return "/reservation/reservation";
	}



	//관리자 페이지 - 예약현황
	@RequestMapping("/admin")
	public ModelAndView admin(@ModelAttribute ReservationVO r, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		String auth = (String)session.getAttribute("auth");

		if(auth == null || auth != "admin") {
			out.println("<script>");
			out.println("alert('관리자만 접근할 수 있습니다.');");
			out.println("location='/';");
			out.println("</script>");
			return null;
		}

		int page = 1;
		int limit = 10;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		String find_name=request.getParameter("find_name");
		String find_field=request.getParameter("find_field");
		r.setFind_field(find_field);
		r.setFind_name("%"+find_name+"%");

		int rescount = this.reservateService.adminListCount(r);

		r.setStartrow((page-1)*10+1);
		r.setEndrow(r.getStartrow()+limit-1);

		List<ReservationVO> adminList=this.reservateService.adminList(r);

		int maxpage=(int)((double)rescount/limit+0.95);
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		int endpage=maxpage;
		if(endpage > startpage+10-1) endpage=startpage+10-1;

		ModelAndView mv=new ModelAndView();
		mv.addObject("adminList",adminList);
		mv.addObject("page",page);
		mv.addObject("startpage",startpage);
		mv.addObject("endpage",endpage);
		mv.addObject("maxpage",maxpage);
		mv.addObject("rescount",rescount);	
		mv.addObject("find_field",find_field);
		mv.addObject("find_name", find_name);
		mv.setViewName("/reservation/admin");
		return mv;
	}
}
