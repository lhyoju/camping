<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>솔향기캠핑장</title>
<link href="/css/main.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link href="/css/sub.css" rel="stylesheet">
<link href="/css/board.css" rel="stylesheet">
<script type="text/javascript" src="/js/main/login.js">
</script>
</head>

<body>
	<%@ include file="../main/header.jsp"%>
	<div id="sub_contents" style="width: 910px">
		<div id="title_container">
			<div class="page_navi">
				<span class="home"><a href="/">홈</a></span><span class="middle_n">캠프장안내</span><span>캠프장
					소개</span>
			</div>
			<h1>가입 완료</h1>
		</div>


		<div class="page sub_paged join_ok" id="bbs_container">
			<div class="join_top04 member_porcess">
				<ul>
					<li><span>Step01</span>약관동의</li>
					<li><span>Step02</span>정보입력</li>
					<li class="ag_on"><span>Step03</span>가입완료</li>
				</ul>
			</div>

			<div class="member_join_ok">
				<h2>
					솔향기 캠핑장에 <span>가입완료</span>되었습니다.!!
				</h2>

				<p>
					로그인하시면 솔향기 캠핑장에서 제공하는 캠핑장의 다양한 정보와<br> 여러가지 혜택들을 제공받으실 수 있습니다.
				</p>
			</div>
			<div class="bbs_bottom_wrap">
				<div class="bbs_btn_area">
					<p class="bt_center">
						<a href="javascript:goLoginPop()">로그인하기</a>
					</p>
				</div>
			</div>
		</div>

	</div>
	<%@ include file="../main/footer.jsp"%>
</body>
</html>