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
					<!-- 캠핑장 안내 -->
					<div class="page_navi">
						<span class="home"><a href="/">홈</a></span><span class="middle_n">주변
							관광지</span><span>주변 먹거리</span>
					</div>
					<h1>주변 먹거리</h1>

				</div>
			</div>
			<div class="page reats" id="sub_page">
				<table>
					<tr>
						<td class="vt"><img src="/img/수.JPG"
							style="max-width: 355px;"></td>
						<td></td>
						<td class="font_ng fs10pt vt p0">
							<div style="border-bottom: 2px solid #000;"
								class="fs20pt b font_ng pb10 mb20">
								<span class="gray666 fs14pt">동해바다의 신선함</span> 주문진 수산시장
							</div>
							<p>오징어 잡이로 유명한 주문진항을 끼고 1936년부터 형성된 재래시장 입니다. 종합시장, 건어물시장,
								회센터 등을 포함한 다양한 상가와 연계되어있는 동해안 최대 규모의 어시장이나 국내/해외관광객이 많이 찾고있는전통시장
								입니다. 통해바다의 신선함을 각종 수산물로 느껴보세요.&nbsp;</p>
							<div style="border: 1px solid #ccc; background-color: #eee;"
								class="p5 ph20 mt20 fs10pt">
								<a href= "http://jumunjin-market.co.kr/" target="_blank">
										바로가기 : 주문진 수산시장
								</a>	
								<p>문의전화 : 주문진수산시장 033) 661-7302</p>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<hr style="margin: 30px 0; border-top: 1px dashed #aaa;">
						</td>
					</tr>
					<tr>
						<td class="vt"><img src="/img/안.JPG"
							style="max-width: 355px;"></td>
						<td></td>
						<td class="font_ng fs10pt vt p0">
							<div style="border-bottom: 2px solid #000;"
								class="fs20pt b font_ng pb10 mb20">
								<span class="gray666 fs14pt">향기나는 여행,</span> 안목커피거리
							</div>
							<p>
								강릉에서 커피로 가장 유명한 안목해변 커피거리<br /> 강릉항(옛 안목항)부터 북쪽 해안선을 따라 1km걸쳐
								30여개의 커피전문점이 늘어서 있습니다. 푸른바다를 보며 제조비법이 제각기 다른 다양한 커피를 맛보실 수
								있습니다.&nbsp;
							</p>
							<div style="border: 1px solid #ccc; background-color: #eee;"
								class="p5 ph20 mt20 fs10pt">
								<a href= "http://ggcoffeestreet.modoo.at/" target="_blank">
										바로가기 : 안목커피거리
								</a>
								<p>문의전화 : 강릉시종합관광안내소 033) 640-4531</p>
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