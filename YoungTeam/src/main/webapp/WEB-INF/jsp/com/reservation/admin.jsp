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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" type="text/javascript"></script>
<script src ="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/reservation/cancelPay.js"></script>
<script type="text/javascript" src="/js/reservation/confirm.js"></script>
</head>

<body>

	<%@ include file="../main/header.jsp"%>
	<div id="sub_container">
		<div id="location"></div>
		<div id="sub_con_inner" class="wrap">
			<div id="sub_contents">
				<div class="page confirm" id="sub_page">
					<table class="hm_tab">
						<tbody>
							<tr>
								<th class="cht_01">유저아이디</th>
								<th class="cht_01">유저이름</th>
								<th class="cht_01">캠프명</th>
								<th class="cht_01">예약일</th>
								<th class="cht_01">결제금액</th>
								<th class="cht_01">결제방법</th>
								<th class="cht_01">상태</th>

							</tr>
							
							<c:if test="${!empty adminList}">
								<c:forEach var="item" items="${adminList}">
									<tr>
										<td class="cht_01">${item.userid }</td>
										<td class="cht_01">${item.resname }</td>
										<td class="cht_01">${item.sitenum }</td>
										<td class="cht_01">${item.startDay }</td>
										<td class="cht_01">${item.price }</td>
										<c:if test="${item.paymethod eq '0'}">
											<td class="cht_01 cht_05">신용카드</td>
										</c:if>
										<c:if test="${item.paymethod eq '1'}">
											<td class="cht_01 cht_05">계좌이체</td>
										</c:if>
										<c:if test="${item.paystatus eq '0'}">
											<td class="cht_01 cht_05">결제완료</td>
										</c:if>
										<c:if test="${item.paystatus eq '1'}">
											<td class="cht_01 cht_05"><form method="post" action="/confirmPay"><input type="hidden" name="resid" value="${item.resid }"><input type="submit" class="no" value="결제완료하기">결제대기</form></td>
										</c:if>
										<c:if test="${item.paystatus eq '2'}">
											<td class="cht_01 cht_05"><form method="post" action="/cancelPay"><input type="hidden" name="resid" value="${item.resid }"><input type="submit" class="no" value="환불하기">환불 요청 들어옴</form></td>
										</c:if>
										<c:if test="${item.paystatus eq '3'}">
											<td class="cht_01 cht_05">환불완료</td>
										</c:if>
									</tr>
								</c:forEach>
							</c:if>
							
							<c:if test="${empty adminList}">
								<tr align="center">
									<td colspan="7">예약 내역이 없습니다.</td>
								</tr>
							</c:if>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="pageing_area">
		<div class="pageing">
			<c:if test="${(empty find_field) && (empty find_name)}">
				<c:if test="${page<=1}">
					<a href="">&lt;</a>
				</c:if>
				<c:if test="${page>1}">
					<a href="/admin?page=${page-1}">&lt;</a>
				</c:if>
				<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
					<c:if test="${a == page}">
						<strong><a>${a}</a></strong>
					</c:if>
					<c:if test="${a != page}">
						<a href="admin?page=${a}">${a}</a>
					</c:if>
				</c:forEach>
				<c:if test="${page >= maxpage}">
					<a href="">&gt;</a>
				</c:if>
				<c:if test="${page<maxpage}">
					<a href="admin?page=${page+1}">&gt;</a>
				</c:if>
			</c:if>
			<c:if test="${(!empty find_field) || (!empty find_name)}">
				<c:if test="${page<=1}">
					<a href="">&lt;</a>
				</c:if>
				<c:if test="${page>1}">
					<a
						href="admin?page=${page-1}&find_field=${find_field}&find_name=${find_name}">&lt;</a>&nbsp;</c:if>
				<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
					<c:if test="${a == page}">
						<strong><a>${a}</a></strong>
					</c:if>
					<c:if test="${a != page}">
						<a
							href="admin?page=${a}&find_field=${find_field}&find_name=${find_name}">${a}</a>
					</c:if>
				</c:forEach>
				<c:if test="${page >= maxpage}">
					<a href="">&gt;</a>
				</c:if>
				<c:if test="${page<maxpage}">
					<a
						href="admin?page=${page+1}&find_field=${find_field}&find_name=${find_name}">&gt;</a>
				</c:if>
			</c:if>
		</div>
	</div>


	<%@ include file="../main/footer.jsp"%>

</body>
</html>