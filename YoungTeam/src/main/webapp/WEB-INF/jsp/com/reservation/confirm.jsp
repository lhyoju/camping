<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<script type="text/javascript" src="/js/main/login.js">
	
</script>
<script type="text/javascript" src="/js/reservation/refund.js"></script>
<meta charset="UTF-8">
<title>솔향기캠핑장</title>
<link href="/css/main.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link href="/css/sub.css" rel="stylesheet">
<link href="/css/board.css" rel="stylesheet">

</head>

<body>

	<%@ include file="../main/header.jsp"%>
	<c:if test="${!empty resManList }">
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
								예약</span><span>예약확인/취소</span>
						</div>
						<h1>예약확인/취소</h1>

					</div>


					<div class="page confirm" id="sub_page">

						<h3>예약확인 및 취소</h3>

						<form method="POST" action="" accept-charset="UTF-8"
							class="form form-horizontal" name="editForm" id="editForm">
							<input name="_token" type="hidden"
								value="6Kw9GBUigpXGAyIysrlmGHUo7WC1WKb8ZoYIvGJB"> <input
								name="id" type="hidden" value="" class="table_hundred">
							
							<div class="con_table_scroll">
								<table class="hm_tab">
									<tbody>
										<tr>
											<th class="cht_01">캠프명</th>
											<th class="cht_02">예약일</th>
											<th class="cht_03">결제금액</th>
											<th class="cht_04">상태</th>

										</tr>

										<c:forEach var="item" items="${resManList}">
											<tr>
												<th class="cht_01">${item.sitenum }</th>
												<th class="cht_02">${item.startDay }</th>
												<th class="cht_03">${item.price }</th>
												<c:if test="${item.paystatus eq '0'}">
													<th class="cht_04 cht_05"><a class="no"
														href="/refund?resid=${item.resid }">환불신청</a>결제완료</th>
												</c:if>
												<c:if test="${item.paystatus eq '1'}">
													<th class="cht_01 cht_05">결제 대기중</th>
												</c:if>
												<c:if test="${item.paystatus eq '2'}">
													<th class="cht_01 cht_05">환불 요청중</th>
												</c:if>
												<c:if test="${item.paystatus eq '3'}">
													<th class="cht_01 cht_05">환불완료</th>
												</c:if>
												
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>

							<div class="pageing_area">
								<div class="pageing">
									<div class="pagination sea-blue"></div>
									<!--
			<ul class="pagination">
				<li class="disabled"><span>«</span></li> 
				<li class="active"><span>1</span></li>
				<li><a href="">2</a></li>
				<li><a href="" rel="next">»</a></li>
			</ul>
			-->
								</div>
							</div>

						</form>

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
						<a href="resCon?page=${page-1}">&lt;</a>
					</c:if>
					<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${a == page}">
							<strong><a>${a}</a></strong>
						</c:if>
						<c:if test="${a != page}">
							<a href="resCon?page=${a}">${a}</a>
						</c:if>
					</c:forEach>
					<c:if test="${page >= maxpage}">
						<a href="">&gt;</a>
					</c:if>
					<c:if test="${page<maxpage}">
						<a href="resCon?page=${page+1}">&gt;</a>
					</c:if>
				</c:if>
				<c:if test="${(!empty find_field) || (!empty find_name)}">
					<c:if test="${page<=1}">
						<a href="">&lt;</a>
					</c:if>
					<c:if test="${page>1}">
						<a
							href="resCon?page=${page-1}&find_field=${find_field}&find_name=${find_name}">&lt;</a>&nbsp;</c:if>
					<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${a == page}">
							<strong><a>${a}</a></strong>
						</c:if>
						<c:if test="${a != page}">
							<a
								href="resCon?page=${a}&find_field=${find_field}&find_name=${find_name}">${a}</a>
						</c:if>
					</c:forEach>
					<c:if test="${page >= maxpage}">
						<a href="">&gt;</a>
					</c:if>
					<c:if test="${page<maxpage}">
						<a
							href="resCon?page=${page+1}&find_field=${find_field}&find_name=${find_name}">&gt;</a>
					</c:if>
				</c:if>
			</div>
		</div>
	</c:if>
	
	<c:if test="${empty resManList}">
		
	</c:if>
	<%@ include file="../main/footer.jsp"%>

</body>
</html>