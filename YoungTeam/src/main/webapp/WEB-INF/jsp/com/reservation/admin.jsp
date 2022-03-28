<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>솔향기캠핑장</title>
<link href="/css/main.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link href="/css/board.css" rel="stylesheet">
<link href="/css/sub.css" rel="stylesheet">
﻿<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<%@ include file="../main/header.jsp"%>
<div>
<form method="get" action="admin">
<div id="sub_visual">
	<div class="sub_visual4">
		<div class="sub_vis_inr wrap">
			<h1>예약현황</h1>
			<p>솔향기캠핑장에 오신것을 환영합니다.</p>
		</div>
	</div>
</div>
<div id="sub_container">
	<div id="location"></div>
	<div id="sub_con_inner" class="wrap">
		<div id="sub_contents">
			<div id="title_container">
				<div class="page_navi">
					<span class="home"><a href="/">홈</a></span><span class="middle_n">관리자모드</span><span>예약현황</span>
				</div>
				<h1>예약현황</h1>
			</div>
			<div class="page notice_list" id="bbs_container">
				<div id="bbs_top_wrap">
					  <p class="bbs_info_wrap">Total : ${rescount}</p>
					  <div class="bbs_search_area">
						  <fieldset>
							<legend>예약현황 검색 폼</legend>
							<select name="find_field" id="bbs_sch_type">
								<option value="resname"	<c:if test="${find_field=='resname'}">${'selected'}</c:if>>예약자명</option>
								<option value="sitenum" <c:if test="${find_field=='sitenum'}">${'selected'}</c:if>>캠프명</option>
							</select>
							<input name="find_name" id="bbs_sch_word" size="14" value="${find_name}" />
							<input class="bbs_search_btn" type="image" src="/img/btn_search.gif" onclick="submit();">
						  </fieldset>
					  </div>
					</div>
					<div class="bbs_list">
					  <table class="list_table" summary="게시판 목록에 대해 예약자이름, 사이트번호 순으로 보실 수 있습니다.">
						<caption>
						예약현황 검색 폼
						</caption>
						<colgroup>
							<col width="12.5%">
							<col width="12.5%">
							<col width="12.5%">
							<col width="12.5%">
							<col width="12.5%">
							<col width="12.5%">
							<col width="12.5%">
							<col width="12.5%">						
						</colgroup>
						<thead>
							<tr>
								<th scope="col" class="lc01">예약자아이디</th>
								<th scope="col" class="lc01">예약자명</th>
								<th scope="col" class="lc01">캠프명</th>
								<th scope="col" class="lc01">예약시작일</th>
								<th scope="col" class="lc01">예약종료일</th>
								<th scope="col" class="lc01">결제금액</th>
								<th scope="col" class="lc01">결제방법</th>
								<th scope="col" class="lc01">예약상태</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${!empty adminList}">
								<c:forEach var="item" items="${adminList}">
									<tr class="notice">
										<td class="cht_01">${item.userid }</td>
										<td class="cht_01">${item.resname }</td>
										<td class="cht_01">${item.sitenum }</td>
										<td class="cht_01">${fn:substring(item.startDay,0,10)}</td>
										<td class="cht_01">${fn:substring(item.endDay,0,10)}</td>
										<td class="cht_01"><fmt:formatNumber value="${item.price}" pattern="#,###"/> 원</td>
										<td class="cht_01 cht_05">
											<c:if test="${item.paymethod eq '0'}">신용카드</c:if>
											<c:if test="${item.paymethod eq '1'}">계좌이체</c:if>
										</td>
										<td class="cht_01 cht_05">
											<c:if test="${item.paystatus eq '0'}">결제완료</c:if>
											<c:if test="${item.paystatus eq '1'}"><input type="hidden" name="resid" value="${item.resid }"><button type="button" class="no confirmPay">결제완료하기</button>결제대기</c:if>
											<c:if test="${item.paystatus eq '2'}"><input type="hidden" name="resid" value="${item.resid }"><button type="button" class="no cancelPay">환불하기</button>환불 요청 들어옴</c:if>
											<c:if test="${item.paystatus eq '3'}">환불완료</c:if>
										</td>										
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty adminList}">
								<tr>
									<td colspan="8" align="center">목록이 없습니다!</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
				<div class="bbs_bottom_wrap">
					<div class="pageing_area">
						<div class="pageing">
							<c:if test="${(empty find_field) && (empty find_name)}">
								<c:if test="${page<=1}"><a href="">&lt;</a></c:if>
								<c:if test="${page>1}"><a href="admin?page=${page-1}">&lt;</a></c:if>
								<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
									<c:if test="${a == page}"><strong><a>${a}</a></strong></c:if>
									<c:if test="${a != page}"><a href="admin?page=${a}">${a}</a></c:if>
								</c:forEach>
								<c:if test="${page >= maxpage}"><a href="">&gt;</a></c:if>
								<c:if test="${page<maxpage}"><a href="admin?page=${page+1}">&gt;</a></c:if>
							</c:if>
							<c:if test="${(!empty find_field) || (!empty find_name)}">
								<c:if test="${page<=1}"><a href="">&lt;</a></c:if>
								<c:if test="${page>1}"><a href="admin?page=${page-1}&find_field=${find_field}&find_name=${find_name}">&lt;</a>&nbsp;</c:if>
								<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
									<c:if test="${a == page}"><strong><a>${a}</a></strong></c:if>
									<c:if test="${a != page}"><a href="admin?page=${a}&find_field=${find_field}&find_name=${find_name}">${a}</a></c:if>
								</c:forEach>
								<c:if test="${page >= maxpage}"><a href="">&gt;</a></c:if>
								<c:if test="${page<maxpage}"><a href="admin?page=${page+1}&find_field=${find_field}&find_name=${find_name}">&gt;</a></c:if>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</form>
</div>
	<%@ include file="../main/footer.jsp"%>

<script>
$(function (){
	$(".confirmPay").click(function (){
		$resid = $(this).prev().val();
		
		$.ajax({
	        type:"POST",//HTTP 통신의 종류
	        url:"/confirmPay", //아작스 서버 주소 파일명
	        data: {
	        	"resid":$resid
	        	}, //전송할 데이터
	        
	        success: function () {//success는 아작스로 받아오는것이 성공했을 경우 서버 데이터를 data변수에 저장
	          alert('결제완료!');
	          location.reload();    	  
	        },
	    	  error:function(){//비동기식 아작스로 서버디비 데이터를
	    		  //못가져와서 에러가 발생했을 때 호출되는 함수이다.
	    		  alert("data error");
	    	  }
	      });
	});
	
	$(".cancelPay").click(function (){
		$resid = $(this).prev().val();
		
		$.ajax({
	        type:"POST",//HTTP 통신의 종류
	        url:"/cancelPay", //아작스 서버 주소 파일명
	        data: {
	        	"resid":$resid
	        	}, //전송할 데이터
	        
	        success: function () {//success는 아작스로 받아오는것이 성공했을 경우 서버 데이터를 data변수에 저장
	          alert('환불완료!');
	          location.reload();    	  
	        },
	    	  error:function(){//비동기식 아작스로 서버디비 데이터를
	    		  //못가져와서 에러가 발생했을 때 호출되는 함수이다.
	    		  alert("data error");
	    	  }
	      });
	});

});

</script>
</body>
</html>