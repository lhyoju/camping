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
<link href="/css/introduce.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../main/header.jsp"%>

	<div id="sub_visual">
		<div class="sub_visual2">
			<div class="sub_vis_inr wrap">
				<h1>캠핑장소개</h1>
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
							소개</span><span>캠핑장 시설 배치도</span>
					</div>
					<h1>캠핑장 시설 배치도</h1>
				</div>


				<div class="page present" id="sub_page">

					<div style="text-align: center; padding: 30px 0;"">
						<img src="/img/introduce/camping_maptemp.png"  />
					</div>
				</div>


			</div>
		</div>
	</div>



	<%@ include file="../main/footer.jsp"%>
</body>
</html>