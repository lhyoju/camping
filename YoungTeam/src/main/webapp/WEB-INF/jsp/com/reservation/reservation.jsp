<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.example.demo.reservation.Reservate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>솔향기캠핑장</title>
<link href="/css/main.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link href="/css/sub.css" rel="stylesheet">
<link href="/css/board.css" rel="stylesheet">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css">
<script type="text/javascript">
	var a = 0;
</script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/reservation/calendar.js"></script>
<script type="text/javascript" src="/js/reservation/reservation1.js"></script>
<script type="text/javascript" src="/js/reservation/reservation2.js"></script>
<script type="text/javascript" src="/js/reservation/resDayChange.js"></script>



</head>

<body>

	<%@ include file="../main/header.jsp"%>
	<%
		Reservate reservate = new Reservate();
	SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
	Calendar cal = Calendar.getInstance();
	String resDateSt = request.getParameter("startDay");
	String resDateMid = null;
	String resDateEnd = null;
	String back = request.getParameter("back");
	int backInt = 1;
	if (resDateSt == null || resDateSt.equals("")) {

		resDateSt = reservate.getFormatedNow();
	} else {
		resDateSt = request.getParameter("startDay");
	}
	
	

	if (back == null || back.equals("")) {
		backInt = 1;
	} else {
		backInt = Integer.parseInt(back);
	}

	if (backInt == 1) {

		
			Date resDateStart = format.parse(resDateSt);
			cal.setTime(resDateStart);
			cal.add(cal.DATE, 1);
			resDateEnd = format.format(cal.getTime());
		
	}

	if (backInt == 2) {

		
			Date resDateStart = format.parse(resDateSt);
			cal.setTime(resDateStart);
			cal.add(cal.DATE, 1);
			resDateMid = format.format(cal.getTime());
		

		
			resDateStart = format.parse(resDateSt);
			cal.setTime(resDateStart);
			cal.add(cal.DATE, 2);
			resDateEnd = format.format(cal.getTime());
		}

	
	%>
	<div id="sub_visual">

		<div class="sub_visual3">
			<div class="sub_vis_inr wrap">
				<h1>캠핑장예약</h1>
				<p>솔향기캠핑장에 오신것을 환영합니다.</p>
			</div>
		</div>

	</div>
	<div id="sub_container">
		<div id="location"></div>
		<div id="sub_con_inner" class="wrap">




			<div id="sub_contents">
				<div id="title_container">
					<!-- 캠핑장 안내 -->
					<div class="page_navi">
						<span class="home"><a href="/">홈</a></span><span class="middle_n">캠핑장
							예약</span><span>실시간 예약</span>
					</div>
					<h1>실시간 예약</h1>

				</div>

				<div class="page reats" id="sub_page">
					<form method="post" action="/reservation2" name="fr" id="fr">
						<input type="hidden" name="siteNum" value="A1" id="siteNum">
						<input type="hidden" name="user_id" id="user_id" value="">
						<input type="hidden" name="site_id" id="site_id" value="">
						<input type="hidden" name="site_type" id="site_type" value="">
						<input type="hidden" name="dis_rate" id="dis_rate" value="0">
						<input type="hidden" name="user_dis_rate" id="user_dis_rate"
							value="">
						<h3>캠핑장 구역 선택</h3>
						<p>
							* 카라반 캠핑카 트레일러 추가요금 10,000원 있습니다.<br> <br>
						</p>
						<table class="hm_tab">
							<tbody>
								<tr>
									<th>예약일</th>
									<td><span> <input id="testDatepicker"
											name="startDay" type="text" onchange="resDayChange()"
											value="<%=resDateSt%>" readonly>


									</span> <span class="day_select"> <%
 	if (backInt == 1) {
 %> <select id="schGugun" name="back" title="" form="fr"
											onchange="resDayChange()">
												<option value="1" selected>1박</option>
												<option value="2">2박</option>
										</select> <input type="hidden" name="resDateEnd"
											value="<%=resDateEnd%>"> <%
 	} else if (backInt == 2) {
 %> <select id="schGugun" name="back" title="" form="fr"
											onchange="resDayChange()">
												<option value="1">1박</option>
												<option value="2" selected>2박</option>
										</select> <input type="hidden" name="resDateMid"
											value="<%=resDateMid%>"> <input type="hidden"
											name="resDateEnd" value="<%=resDateEnd%>"> <%
 	}
 %>
									</span></td>
								</tr>
								<tr>
									<th>시설사용료</th>
									<td><input type="text" name="siteprice" value="0"
										title="시설사용료" readonly=""><span>원</span></td>
								</tr>
								<tr>
									<th>쓰레기봉투값</th>
									<td>
										<%
											if (backInt == 1) {
										%> <input type="text" name="bagprice" value="680"
										title="쓰레기봉투" readonly=""> <%
 	} else if (backInt == 2) {
 %> <input type="text" name="bagprice" value="1360" title="쓰레기봉투"
										readonly=""> <%
 	}
 %> <span>원</span>
									</td>
								</tr>
								<tr>
									<th>총 금액</th>
									<td><input type="text" name="price" value="0" title="총사용료"
										readonly=""><span>원</span></td>
								</tr>
							</tbody>
						</table>
						

						<p class="sub_reTxt">
							<span style="font-size: 20px;">※ (주말 금.토.일) 숙박하지않고 당일
								이용하실분은 전화[010-2759-4639]문의 주세요!!!</span> <span>(상담시간am:9시~pm:6시)</span>
							<br> 결재는 카드결재 또는 계좌이체 가능합니다.<br> <span
								style="font-size: 20px;">무통장입금 하실 분은 전화주시면 신속히 예약
								도와드리겠습니다.</span><br> ※ 홈페이지에서 예약취소 및 환불요청을 반드시 하시기
							바랍니다.<br> ※ 한사이트 4명 이용가능하고 5명 부터 (추가금 발생) 최대 6명까지
							이용가능합니다.(영유아 인원 포함입니다)<br> 예약후 <span>예약날짜</span>확인 꼭 당부드립니다.<br> [예약 후 바로
							날짜변경,자리변경,환불요청 하더라도 위약금이 발생하오니 예약하시기전에 신중하게 날짜,자리,일정 확인 후
							예약하십시요.]<br> 주의사항 : <span>3m높이 제한</span>있으므로 예약하기전 꼭 참고 바랍니다<br>
							* 카라반 캠핑카 트레일러 추가요금 <span>10,000원</span> 있습니다.<br> * 변전함 거리가
							있습니다 <span>30m릴선</span> 준비 바랍니다.
							<!-- <span>※ 24시간이내에 결제 하지 않을 시 자동 취소됩니다.</span> -->
						</p>
						<!--<p class="sub_reTxt">※ R구역은 전화 예약만 가능합니다.<br /></p>-->
						<div id="res_map_intro">

							<div class="left_intro">
								<img src="" alt="">
								<!--
		<p class="left_intro_txt" align="center">※ R구역도 사이트 옆에 주차 가능합니다.<br />※ R구역예약 전화 문의 주세요.</p>
		-->
							</div>
							<div class="right_intro">
								<ul>
									<li class="rmi_01">예약가능</li>
									<li class="rmi_02">자리선택</li>
								</ul>
								<ul>
									<li class="rmi_03">예약완료 (결제대기)</li>
									<li class="rmi_04">자리선택 (결제완료)</li>
									<li class="rmi_05">예약대기</li>
								</ul>
							</div>
						</div>

						<div id="res_click_map">
							<img src="/img/sub_real_time_img01.jpg">
							<div class="click_inner">



								<div class="cbtn cbtn_01  cbtn_on  "
									onclick="plusPrice(25000, 'A1')" id="A1_site">
									A1 <input type="hidden" class="siteid" value="150"> <input
										type="hidden" class="sitetype" value="A"> <input
										type="hidden" class="site_price" value="25000">
								</div>


								<div onclick="plusPrice(25000, 'A2')"
									class="cbtn cbtn_02  cbtn_on  " id="A2_site">
									A2 <input type="hidden" class="siteid" value="96"> <input
										type="hidden" class="sitetype" value="A"> <input
										type="hidden" class="site_price" value="25000">
								</div>
								<div onclick="plusPrice(25000, 'A3')"
									class="cbtn cbtn_03  cbtn_on  " id="A3_site">
									A3 <input type="hidden" class="siteid" value="97"> <input
										type="hidden" class="sitetype" value="A"> <input
										type="hidden" class="site_price" value="25000">
								</div>
								<div onclick="plusPrice(25000, 'A4')"
									class="cbtn cbtn_04  cbtn_on  " id="A4_site">
									A4 <input type="hidden" class="siteid" value="98"> <input
										type="hidden" class="sitetype" value="A"> <input
										type="hidden" class="site_price" value="25000">
								</div>
								<div onclick="plusPrice(25000, 'A5')"
									class="cbtn cbtn_05  cbtn_on  " id="A5_site">
									A5 <input type="hidden" class="siteid" value="99"> <input
										type="hidden" class="sitetype" value="A"> <input
										type="hidden" class="site_price" value="25000">
								</div>
								<div onclick="plusPrice(25000, 'A6')"
									class="cbtn cbtn_06  cbtn_on  " id="A6_site">
									A6 <input type="hidden" class="siteid" value="100"> <input
										type="hidden" class="sitetype" value="A"> <input
										type="hidden" class="site_price" value="25000">
								</div>
								<div onclick="plusPrice(25000, 'A7')"
									class="cbtn cbtn_07  cbtn_on  " id="A7_site">
									A7 <input type="hidden" class="siteid" value="101"> <input
										type="hidden" class="sitetype" value="A"> <input
										type="hidden" class="site_price" value="25000">
								</div>
								<div onclick="plusPrice(25000, 'A8')"
									class="cbtn cbtn_08  cbtn_on  " id="A8_site">
									A8 <input type="hidden" class="siteid" value="102"> <input
										type="hidden" class="sitetype" value="A"> <input
										type="hidden" class="site_price" value="25000">
								</div>
								<div onclick="plusPrice(25000, 'B1')"
									class="cbtn cbtn_09  cbtn_on  " id="B1_site">
									B1 <input type="hidden" class="siteid" value="103"> <input
										type="hidden" class="sitetype" value="B"> <input
										type="hidden" class="site_price" value="25000">
								</div>
								<div onclick="plusPrice(25000, 'B2')"
									class="cbtn cbtn_10  cbtn_on  " id="B2_site">
									B2 <input type="hidden" class="siteid" value="104"> <input
										type="hidden" class="sitetype" value="B"> <input
										type="hidden" class="site_price" value="25000">
								</div>
								<div onclick="plusPrice(25000, 'B3')"
									class="cbtn cbtn_11  cbtn_on  " id="B3_site">
									B3 <input type="hidden" class="siteid" value="105"> <input
										type="hidden" class="sitetype" value="B"> <input
										type="hidden" class="site_price" value="25000">
								</div>
								<div onclick="plusPrice(25000, 'B4')"
									class="cbtn cbtn_12  cbtn_on  " id="B4_site">
									B4 <input type="hidden" class="siteid" value="106"> <input
										type="hidden" class="sitetype" value="B"> <input
										type="hidden" class="site_price" value="25000">
								</div>
								<div onclick="plusPrice(25000, 'B5')"
									class="cbtn cbtn_13  cbtn_on  " id="B5_site">
									B5 <input type="hidden" class="siteid" value="107"> <input
										type="hidden" class="sitetype" value="B"> <input
										type="hidden" class="site_price" value="25000">
								</div>
								<div onclick="plusPrice(25000, 'B6')"
									class="cbtn cbtn_14  cbtn_on  " id="B6_site">
									B6 <input type="hidden" class="siteid" value="108"> <input
										type="hidden" class="sitetype" value="B"> <input
										type="hidden" class="site_price" value="25000">
								</div>
								<div onclick="plusPrice(25000, 'B7')"
									class="cbtn cbtn_15  cbtn_on  " id="B7_site">
									B7 <input type="hidden" class="siteid" value="109"> <input
										type="hidden" class="sitetype" value="B"> <input
										type="hidden" class="site_price" value="25000">
								</div>
								<div onclick="plusPrice(25000, 'C1')"
									class="cbtn cbtn_16  cbtn_on  " id="C1_site">
									C1 <input type="hidden" class="siteid" value="110"> <input
										type="hidden" class="sitetype" value="C"> <input
										type="hidden" class="site_price" value="25000">
								</div>
								<div onclick="plusPrice(25000, 'C2')"
									class="cbtn cbtn_17  cbtn_on  " id="C2_site">
									C2 <input type="hidden" class="siteid" value="111"> <input
										type="hidden" class="sitetype" value="C"> <input
										type="hidden" class="site_price" value="25000">
								</div>
								<div onclick="plusPrice(25000, 'C3')"
									class="cbtn cbtn_18  cbtn_on  " id="C3_site">
									C3 <input type="hidden" class="siteid" value="112"> <input
										type="hidden" class="sitetype" value="C"> <input
										type="hidden" class="site_price" value="25000">
								</div>
								<div onclick="plusPrice(25000, 'C4')"
									class="cbtn cbtn_19  cbtn_on  " id="C4_site">
									C4 <input type="hidden" class="siteid" value="113"> <input
										type="hidden" class="sitetype" value="C"> <input
										type="hidden" class="site_price" value="25000">
								</div>
								<div onclick="plusPrice(25000, 'C5')"
									class="cbtn cbtn_20  cbtn_on  " id="C5_site">
									C5 <input type="hidden" class="siteid" value="114"> <input
										type="hidden" class="sitetype" value="C"> <input
										type="hidden" class="site_price" value="25000">
								</div>
								<div onclick="plusPrice(25000, 'D1')"
									class="cbtn cbtn_21  cbtn_on  " id="D1_site">
									D1 <input type="hidden" class="siteid" value="115"> <input
										type="hidden" class="sitetype" value="D"> <input
										type="hidden" class="site_price" value="25000">
								</div>
								<div onclick="plusPrice(25000, 'D2')"
									class="cbtn cbtn_22  cbtn_on  " id="D2_site">
									D2 <input type="hidden" class="siteid" value="116"> <input
										type="hidden" class="sitetype" value="D"> <input
										type="hidden" class="site_price" value="25000">
								</div>
								<div onclick="plusPrice(25000, 'D3')"
									class="cbtn cbtn_23  cbtn_on  " id="D3_site">
									D3 <input type="hidden" class="siteid" value="117"> <input
										type="hidden" class="sitetype" value="D"> <input
										type="hidden" class="site_price" value="25000">
								</div>
								<div onclick="plusPrice(25000, 'D4')"
									class="cbtn cbtn_24  cbtn_on  " id="D4_site">
									D4 <input type="hidden" class="siteid" value="118"> <input
										type="hidden" class="sitetype" value="D"> <input
										type="hidden" class="site_price" value="25000">
								</div>
								<div onclick="plusPrice(25000, 'D5')"
									class="cbtn cbtn_25  cbtn_on  " id="D5_site">
									D5 <input type="hidden" class="siteid" value="119"> <input
										type="hidden" class="sitetype" value="D"> <input
										type="hidden" class="site_price" value="25000">
								</div>
								<div onclick="plusPrice(25000, 'E1')"
									class="cbtn cbtn_26  cbtn_on  " id="E1_site">
									E1 <input type="hidden" class="siteid" value="120"> <input
										type="hidden" class="sitetype" value="E"> <input
										type="hidden" class="site_price" value="25000">
								</div>
								<div onclick="plusPrice(25000, 'E2')"
									class="cbtn cbtn_27  cbtn_on  " id="E2_site">
									E2 <input type="hidden" class="siteid" value="121"> <input
										type="hidden" class="sitetype" value="E"> <input
										type="hidden" class="site_price" value="25000">
								</div>
								<div onclick="plusPrice(25000, 'E3')"
									class="cbtn cbtn_28  cbtn_on  " id="E3_site">
									E3 <input type="hidden" class="siteid" value="122"> <input
										type="hidden" class="sitetype" value="E"> <input
										type="hidden" class="site_price" value="25000">
								</div>
								<div onclick="plusPrice(25000, 'E4')"
									class="cbtn cbtn_29  cbtn_on  " id="E4_site">
									E4 <input type="hidden" class="siteid" value="123"> <input
										type="hidden" class="sitetype" value="E"> <input
										type="hidden" class="site_price" value="25000">
								</div>
								<div onclick="plusPrice(25000, 'E5')"
									class="cbtn cbtn_30  cbtn_on  " id="E5_site">
									E5 <input type="hidden" class="siteid" value="124"> <input
										type="hidden" class="sitetype" value="E"> <input
										type="hidden" class="site_price" value="25000">
								</div>

								<c:set var="resDate" value="<%=resDateSt%>" />
								<c:set var="back" value="<%=backInt%>" />
								<%
									if (backInt == 1) {
								%>

								<c:set var="resDateEnd" value="<%=resDateEnd%>" />
								<%
									} else if (backInt == 2) {
								%>
								<c:set var="resDateMid" value="<%=resDateMid%>" />
								<c:set var="resDateEnd" value="<%=resDateEnd%>" />
								<%
									}
								%>
								<c:if test="${back eq  '1'}">

									<c:forEach var="i" items="${list }">

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'A1' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'A1' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_01  cbtn_Pcomplete  " id="A1_site">
												A1 <input type="hidden" class="siteid" value="150">
												<input type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'A2' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'A2' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_02  cbtn_Pcomplete  " id="A2_site">
												A2 <input type="hidden" class="siteid" value="96"> <input
													type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>
										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'A3' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'A3' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_03  cbtn_Pcomplete  " id="A3_site">
												A3 <input type="hidden" class="siteid" value="97"> <input
													type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'A4' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'A4' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_04  cbtn_Pcomplete  " id="A4_site">
												A4 <input type="hidden" class="siteid" value="98"> <input
													type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'A5'and i.resstatus eq '0' ) or (i.resDate eq resDateEnd and i.sitenum eq 'A5' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_05  cbtn_Pcomplete  " id="A5_site">
												A5 <input type="hidden" class="siteid" value="99"> <input
													type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'A6' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'A6' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_06  cbtn_Pcomplete  " id="A6_site">
												A6 <input type="hidden" class="siteid" value="100">
												<input type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'A7' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'A7' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_07  cbtn_Pcomplete  " id="A7_site">
												A7 <input type="hidden" class="siteid" value="101">
												<input type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'A8' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'A8' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_08  cbtn_Pcomplete  " id="A8_site">
												A8 <input type="hidden" class="siteid" value="102">
												<input type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'B1' and i.resstatus eq '0' ) or (i.resDate eq resDateEnd and i.sitenum eq 'B1' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_09  cbtn_Pcomplete  " id="B1_site">
												B1 <input type="hidden" class="siteid" value="103">
												<input type="hidden" class="sitetype" value="B"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'B2' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'B2' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_10  cbtn_Pcomplete  " id="B2_site">
												B2 <input type="hidden" class="siteid" value="104">
												<input type="hidden" class="sitetype" value="B"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'B3' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'B3' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_11  cbtn_Pcomplete  " id="B3_site">
												B3 <input type="hidden" class="siteid" value="105">
												<input type="hidden" class="sitetype" value="B"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'B4' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'B4' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_12  cbtn_Pcomplete  " id="B4_site">
												B4 <input type="hidden" class="siteid" value="106">
												<input type="hidden" class="sitetype" value="B"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'B5' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'B5' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_13  cbtn_Pcomplete  " id="B5_site">
												B5 <input type="hidden" class="siteid" value="107">
												<input type="hidden" class="sitetype" value="B"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'B6' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'B6' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_14  cbtn_Pcomplete  " id="B6_site">
												B6 <input type="hidden" class="siteid" value="108">
												<input type="hidden" class="sitetype" value="B"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'B7' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'B7' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_15  cbtn_Pcomplete  " id="B7_site">
												B7 <input type="hidden" class="siteid" value="109">
												<input type="hidden" class="sitetype" value="B"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'C1' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'C1' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_16  cbtn_Pcomplete  " id="C1_site">
												C1 <input type="hidden" class="siteid" value="110">
												<input type="hidden" class="sitetype" value="C"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'C2' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'C2' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_17  cbtn_Pcomplete  " id="C2_site">
												C2 <input type="hidden" class="siteid" value="111">
												<input type="hidden" class="sitetype" value="C"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'C3' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'C3' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_18  cbtn_Pcomplete  " id="C3_site">
												C3 <input type="hidden" class="siteid" value="112">
												<input type="hidden" class="sitetype" value="C"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'C4' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'C4' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_19  cbtn_Pcomplete  " id="C4_site">
												C4 <input type="hidden" class="siteid" value="113">
												<input type="hidden" class="sitetype" value="C"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'C5' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'C5' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_20  cbtn_Pcomplete  " id="C5_site">
												C5 <input type="hidden" class="siteid" value="114">
												<input type="hidden" class="sitetype" value="C"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'D1' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'D1' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_21  cbtn_Pcomplete  " id="D1_site">
												D1 <input type="hidden" class="siteid" value="115">
												<input type="hidden" class="sitetype" value="D"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'D2' and i.resstatus eq '0' ) or (i.resDate eq resDateEnd and i.sitenum eq 'D2' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_22  cbtn_Pcomplete  " id="D2_site">
												D2 <input type="hidden" class="siteid" value="116">
												<input type="hidden" class="sitetype" value="D"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'D3' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'D3' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_23  cbtn_Pcomplete " id="D3_site">
												D3 <input type="hidden" class="siteid" value="117">
												<input type="hidden" class="sitetype" value="D"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'D4' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'D5' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_24  cbtn_Pcomplete  " id="D4_site">
												D4 <input type="hidden" class="siteid" value="118">
												<input type="hidden" class="sitetype" value="D"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'D5' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'D5' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_25  cbtn_Pcomplete  " id="D5_site">
												D5 <input type="hidden" class="siteid" value="119">
												<input type="hidden" class="sitetype" value="D"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'E1' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'E1' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_26  cbtn_Pcomplete  " id="E1_site">
												E1 <input type="hidden" class="siteid" value="120">
												<input type="hidden" class="sitetype" value="E"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'E2' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'E2' and i.resstatus eq '0' )}">
											<div class="cbtn cbtn_27  cbtn_Pcomplete  " id="E2_site">
												E2 <input type="hidden" class="siteid" value="121">
												<input type="hidden" class="sitetype" value="E"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'E3' and i.resstatus eq '0' ) or (i.resDate eq resDateEnd and i.sitenum eq 'E3' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_28  cbtn_Pcomplete" id="E3_site">
												E3 <input type="hidden" class="siteid" value="122">
												<input type="hidden" class="sitetype" value="E"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'E4' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'E4' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_29  cbtn_Pcomplete" id="E4_site">
												E4 <input type="hidden" class="siteid" value="123">
												<input type="hidden" class="sitetype" value="E"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'E5' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'E5' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_30  cbtn_Pcomplete" id="E5_site">
												E5 <input type="hidden" class="siteid" value="124">
												<input type="hidden" class="sitetype" value="E"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

									</c:forEach>
									
									<c:forEach var="i" items="${list }">

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'A1' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'A1' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_01  cbtn_Pwaiting  " id="A1_site">
												A1 <input type="hidden" class="siteid" value="150">
												<input type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'A2' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'A2' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_02  cbtn_Pwaiting  " id="A2_site">
												A2 <input type="hidden" class="siteid" value="96"> <input
													type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>
										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'A3' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'A3' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_03  cbtn_Pwaiting  " id="A3_site">
												A3 <input type="hidden" class="siteid" value="97"> <input
													type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'A4' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'A4' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_04  cbtn_Pwaiting  " id="A4_site">
												A4 <input type="hidden" class="siteid" value="98"> <input
													type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'A5'and i.resstatus eq '1' ) or (i.resDate eq resDateEnd and i.sitenum eq 'A5' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_05  cbtn_Pwaiting  " id="A5_site">
												A5 <input type="hidden" class="siteid" value="99"> <input
													type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'A6' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'A6' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_06  cbtn_Pwaiting  " id="A6_site">
												A6 <input type="hidden" class="siteid" value="100">
												<input type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'A7' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'A7' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_07  cbtn_Pwaiting  " id="A7_site">
												A7 <input type="hidden" class="siteid" value="101">
												<input type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'A8' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'A8' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_08  cbtn_Pwaiting  " id="A8_site">
												A8 <input type="hidden" class="siteid" value="102">
												<input type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'B1' and i.resstatus eq '1' ) or (i.resDate eq resDateEnd and i.sitenum eq 'B1' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_09  cbtn_Pwaiting  " id="B1_site">
												B1 <input type="hidden" class="siteid" value="103">
												<input type="hidden" class="sitetype" value="B"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'B2' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'B2' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_10  cbtn_Pwaiting  " id="B2_site">
												B2 <input type="hidden" class="siteid" value="104">
												<input type="hidden" class="sitetype" value="B"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'B3' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'B3' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_11  cbtn_Pwaiting  " id="B3_site">
												B3 <input type="hidden" class="siteid" value="105">
												<input type="hidden" class="sitetype" value="B"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'B4' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'B4' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_12  cbtn_Pwaiting  " id="B4_site">
												B4 <input type="hidden" class="siteid" value="106">
												<input type="hidden" class="sitetype" value="B"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'B5' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'B5' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_13  cbtn_Pwaiting  " id="B5_site">
												B5 <input type="hidden" class="siteid" value="107">
												<input type="hidden" class="sitetype" value="B"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'B6' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'B6' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_14  cbtn_Pwaiting  " id="B6_site">
												B6 <input type="hidden" class="siteid" value="108">
												<input type="hidden" class="sitetype" value="B"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'B7' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'B7' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_15  cbtn_Pwaiting  " id="B7_site">
												B7 <input type="hidden" class="siteid" value="109">
												<input type="hidden" class="sitetype" value="B"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'C1' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'C1' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_16  cbtn_Pwaiting  " id="C1_site">
												C1 <input type="hidden" class="siteid" value="110">
												<input type="hidden" class="sitetype" value="C"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'C2' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'C2' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_17  cbtn_Pwaiting  " id="C2_site">
												C2 <input type="hidden" class="siteid" value="111">
												<input type="hidden" class="sitetype" value="C"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'C3' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'C3' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_18  cbtn_Pwaiting  " id="C3_site">
												C3 <input type="hidden" class="siteid" value="112">
												<input type="hidden" class="sitetype" value="C"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'C4' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'C4' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_19  cbtn_Pwaiting  " id="C4_site">
												C4 <input type="hidden" class="siteid" value="113">
												<input type="hidden" class="sitetype" value="C"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'C5' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'C5' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_20  cbtn_Pwaiting  " id="C5_site">
												C5 <input type="hidden" class="siteid" value="114">
												<input type="hidden" class="sitetype" value="C"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'D1' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'D1' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_21  cbtn_Pwaiting  " id="D1_site">
												D1 <input type="hidden" class="siteid" value="115">
												<input type="hidden" class="sitetype" value="D"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'D2' and i.resstatus eq '1' ) or (i.resDate eq resDateEnd and i.sitenum eq 'D2' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_22  cbtn_Pwaiting  " id="D2_site">
												D2 <input type="hidden" class="siteid" value="116">
												<input type="hidden" class="sitetype" value="D"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'D3' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'D3' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_23  cbtn_Pwaiting " id="D3_site">
												D3 <input type="hidden" class="siteid" value="117">
												<input type="hidden" class="sitetype" value="D"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if
											test="${(i.resDate eq resDate and i.sitenum eq 'D4' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'D5' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_24  cbtn_Pwaiting  " id="D4_site">
												D4 <input type="hidden" class="siteid" value="118">
												<input type="hidden" class="sitetype" value="D"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'D5' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'D5' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_25  cbtn_Pwaiting  " id="D5_site">
												D5 <input type="hidden" class="siteid" value="119">
												<input type="hidden" class="sitetype" value="D"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'E1' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'E1' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_26  cbtn_Pwaiting  " id="E1_site">
												E1 <input type="hidden" class="siteid" value="120">
												<input type="hidden" class="sitetype" value="E"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'E2' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'E2' and i.resstatus eq '1' )}">
											<div class="cbtn cbtn_27  cbtn_Pwaiting  " id="E2_site">
												E2 <input type="hidden" class="siteid" value="121">
												<input type="hidden" class="sitetype" value="E"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'E3' and i.resstatus eq '1' ) or (i.resDate eq resDateEnd and i.sitenum eq 'E3' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_28  cbtn_Pwaiting" id="E3_site">
												E3 <input type="hidden" class="siteid" value="122">
												<input type="hidden" class="sitetype" value="E"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'E4' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'E4' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_29  cbtn_Pwaiting" id="E4_site">
												E4 <input type="hidden" class="siteid" value="123">
												<input type="hidden" class="sitetype" value="E"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'E5' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'E5' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_30  cbtn_Pwaiting" id="E5_site">
												E5 <input type="hidden" class="siteid" value="124">
												<input type="hidden" class="sitetype" value="E"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

									</c:forEach>
								</c:if>

								<c:if test="${back eq '2' }">
									<c:forEach var="i" items="${list }">

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'A1' and i.resstatus eq '0') or (i.resDate eq resDateMid and i.sitenum eq 'A1' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'A1' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_01  cbtn_Pcomplete  " id="A1_site">
												A1 <input type="hidden" class="siteid" value="150">
												<input type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'A2' and i.resstatus eq '0') or (i.resDate eq resDateMid and i.sitenum eq 'A2' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'A2' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_02  cbtn_Pcomplete  " id="A2_site">
												A2 <input type="hidden" class="siteid" value="96"> <input
													type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>
										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'A3' and i.resstatus eq '0') or (i.resDate eq resDateMid and i.sitenum eq 'A3' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'A3' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_03  cbtn_Pcomplete  " id="A3_site">
												A3 <input type="hidden" class="siteid" value="97"> <input
													type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'A4' and i.resstatus eq '0') or (i.resDate eq resDateMid and i.sitenum eq 'A4' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'A4' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_04  cbtn_Pcomplete  " id="A4_site">
												A4 <input type="hidden" class="siteid" value="98"> <input
													type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'A5' and i.resstatus eq '0') or (i.resDate eq resDateMid and i.sitenum eq 'A5' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'A5' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_05  cbtn_Pcomplete  " id="A5_site">
												A5 <input type="hidden" class="siteid" value="99"> <input
													type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'A6' and i.resstatus eq '0') or (i.resDate eq resDateMid and i.sitenum eq 'A6' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'A6' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_06  cbtn_Pcomplete  " id="A6_site">
												A6 <input type="hidden" class="siteid" value="100">
												<input type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'A7' and i.resstatus eq '0') or (i.resDate eq resDateMid and i.sitenum eq 'A7' and i.resstatus eq '0' ) or (i.resDate eq resDateEnd and i.sitenum eq 'A7' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_07  cbtn_Pcomplete  " id="A7_site">
												A7 <input type="hidden" class="siteid" value="101">
												<input type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'A8' and i.resstatus eq '0') or (i.resDate eq resDateMid and i.sitenum eq 'A8' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'A8' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_08  cbtn_Pcomplete  " id="A8_site">
												A8 <input type="hidden" class="siteid" value="102">
												<input type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'B1' and i.resstatus eq '0') or (i.resDate eq resDateMid and i.sitenum eq 'B1' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'B1' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_09  cbtn_Pcomplete  " id="B1_site">
												B1 <input type="hidden" class="siteid" value="103">
												<input type="hidden" class="sitetype" value="B"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'B2' and i.resstatus eq '0') or (i.resDate eq resDateMid and i.sitenum eq 'B2' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'B2' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_10  cbtn_Pcomplete  " id="B2_site">
												B2 <input type="hidden" class="siteid" value="104">
												<input type="hidden" class="sitetype" value="B"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'B3' and i.resstatus eq '0') or (i.resDate eq resDateMid and i.sitenum eq 'B3' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'B3' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_11  cbtn_Pcomplete  " id="B3_site">
												B3 <input type="hidden" class="siteid" value="105">
												<input type="hidden" class="sitetype" value="B"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'B4' and i.resstatus eq '0') or (i.resDate eq resDateMid and i.sitenum eq 'B4' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'B4' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_12  cbtn_Pcomplete  " id="B4_site">
												B4 <input type="hidden" class="siteid" value="106">
												<input type="hidden" class="sitetype" value="B"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'B5' and i.resstatus eq '0') or (i.resDate eq resDateMid and i.sitenum eq 'B5' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'B5' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_13  cbtn_Pcomplete  " id="B5_site">
												B5 <input type="hidden" class="siteid" value="107">
												<input type="hidden" class="sitetype" value="B"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'B6' and i.resstatus eq '0') or (i.resDate eq resDateMid and i.sitenum eq 'B6' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'B6' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_14  cbtn_Pcomplete  " id="B6_site">
												B6 <input type="hidden" class="siteid" value="108">
												<input type="hidden" class="sitetype" value="B"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'B7' and i.resstatus eq '0') or (i.resDate eq resDateMid and i.sitenum eq 'B7' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'B7' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_15  cbtn_Pcomplete  " id="B7_site">
												B7 <input type="hidden" class="siteid" value="109">
												<input type="hidden" class="sitetype" value="B"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'C1' and i.resstatus eq '0') or (i.resDate eq resDateMid and i.sitenum eq 'C1' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'C1' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_16  cbtn_Pcomplete  " id="C1_site">
												C1 <input type="hidden" class="siteid" value="110">
												<input type="hidden" class="sitetype" value="C"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'C2' and i.resstatus eq '0') or (i.resDate eq resDateMid and i.sitenum eq 'C2' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'C2' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_17  cbtn_Pcomplete  " id="C2_site">
												C2 <input type="hidden" class="siteid" value="111">
												<input type="hidden" class="sitetype" value="C"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'C3' and i.resstatus eq '0') or (i.resDate eq resDateMid and i.sitenum eq 'C3' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'C3' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_18  cbtn_Pcomplete  " id="C3_site">
												C3 <input type="hidden" class="siteid" value="112">
												<input type="hidden" class="sitetype" value="C"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'C4' and i.resstatus eq '0') or (i.resDate eq resDateMid and i.sitenum eq 'C4' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'C4' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_19  cbtn_Pcomplete  " id="C4_site">
												C4 <input type="hidden" class="siteid" value="113">
												<input type="hidden" class="sitetype" value="C"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'C5' and i.resstatus eq '0') or (i.resDate eq resDateMid and i.sitenum eq 'C5' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'C5' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_20  cbtn_Pcomplete  " id="C5_site">
												C5 <input type="hidden" class="siteid" value="114">
												<input type="hidden" class="sitetype" value="C"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'D1' and i.resstatus eq '0') or (i.resDate eq resDateMid and i.sitenum eq 'D1' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'D1' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_21  cbtn_Pcomplete  " id="D1_site">
												D1 <input type="hidden" class="siteid" value="115">
												<input type="hidden" class="sitetype" value="D"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'D2' and i.resstatus eq '0') or (i.resDate eq resDateMid and i.sitenum eq 'D2' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'D2' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_22  cbtn_Pcomplete  " id="D2_site">
												D2 <input type="hidden" class="siteid" value="116">
												<input type="hidden" class="sitetype" value="D"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'D3' and i.resstatus eq '0') or (i.resDate eq resDateMid and i.sitenum eq 'D3' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'D3' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_23  cbtn_Pcomplete " id="D3_site">
												D3 <input type="hidden" class="siteid" value="117">
												<input type="hidden" class="sitetype" value="D"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'D4' and i.resstatus eq '0') or (i.resDate eq resDateMid and i.sitenum eq 'D4' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'D4' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_24  cbtn_Pcomplete  " id="D4_site">
												D4 <input type="hidden" class="siteid" value="118">
												<input type="hidden" class="sitetype" value="D"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'D5' and i.resstatus eq '0') or (i.resDate eq resDateMid and i.sitenum eq 'D5' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'D5' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_25  cbtn_Pcomplete  " id="D5_site">
												D5 <input type="hidden" class="siteid" value="119">
												<input type="hidden" class="sitetype" value="D"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'E1' and i.resstatus eq '0') or (i.resDate eq resDateMid and i.sitenum eq 'E1' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'E1' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_26  cbtn_Pcomplete  " id="E1_site">
												E1 <input type="hidden" class="siteid" value="120">
												<input type="hidden" class="sitetype" value="E"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'E2' and i.resstatus eq '0') or (i.resDate eq resDateMid and i.sitenum eq 'E2'  and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'E2' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_27  cbtn_Pcomplete  " id="E2_site">
												E2 <input type="hidden" class="siteid" value="121">
												<input type="hidden" class="sitetype" value="E"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'E3' and i.resstatus eq '0') or (i.resDate eq resDateMid and i.sitenum eq 'E3' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'E3' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_28  cbtn_Pcomplete" id="E3_site">
												E3 <input type="hidden" class="siteid" value="122">
												<input type="hidden" class="sitetype" value="E"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'E4' and i.resstatus eq '0') or (i.resDate eq resDateMid and i.sitenum eq 'E4' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'E5' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_29  cbtn_Pcomplete" id="E4_site">
												E4 <input type="hidden" class="siteid" value="123">
												<input type="hidden" class="sitetype" value="E"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'E5' and i.resstatus eq '0') or (i.resDate eq resDateMid and i.sitenum eq 'E5' and i.resstatus eq '0') or (i.resDate eq resDateEnd and i.sitenum eq 'E5' and i.resstatus eq '0')}">
											<div class="cbtn cbtn_30  cbtn_Pcomplete" id="E5_site">
												E5 <input type="hidden" class="siteid" value="124">
												<input type="hidden" class="sitetype" value="E"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

									</c:forEach>
									
									<c:forEach var="i" items="${list }">

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'A1' and i.resstatus eq '1') or (i.resDate eq resDateMid and i.sitenum eq 'A1' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'A1' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_01  cbtn_Pwaiting  " id="A1_site">
												A1 <input type="hidden" class="siteid" value="150">
												<input type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'A2' and i.resstatus eq '1') or (i.resDate eq resDateMid and i.sitenum eq 'A2' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'A2' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_02  cbtn_Pwaiting  " id="A2_site">
												A2 <input type="hidden" class="siteid" value="96"> <input
													type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>
										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'A3' and i.resstatus eq '1') or (i.resDate eq resDateMid and i.sitenum eq 'A3' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'A3' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_03  cbtn_Pwaiting  " id="A3_site">
												A3 <input type="hidden" class="siteid" value="97"> <input
													type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'A4' and i.resstatus eq '1') or (i.resDate eq resDateMid and i.sitenum eq 'A4' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'A4' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_04  cbtn_Pwaiting  " id="A4_site">
												A4 <input type="hidden" class="siteid" value="98"> <input
													type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'A5' and i.resstatus eq '1') or (i.resDate eq resDateMid and i.sitenum eq 'A5' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'A5' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_05  cbtn_Pwaiting  " id="A5_site">
												A5 <input type="hidden" class="siteid" value="99"> <input
													type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'A6' and i.resstatus eq '1') or (i.resDate eq resDateMid and i.sitenum eq 'A6' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'A6' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_06  cbtn_Pwaiting  " id="A6_site">
												A6 <input type="hidden" class="siteid" value="100">
												<input type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'A7' and i.resstatus eq '1') or (i.resDate eq resDateMid and i.sitenum eq 'A7' and i.resstatus eq '1' ) or (i.resDate eq resDateEnd and i.sitenum eq 'A7' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_07  cbtn_Pwaiting  " id="A7_site">
												A7 <input type="hidden" class="siteid" value="101">
												<input type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'A8' and i.resstatus eq '1') or (i.resDate eq resDateMid and i.sitenum eq 'A8' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'A8' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_08  cbtn_Pwaiting  " id="A8_site">
												A8 <input type="hidden" class="siteid" value="102">
												<input type="hidden" class="sitetype" value="A"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'B1' and i.resstatus eq '1') or (i.resDate eq resDateMid and i.sitenum eq 'B1' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'B1' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_09  cbtn_Pwaiting  " id="B1_site">
												B1 <input type="hidden" class="siteid" value="103">
												<input type="hidden" class="sitetype" value="B"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'B2' and i.resstatus eq '1') or (i.resDate eq resDateMid and i.sitenum eq 'B2' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'B2' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_10  cbtn_Pwaiting  " id="B2_site">
												B2 <input type="hidden" class="siteid" value="104">
												<input type="hidden" class="sitetype" value="B"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'B3' and i.resstatus eq '1') or (i.resDate eq resDateMid and i.sitenum eq 'B3' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'B3' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_11  cbtn_Pwaiting  " id="B3_site">
												B3 <input type="hidden" class="siteid" value="105">
												<input type="hidden" class="sitetype" value="B"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'B4' and i.resstatus eq '1') or (i.resDate eq resDateMid and i.sitenum eq 'B4' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'B4' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_12  cbtn_Pwaiting  " id="B4_site">
												B4 <input type="hidden" class="siteid" value="106">
												<input type="hidden" class="sitetype" value="B"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'B5' and i.resstatus eq '1') or (i.resDate eq resDateMid and i.sitenum eq 'B5' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'B5' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_13  cbtn_Pwaiting  " id="B5_site">
												B5 <input type="hidden" class="siteid" value="107">
												<input type="hidden" class="sitetype" value="B"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'B6' and i.resstatus eq '1') or (i.resDate eq resDateMid and i.sitenum eq 'B6' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'B6' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_14  cbtn_Pwaiting  " id="B6_site">
												B6 <input type="hidden" class="siteid" value="108">
												<input type="hidden" class="sitetype" value="B"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'B7' and i.resstatus eq '1') or (i.resDate eq resDateMid and i.sitenum eq 'B7' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'B7' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_15  cbtn_Pwaiting  " id="B7_site">
												B7 <input type="hidden" class="siteid" value="109">
												<input type="hidden" class="sitetype" value="B"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'C1' and i.resstatus eq '1') or (i.resDate eq resDateMid and i.sitenum eq 'C1' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'C1' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_16  cbtn_Pwaiting  " id="C1_site">
												C1 <input type="hidden" class="siteid" value="110">
												<input type="hidden" class="sitetype" value="C"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'C2' and i.resstatus eq '1') or (i.resDate eq resDateMid and i.sitenum eq 'C2' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'C2' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_17  cbtn_Pwaiting  " id="C2_site">
												C2 <input type="hidden" class="siteid" value="111">
												<input type="hidden" class="sitetype" value="C"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'C3' and i.resstatus eq '1') or (i.resDate eq resDateMid and i.sitenum eq 'C3' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'C3' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_18  cbtn_Pwaiting  " id="C3_site">
												C3 <input type="hidden" class="siteid" value="112">
												<input type="hidden" class="sitetype" value="C"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'C4' and i.resstatus eq '1') or (i.resDate eq resDateMid and i.sitenum eq 'C4' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'C4' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_19  cbtn_Pwaiting  " id="C4_site">
												C4 <input type="hidden" class="siteid" value="113">
												<input type="hidden" class="sitetype" value="C"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'C5' and i.resstatus eq '1') or (i.resDate eq resDateMid and i.sitenum eq 'C5' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'C5' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_20  cbtn_Pwaiting  " id="C5_site">
												C5 <input type="hidden" class="siteid" value="114">
												<input type="hidden" class="sitetype" value="C"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'D1' and i.resstatus eq '1') or (i.resDate eq resDateMid and i.sitenum eq 'D1' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'D1' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_21  cbtn_Pwaiting  " id="D1_site">
												D1 <input type="hidden" class="siteid" value="115">
												<input type="hidden" class="sitetype" value="D"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'D2' and i.resstatus eq '1') or (i.resDate eq resDateMid and i.sitenum eq 'D2' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'D2' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_22  cbtn_Pwaiting  " id="D2_site">
												D2 <input type="hidden" class="siteid" value="116">
												<input type="hidden" class="sitetype" value="D"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'D3' and i.resstatus eq '1') or (i.resDate eq resDateMid and i.sitenum eq 'D3' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'D3' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_23  cbtn_Pwaiting " id="D3_site">
												D3 <input type="hidden" class="siteid" value="117">
												<input type="hidden" class="sitetype" value="D"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'D4' and i.resstatus eq '1') or (i.resDate eq resDateMid and i.sitenum eq 'D4' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'D4' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_24  cbtn_Pwaiting  " id="D4_site">
												D4 <input type="hidden" class="siteid" value="118">
												<input type="hidden" class="sitetype" value="D"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'D5' and i.resstatus eq '1') or (i.resDate eq resDateMid and i.sitenum eq 'D5' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'D5' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_25  cbtn_Pwaiting  " id="D5_site">
												D5 <input type="hidden" class="siteid" value="119">
												<input type="hidden" class="sitetype" value="D"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'E1' and i.resstatus eq '1') or (i.resDate eq resDateMid and i.sitenum eq 'E1' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'E1' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_26  cbtn_Pwaiting  " id="E1_site">
												E1 <input type="hidden" class="siteid" value="120">
												<input type="hidden" class="sitetype" value="E"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'E2' and i.resstatus eq '1') or (i.resDate eq resDateMid and i.sitenum eq 'E2'  and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'E2' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_27  cbtn_Pwaiting  " id="E2_site">
												E2 <input type="hidden" class="siteid" value="121">
												<input type="hidden" class="sitetype" value="E"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'E3' and i.resstatus eq '1') or (i.resDate eq resDateMid and i.sitenum eq 'E3' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'E3' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_28  cbtn_Pwaiting" id="E3_site">
												E3 <input type="hidden" class="siteid" value="122">
												<input type="hidden" class="sitetype" value="E"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'E4' and i.resstatus eq '1') or (i.resDate eq resDateMid and i.sitenum eq 'E4' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'E5' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_29  cbtn_Pwaiting" id="E4_site">
												E4 <input type="hidden" class="siteid" value="123">
												<input type="hidden" class="sitetype" value="E"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

										<c:if test="${(i.resDate eq resDate and i.sitenum eq 'E5' and i.resstatus eq '1') or (i.resDate eq resDateMid and i.sitenum eq 'E5' and i.resstatus eq '1') or (i.resDate eq resDateEnd and i.sitenum eq 'E5' and i.resstatus eq '1')}">
											<div class="cbtn cbtn_30  cbtn_Pwaiting" id="E5_site">
												E5 <input type="hidden" class="siteid" value="124">
												<input type="hidden" class="sitetype" value="E"> <input
													type="hidden" class="site_price" value="25000">
											</div>
										</c:if>

									</c:forEach>
								</c:if>
							</div>
						</div>
						<c:if test="${!empty userid }">
							<div class="res_next_btn">
								<div id="res_btn1" onclick="resChk(0);" class="res_btn">다음</div>
							</div>
						</c:if>
						<c:if test="${empty userid }">
							<div class="res_next_btn">
								<div id="res_btn1" onclick="resChk(1);" class="res_btn">다음</div>
							</div>
						</c:if>
					</form>
				</div>
				<!-- sub_page F -->

			</div>
		</div>

	</div>

	<%@ include file="../main/footer.jsp"%>

</body>
</html>