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
<link href="/css/play.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../main/header.jsp"%>

	<div id="sub_visual">
		<div class="sub_visual17">
			<div class="sub_vis_inr wrap">
				<h1 id="bodyChannelTitle">주변 관광지</h1>
				<p>솔향기 캠핑장에 오신걸 환영합니다.</p>
			</div>
		</div>
	</div>
	<div id="sub_container">
		<div id="location"></div>
		<div id="sub_con_inner" class="wrap">
			<div id="sub_contents">
				<div id="title_container">
					<div class="page_navi">
						<span class="home"><a href="/">홈</a></span><span class="middle_n">주변 관광지</span><span>주변 즐길거리</span>
					</div>
					<h1>주변 즐길거리</h1>

				</div>

			</div>
			<div class="page reats" id="sub_page">
				<table>
					<tr>
						<td class="vt"><img src="/img/레.JPG"
							style="max-width: 355px;"></td>
						<td></td>
						<td class="font_ng fs10pt vt p0">
							<div style="border-bottom: 2px solid #000;"
								class="fs20pt b font_ng pb10 mb20">
								<span class="gray666 fs14pt">정동진</span> 레일바이크
							</div>
							<p>
								해돋이의 명소 정동진에서 아름다운 일출과 바다를 함께 감상할 수있으며,<br /> 전 구간 바다를 바라보며
								달리기때문에 운행내내 바닷바람의 상쾌함 또한<br /> 느끼실 수 있습니다. 정동진 레일바이크는 전동 운행이
								가능하기 때문에<br /> 어르신과 노약자도 부담없이 편하게 즐기실 수 있습니다.&nbsp;
							</p>
							<div style="border: 1px solid #ccc; background-color: #eee;"
								class="p5 ph20 mt20 fs10pt">
								<a href = "www.sunbike.kr" target="_blank">
										바로가기 : 정동진 레일바이크
								</a>
								<p>문의전화 : 코레일관광개발 033) 655-7786</p>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<hr style="margin: 30px 0; border-top: 1px dashed #aaa;">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>

	<%@ include file="../main/footer.jsp"%>
</body>
</html>