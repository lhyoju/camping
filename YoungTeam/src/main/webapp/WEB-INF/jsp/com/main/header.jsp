<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/js/main/login.js">
</script>
</head>

<body>

	<div class="header">
		<div class="head-info">
			
			<div id="header_btn">
				<c:if test="${empty userid}">
					<!-- 로그인 전 > 로그인 /회원가입/사이트맵-->
					<a href="javascript:goLoginPop()"><strong>로그인</strong></a> 
					<a href="/member/join"><strong>회원가입</strong></a>
				</c:if>
				
				<c:if test="${!empty userid}">
					<c:if test="${auth=='member'}">
						<!-- 일반회원 권할일 때, 로그인 후 > ~~ 로그인 하셨습니다. / 로그아웃 /사이트맵 -->
						<a href="/member/logout"><strong>로그아웃</strong></a>
						<a href="/member/edit"><strong>회원정보</strong></a>
						<span id="loginState" style="margin-right:3px;">
						  <strong class="font-bold">${uname}</strong>님이 로그인하셨습니다.
						</span>
					</c:if>
					
					<c:if test="${auth=='admin'}">
						<!-- 관리자 권한일 때  -->
						<a href="/member/logout"><strong>로그아웃</strong></a>
						<a href="/member_edit"><strong>회원정보</strong></a>
						<a href="/admin"><strong>예약현황</strong></a>
						<span id="loginState" style="margin-right:3px;">
						  <strong class="font-bold">${uname}</strong>님이 로그인하셨습니다.
						</span>
					</c:if>
				</c:if>
				
				
			</div>
		</div>
		<div class="clear"></div>

		<div>
			<div id="logo">
				<a href="/"> <img src="/img/logo.jpg"></a>
			</div>
			<nav role="navigation" style="z-index: 1;">
				<ul id="main-menu">
					<li><a href="/intro">캠핑장소개</a>
						<ul id="sub-menu">
							<li><a href="/intro">연곡해변캠핑장소개</a></li>
							<li><a href="/intro/facilityLayout">캠핑장 시설배치도</a></li>
							<li><a href="/intro/facilityInfo">캠핑장 시설안내</a></li>
						</ul></li>
					<li><a href="/guide/fare">이용안내</a>
						<ul id="sub-menu">
							<li><a href="/guide/fare">이용시간 및 요금</a></li>
							<li><a href="/guide/rules">이용준수사항</a></li>
							<li><a href="/guide/facility">편의시설안내</a></li>
							<li><a href="/guide/trafficInfo">위치 및 교통정보</a></li>
						</ul></li>
					<li><a href="#">캠핑장예약</a>
						<ul id="sub-menu">
							<li><a href="/reservation">온라인예약</a></li>
							<li><a href="/confirm">예약확인 및 취소</a></li>
						</ul></li>
					<li><a href="/tour/see">주변관광지</a>
						<ul id="sub-menu">
							<li><a href="/tour/see">주변 볼거리</a></li>
							<li><a href="/tour/play">주변 즐길거리</a></li>
							<li><a href="/tour/eat">주변 먹거리</a></li>
						</ul></li>
					<li><a href="/board/news">커뮤니티</a>
						<ul id="sub-menu">
							<li><a href="/board/news">공지사항</a></li>
							<li><a href="/board/often">자주하는 질문</a></li>
							<li><a href="/board/qna">Q&amp;A</a></li>
						</ul></li>
				</ul>
			</nav>

		</div>
	</div>


</body>
</html>