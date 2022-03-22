<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
<script type="text/javascript" src="/js/reservation/reservation3.js"></script>

</head>

<body>

	<%@ include file="../main/header.jsp"%>

	<%
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
	int back = Integer.parseInt(request.getParameter("back"));
	String startDay = request.getParameter("startDay");
	Date startDay2 = format.parse(request.getParameter("startDay"));
	String startDay3 = format.format(startDay2);
	Date endDay = startDay2;
	Calendar cal = Calendar.getInstance();
	cal.setTime(endDay);
	cal.add(cal.DATE, back);
	String endDay2 = format.format(cal.getTime());
	String resDateMid = null;
	String resDateEnd = null;

	if (back == 1) {
		resDateEnd = request.getParameter("resDateEnd");
	} else if (back == 2) {
		resDateMid = request.getParameter("resDateMid");
		resDateEnd = request.getParameter("resDateEnd");
	}

	String siteNum = request.getParameter("siteNum");
	int price = Integer.parseInt(request.getParameter("price"));
	Date startDayDt = new Date();
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
						<span class="home"><a href="">홈</a></span><span class="middle_n">캠핑장
							예약</span><span>실시간 예약</span>
					</div>
					<h1>실시간 예약</h1>

				</div>

				<form method="post" action="/pay" name="fr" id="fr">
					<%
						if (back == 1) {
					%>
					<input type="hidden" name="resDateEnd" value="<%=resDateEnd%>">
					<%
						} else if (back == 2) {
					%>
					<input type="hidden" name="resDateMid" value="<%=resDateMid%>">
					<input type="hidden" name="resDateEnd" value="<%=resDateEnd%>">
					<%
						}
					%>
					<div class="page reats" id="sub_page">
						<input type="hidden" name="userid"> <input type="hidden"
							name="startDay" value="<%=startDay%>"> <input
							type="hidden" name="back" value="<%=back%>"> <input
							type="hidden" name="siteNum" value="<%=siteNum%>"> <input
							type="hidden" name="price" value="<%=price%>"> <input
							type="hidden" name="endDay" value="<%=endDay2%>">
						<c:set var="username" />
						<c:set var="phone" />
						<c:forEach items="${list }" var="i">
							<c:set var="username" value="${i.name}" />
							<c:set var="phone"
								value="${i.uphone1 += '-' += i.uphone2 += '-' += i.uphone3}" />

							<h3>온라인 예약하기</h3>
							<table class="hm_tab">
								<tbody>
									<tr>
										<th>예약일자</th>
										<td><%=startDay%></td>
									</tr>
									<tr>
										<th>박수</th>
										<td><%=back%></td>
									</tr>
									<tr>
										<th>캠프장</th>
										<td><%=siteNum%></td>
									</tr>
									<tr>
										<th>결제금액</th>
										<td><%=price%></td>
									</tr>
									<tr>
										<th>예약자명</th>
										<td><input type="text" name="resName"
											value="${username }" title="예약자명"></td>
									</tr>

									<tr>
										<th>핸드폰번호</th>
										<td><input type="text" name="phone" value="${phone }"
											title="핸드폰번호">&nbsp;예)&nbsp;051-000-0000</td>
									</tr>
									<tr>
										<th>차번호</th>
										<td><input type="text" name="carNum" value="" title="차번호"></td>
									</tr>
									<tr>
										<th>차종</th>
										<td><input type="text" name="carKinds" value=""
											title="차종"></td>
									</tr>
								</tbody>
							</table>
						</c:forEach>
						<p class="sub_reTxt">
							<!-- <span>※유의※ </span> 해당건은 사용예정일 이틀 이내인 경우로서 예약시간 기준 6시간 이내에 결제하지 않을 시 자동취소됩니다.-->
						</p>


						<div class="res_next_btn">
							<div class="res_btn" id="res_btn1" onclick="rsChk();">다음</div>
						</div>

					</div>
					<!-- sub_page F -->
				</form>

			</div>
		</div>

	</div>

	<%@ include file="../main/footer.jsp"%>

</body>
</html>