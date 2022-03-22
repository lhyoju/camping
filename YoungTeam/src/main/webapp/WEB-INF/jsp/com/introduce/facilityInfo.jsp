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
							소개</span><span>캠핑장 시설 안내</span>
					</div>
					<h1>캠핑장 시설 안내</h1>

					<%--바로가기 버튼 만들기 --%>

					<div id="zone_view_nav">
						<div class="fl">
							<a href="#A_zone_location">A존<br />대형 데크
							</a>
						</div>
						<div class="fl">
							<a href="#B_zone_location">B존<br />일반형 데크
							</a>
						</div>
						<div class="fl">
							<a href="#C_zone_location">C존<br />자연형 노지
							</a>
						</div>
						<div class="fl">
							<a href="#D_zone_location">D존<br />정박형
							</a>
						</div>
						<div class="fl">
							<a href="#E_zone_location">E존<br />자동차 캠핑
							</a>
						</div>
					</div>


				</div>




				<div class="clear"></div>

				<%--A존 시설 안내 --%>
				<div id="title_container">
					<h1 id="A_zone_location" style="padding-top: 100px;">캠핑장 A존
						(대형 데크)</h1>
				</div>


				<div class="page guidance" id="sub_page">

					<div id="guid_02" class="guid">
						<h3>캠핑장 이용안내</h3>
						<table width="100%" class='tblNone mt30'>
							<tr>
								<td class='pr20' style="padding: 10px;">
									<h1 style="text-align: center">캠핑장 A존 (대형데크) 이용안내</h1>
									<hr class='mt15'
										style='border: 0; border-top: 1px dashed #ccc;'>
									<ul class='h1_list mt20 ml20'>
										<li class='fs11pt mt10' style="list-style: disc;">캠핑장 A존
											(대형데크) 61면</li>
										<li class='fs11pt mt10' style="list-style: disc;">캠핑존,
											자동차캠핑존 이용고객은 모든 캠핑장비를 준비하여야 합니다.<br>(솔향기 캠핑장에서는 장비대여를 하지
											않습니다.)
										</li>
										<li class='fs11pt mt10' style="list-style: disc;">모든 캠핑장
											이용고객은 관리사무실에서 체크인 후 입장가능 합니다.</li>
										<li class='fs11pt mt10' style="list-style: disc;">지정된 공간
											이외의 장소에서는 캠핑이 불가합니다.</li>
										<li class='fs11pt mt10' style="list-style: disc;">모든 시설
											전기 사용 가능합니다.</li>
									</ul>
								</td>
								<td>
									<div style="text-align: center;">
										<img src="/img/introduce/A_03.jpg" width="400px" />
									</div>
								</td>
							</tr>
						</table>
					</div>

					<div id="guid_04" class="guid">
						<h3>이용요금 안내</h3>
						<div class="guid04_inner">
							<table cellpadding="0" class="hm_tab">
								<tbody>
									<tr>
										<th rowspan='2' style="text-align: center">시설별</th>
										<th rowspan='2' style="text-align: center">수량</th>
										<th rowspan='2' style="text-align: center">사용기준<br>(면당
											정원/ 규모)
										</th>
										<th colspan='2' style="text-align: center">비수기</th>
										<th rowspan='2' style="text-align: center">성수기</th>
										<th rowspan='2' style="text-align: center">초과요금</th>
									</tr>
									<tr>
										<th style="text-align: center; border-left: 1px solid #ccc;">평일</th>
										<th style="text-align: center">주말</th>
									</tr>

									<tr class='h80px'>
										<td>캠핑장 A존<br>(대형데크)
										</td>
										<td>61면</td>
										<td>6인<BR>5m X 7m
										</td>
										<td>22,000</td>
										<td>27,000</td>
										<td>40,000</td>
										<td>초과시간당<br>기본사용료의 10% 추가
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

					<div id="guid_01" class="guid">
						<h3>시설배치도</h3>
						<div style="text-align: center;">
							<img src="/img/introduce/camping_map800_A.png" width="850px" />
						</div>
					</div>
				</div>


				<%--B존 시설 안내 --%>
				<div id="title_container">
					<h1 id="B_zone_location" style="padding-top: 100px;">캠핑장 B존
						(일반형 데크)</h1>
				</div>

				<div class="page guidance" id="sub_page">

					<div id="guid_02" class="guid">
						<h3>캠핑장 이용안내</h3>
						<table width="100%" class='tblNone mt30'>
							<tr>
								<td class='pr20' style="padding: 10px;">
									<h1 style="text-align: center">캠핑장 B존 (일반형 데크) 이용안내</h1>
									<hr class='mt15'
										style='border: 0; border-top: 1px dashed #ccc;'>
									<ul class='h1_list mt20 ml20'>
										<li class='fs11pt mt10' style="list-style: disc;">캠핑장 B존
											일반형데크 39면 / 대형데크 2면</li>
										<li class='fs11pt mt10' style="list-style: disc;">캠핑존,
											자동차캠핑존 이용고객은 모든 캠핑장비를 준비하여야 합니다.<br> (솔향기 캠핑장에서는 장비대여를
											하지 않습니다.)
										</li>
										<li class='fs11pt mt10' style="list-style: disc;">모든 캠핑장
											이용고객은 관리사무실에서 체크인 후 입장가능 합니다.</li>
										<li class='fs11pt mt10' style="list-style: disc;">지정된 공간
											이외의 장소에서 캠핑이 불가합니다.</li>
										<li class='fs11pt mt10' style="list-style: disc;">모든 시설
											전기 사용 가능합니다.</li>
									</ul>
								</td>
								<td>
									<div style="text-align: center;">
										<img src="/img/introduce/B_01.jpg" width="400px" />
									</div>
								</td>
							</tr>
						</table>
					</div>

					<div id="guid_04" class="guid">
						<h3>이용요금 안내</h3>
						<div class="guid04_inner">
							<table cellpadding="0" class="hm_tab">
								<tbody>
									<tr>
										<th rowspan='2' style="text-align: center">시설별</th>
										<th rowspan='2' style="text-align: center">수량</th>
										<th rowspan='2' style="text-align: center">사용기준<br>(면당
											정원/ 규모)
										</th>
										<th colspan='2' style="text-align: center">비수기</th>
										<th rowspan='2' style="text-align: center">성수기</th>
										<th rowspan='2' style="text-align: center">초과요금</th>
									</tr>
									<tr>
										<th style="text-align: center; border-left: 1px solid #ccc;">평일</th>
										<th style="text-align: center">주말</th>
									</tr>

									<tr class='h80px'>
										<td>캠핑장 B존<br>(일반형데크)
										</td>
										<td>39면</td>
										<td>4인<br>3.5m X 5m
										</td>
										<td>15,000</td>
										<td>22,000</td>
										<td>32,000</td>
										<td>초과시간당<br>기본사용료의 10% 추가
										</td>
									</tr>
									<tr class='h80px'>
										<td>캠핑장 B존<br>(대형데크)
										</td>
										<td>2면</td>
										<td>6인<br>5m X 7m
										</td>
										<td>22,000</td>
										<td>27,000</td>
										<td>40,000</td>
										<td>초과시간당<br>기본사용료의 10% 추가
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

					<div id="guid_01" class="guid">
						<h3>시설배치도</h3>
						<div style="text-align: center;">
							<img src="/img/introduce/camping_map800_B.png" width="850px" />
						</div>
					</div>
				</div>

				<%--C존 시설 안내 --%>
				<div id="title_container">
					<h1 id="C_zone_location" style="padding-top: 100px;">캠핑장 C존
						(자연형 노지)</h1>
				</div>

				<div class="page guidance" id="sub_page">

					<div id="guid_02" class="guid">
						<h3>캠핑장 이용안내</h3>
						<table width="100%" class='tblNone mt30'>
							<tr>
								<td class='pr20' style="padding: 10px;">
									<h1 style="text-align: center">캠핑장 C존 (자연형 노지) 이용안내</h1>
									<hr class='mt15'
										style='border: 0; border-top: 1px dashed #ccc;'>
									<ul class='h1_list mt20 ml20'>
										<li class='fs11pt mt10' style="list-style: disc;">캠핑장 C존
											(자연형,노지) 25면</li>
										<li class='fs11pt mt10' style="list-style: disc;">캠핑존,
											자동차캠핑존 이용고객은 모든 캠핑장비를 준비하여야 합니다.<br> (솔향기 캠핑장에서는 장비대여를
											하지 않습니다.)
										</li>
										<li class='fs11pt mt10' style="list-style: disc;">모든 캠핑장
											이용고객은 관리사무실에서 체크인 후 입장가능 합니다.</li>
										<li class='fs11pt mt10' style="list-style: disc;">지정된 공간
											이외의 장소에서 캠핑이 불가합니다.</li>
										<li class='fs11pt mt10' style="list-style: disc;">모든 시설
											전기 사용 가능합니다.</li>
									</ul>
								</td>
								<td>
									<div style="text-align: center;">
										<img src="/img/introduce/C_02.jpg" width="400px" />
									</div>
								</td>
							</tr>
						</table>
					</div>

					<div id="guid_04" class="guid">
						<h3>이용요금 안내</h3>
						<div class="guid04_inner">
							<table cellpadding="0" class="hm_tab">
								<tbody>
									<tr>
										<th rowspan='2' style="text-align: center">시설별</th>
										<th rowspan='2' style="text-align: center">수량</th>
										<th rowspan='2' style="text-align: center">사용기준<br>(면당
											정원/ 규모)
										</th>
										<th colspan='2' style="text-align: center">비수기</th>
										<th rowspan='2' style="text-align: center">성수기</th>
										<th rowspan='2' style="text-align: center">초과요금</th>
									</tr>
									<tr>
										<th style="text-align: center; border-left: 1px solid #ccc;">평일</th>
										<th style="text-align: center">주말</th>
									</tr>

									<tr class='h80px'>
										<td>캠핑장 C존<br>(자연형,노지)
										</td>
										<td>25면</td>
										<td>6인<br>데크없음
										</td>
										<td>13,000</td>
										<td>18,000</td>
										<td>25,000</td>
										<td>초과시간당<br>기본사용료의 10% 추가
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

					<div id="guid_01" class="guid">
						<h3>시설배치도</h3>
						<div style="text-align: center;">
							<img src="/img/introduce/camping_map800_C.png" width="850px" />
						</div>
					</div>


					<%--D존 시설 안내 --%>
					<div id="title_container">
						<h1 id="D_zone_location" style="padding-top: 100px;">카라반 D존
							(정박형)</h1>
					</div>

					<div class="page guidance" id="sub_page">
						<div id="guid_02" class="guid">
							<h3>캠핑장 이용안내</h3>
							<table width="100%" class='tblNone mt30'>
								<tr>
									<td class='pr20' style="padding: 10px;">
										<h1 style="text-align: center">카라반 D존 (정박형) 이용안내</h1>
										<hr class='mt15'
											style='border: 0; border-top: 1px dashed #ccc;'>
										<ul class='h1_list mt20 ml20'>
											<li class='fs11pt mt10' style="list-style: disc;">카라반
												D존(정박형) 9실, 기준인원 : 4명</li>
											<li class='fs11pt mt10' style="list-style: disc;">모든 캠핑장
												이용고객은 관리사무실에서 체크인 후 입장 가능합니다.<br> (체크아웃 : 열쇠, 리모컨 등 반납
												필수)
											</li>
											<li class='fs11pt mt10' style="list-style: disc;">카라반 데크
												위 텐트 설치를 금지 합니다.</li>
											<li class='fs11pt mt10' style="list-style: disc;">수건,
												세면도구 비치되어 있지 않으므로 반드시 준비하여야 합니다.</li>
											<li class='fs11pt mt10' style="list-style: disc;">카라반내에서
												바비큐는 금지됩니다.</li>
											<li class='fs11pt mt10' style="list-style: disc;">카라반 전용
												주차구역을 이용하여 주시기 바랍니다.</li>
											<li class='fs11pt mt10' style="list-style: disc;">지정된 공간
												이외의 장소에서 캠핑이 불가합니다.</li>
											<li class='fs11pt mt10' style="list-style: disc;">화장실 내
												간단한 세안은 가능하지만, 샤워는 공용샤워장을 이용해주시기 바랍니다.</li>
										</ul>
									</td>
									<td>
										<div style="text-align: center;">
											<img src="/img/introduce/D_page_1_03.jpg" width="400px" />
										</div>
									</td>
								</tr>
							</table>
						</div>

						<div id="guid_04" class="guid">
							<h3>이용요금 안내</h3>
							<div class="guid04_inner">
								<table cellpadding="0" class="hm_tab">
									<tbody>
										<tr>
											<th rowspan='2' style="text-align: center">시설별</th>
											<th rowspan='2' style="text-align: center">수량</th>
											<th rowspan='2' style="text-align: center">사용기준<br>(면당
												정원/ 규모)
											</th>
											<th colspan='2' style="text-align: center">비수기</th>
											<th rowspan='2' style="text-align: center">성수기</th>
											<th rowspan='2' style="text-align: center">비고</th>
										</tr>
										<tr>
											<th style="text-align: center; border-left: 1px solid #ccc;">평일</th>
											<th style="text-align: center">주말</th>
										</tr>

										<tr class='h80px'>
											<td>카라반 D존<br>(정박형)
											</td>
											<td>9면</td>
											<td>6인<br>차량 1대
											</td>
											<td>80,000</td>
											<td>120,000</td>
											<td>160,000</td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

						<div id="guid_01" class="guid">
							<h3>시설배치도</h3>
							<div style="text-align: center;">
								<img src="/img/introduce/camping_map800_D.png" width="850px" />
							</div>
						</div>

						<%--E존 시설 안내 --%>
						<div id="title_container">
							<h1 id="E_zone_location" style="padding-top: 100px;">자동차캠핑장
								E존</h1>
						</div>

						<div class="page guidance" id="sub_page">

							<div id="guid_02" class="guid">
								<h3>캠핑장 이용안내</h3>
								<table width="100%" class='tblNone mt30'>
									<tr>
										<td class='pr20' style="padding: 10px;">
											<h1 style="text-align: center">자동차캠핑장 E존 이용안내</h1>
											<hr class='mt15'
												style='border: 0; border-top: 1px dashed #ccc;'>
											<ul class='h1_list mt20 ml20'>
												<li class='fs11pt mt10' style="list-style: disc;">자동차캠핑장
													E존 10면</li>
												<li class='fs11pt mt10' style="list-style: disc;">캠핑존,
													자동차캠핑존 이용고객은 모든 캠핑장비를 준비하여야 합니다.<br> (솔향기 캠핑장에서는 장비대여를
													하지 않습니다.)
												</li>
												<li class='fs11pt mt10' style="list-style: disc;">모든
													캠핑장 이용고객은 관리사무실에서 체크인 후 입장가능 합니다.</li>
												<li class='fs11pt mt10' style="list-style: disc;">지정된
													공간 이외의 장소에서 캠핑이 불가합니다.</li>
												<li class='fs11pt mt10' style="list-style: disc;">모든 시설
													전기 사용 가능합니다.</li>
											</ul>
										</td>
										<td>
											<div style="text-align: center;">
												<img src="/img/introduce/E_02.jpg" width="400px" />
											</div>
										</td>
									</tr>
								</table>
							</div>

							<div id="guid_04" class="guid">
								<h3>이용요금 안내</h3>
								<div class="guid04_inner">
									<table cellpadding="0" class="hm_tab">
										<tbody>
											<tr>
												<th rowspan='2' style="text-align: center">시설별</th>
												<th rowspan='2' style="text-align: center">수량</th>
												<th rowspan='2' style="text-align: center">사용기준<br>(면당
													정원/ 규모)
												</th>
												<th colspan='2' style="text-align: center">비수기</th>
												<th rowspan='2' style="text-align: center">성수기</th>
												<th rowspan='2' style="text-align: center">초과요금</th>
											</tr>
											<tr>
												<th style="text-align: center; border-left: 1px solid #ccc;">평일</th>
												<th style="text-align: center">주말</th>
											</tr>

											<tr class='h80px'>
												<td>캠핑장 E존<br>(대형데크)
												</td>
												<td>10면</td>
												<td>6인<BR>차량 1대
												</td>
												<td>25,000</td>
												<td>30,000</td>
												<td>50,000</td>
												<td>초과시간당<br>기본사용료의 10% 추가
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>

							<div id="guid_01" class="guid">
								<h3>시설배치도</h3>
								<div style="text-align: center;">
									<img src="/img/introduce/camping_map800_E.png" width="850px" />
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../main/footer.jsp"%>
</body>
</html>