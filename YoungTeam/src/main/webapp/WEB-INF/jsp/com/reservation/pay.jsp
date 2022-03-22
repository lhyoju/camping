<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>솔향기캠핑장</title>
<%
SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
String startDay = request.getParameter("startDay");
String endDay = request.getParameter("endDay");
String resName = request.getParameter("resName");
String siteNum = request.getParameter("siteNum");
int price = Integer.parseInt(request.getParameter("price"));
String phone = request.getParameter("phone");
String carNum = request.getParameter("carNum");
String carKinds = request.getParameter("carKinds");
int back = Integer.parseInt(request.getParameter("back"));
String resDateMid = null;
String resDateEnd = null;

if(back == 1){
	resDateEnd = request.getParameter("resDateEnd");
}else if(back == 2){
	resDateMid = request.getParameter("resDateMid");
	resDateEnd = request.getParameter("resDateEnd");
}
%>
<link href="/css/main.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link href="/css/sub.css" rel="stylesheet">
<link href="/css/board.css" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="/js/reservation/card.js"></script>
</head>

<body>

	<%@ include file="../main/header.jsp"%>

	<div id="sub_visual">

		<div class="sub_visual3">
			<div class="sub_vis_inr wrap">
				<h1>캠핑장예약</h1>
				<p>화명오토캠핑장에 오신것을 환영합니다.</p>
			</div>
		</div>

	</div>
	<form action="/resCon" method="post" id="fr">
	<%if(back == 1){ %>
	<input type="hidden" name="resDateEnd" value="<%=resDateEnd%>">
	<%}else if(back == 2) { %>
	<input type="hidden" name="resDateMid" value="<%=resDateMid%>">
	<input type="hidden" name="resDateEnd" value="<%=resDateEnd%>">
	<%} %>
	<input type="hidden" name="resName" value="<%=resName %>">
	<input type="hidden" name="phone" value="<%=phone %>">
	<input type="hidden" name="carNum" value="<%=carNum %>">
	<input type="hidden" name="carKinds" value="<%=carKinds %>">
	<input type="hidden" name="price" value="<%=price %>">
	<input type="hidden" name="siteNum" value="<%=siteNum %>">
	<input type="hidden" name="startDay" value="<%=startDay %>">
	<input type="hidden" name="endDay" value="<%=endDay %>">
	<input type="hidden" name="back" value="<%=back %>">
	<input type="hidden" name="mid" id="mid">
	
		<div id="sub_container">
			<div id="location"></div>
			<div id="sub_con_inner" class="wrap">




				<div id="sub_contents">
					<div id="title_container">
						<!-- 캠핑장 안내 -->
						<div class="page_navi">
							<span class="home"><a href="/">홈</a></span><span class="middle_n">캠핑장
								예약</span><span>예약확인/취소</span>
						</div>
						<h1>예약확인/취소</h1>

					</div>
					<div class="page confirm confirm2" id="sub_page">

						<h3>화명동 오토캠핑장 결제</h3>
						<div class="con_table_scroll">
							<table class="hm_tab">
								<tbody>
									<tr>
										<th class="cht_01">신청자</th>
										<th class="cht_02">예약사작일</th>
										<th class="cht_02">예약종료일</th>
										<th class="cht_03">캠프장명</th>
										<th class="cht_04">금액</th>
									</tr>
									<tr>
										<td class="cht_01"><%=resName %></td>
										<td class="cht_02"><%=startDay %></td>
										<td class="cht_02"><%=endDay %></td>
										<td class="cht_03"><%=siteNum %></td>
										<td class="cht_04" id="price"><%=price %></td>
									</tr>
								</tbody>
							</table>
							<input type="hidden" id="list_id" value="43524">
							<h4>
								결제 수단을 선택하세요. <br>- 결제 후 마이페이지에서 '예약완료' 상태를 반드시 확인해주세요.<br>-
								문제발생시 아래 연락처로 연락바랍니다.<br>- 결제 완료화면이 나오기 전에 뒤로가기 또는 새로고침을
								하시면 정상적으로 완료되지 않을 수 있으니 주의바랍니다.
							</h4>
							<div class="card-box">
								<select "id="lgd_cutom_usablepay" name="payMethod" onchange="showValue(this)">
									<!-- <option value="3" selected>무통장입금</option> -->
									<option>결제 수단을 선택해주세요</option>
									<option value="card">신용카드</option>
									<option value="vbank">계좌이체</option>
								</select>
							</div>

							<div class="confirm_card">
								<div id="auth_nice2" id="check_module" onclick="pay(<%=price%>, '<%=resName%>', '<%=phone%>')">결제하기</div> <a href="/reservation" class="no_card">목록보기</a>
							</div>
						</div>








					</div>
				</div>
			</div>
		</div>
	</form>
	<%@ include file="../main/footer.jsp"%>
</body>
</html>