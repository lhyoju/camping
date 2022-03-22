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
﻿<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/login/register.js">
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function kakaopost() {
    new daum.Postcode({
        oncomplete: function(data) {
           document.querySelector("#zipcode").value = data.zonecode;
           document.querySelector("#address").value =  data.address;
           document.querySelector("input[name=address2]").focus(); //상세입력 포커싱
        }
    }).open();
}

/*

아이디 중복 체크 0 -> 중복체크 x / 1-> 중복체크 완료
var idck = 0;

*/
</script>

<script>
	
	//이메일 - 도메인 선택시 text 박스에 자동 기입
	$(document).ready(function(){
		$("#email_ex").change(function(){
			$("#email2").val($(this).val());
		});
	});
	
</script>
</head>

<body>
	<%@ include file="../main/header.jsp"%>
	<div id="sub_contents" style="width: 910px">
		<div id="title_container">
			<div class="page_navi">
				<span class="home"><a href="/">홈</a></span><span class="middle_n">멤버십</span><span>정보입력</span>
			</div>
			<h1>정보입력</h1>

		</div>
		<div class="page sub_paged month_write" id="bbs_container">
			<div class="join_top03 member_porcess">
				<ul>
					<li><span>Step01</span>약관동의</li>
					<li class="ag_on"><span>Step02</span>정보입력</li>
					<li><span>Step03</span>가입완료</li>
				</ul>
			</div>
			<h3>회원정보입력</h3>
			<form method="POST" action="" accept-charset="UTF-8"
				class="form form-horizontal" name="writeForm" id="writeForm">
				<input name="_token" type="hidden" value=""> <input
					name="chkid" type="hidden" value="0"> <input
					name="auth_gpin_virtualNo" type="hidden"> <input
					name="auth_gpin_dupInfo" type="hidden"> <input
					name="auth_nice_DI" type="hidden"> <input
					name="auth_nice_CI" type="hidden"> <input
					name="auth_birthDate" type="hidden"> <input name="gender"
					type="hidden"> <span class="im_mo_importnat">(※ (<span
					class="red">*</span>) 표시가 있는 항목은 반드시 입력해야 합니다.)
				</span>
				<div class="bbs_write">
					<table
						summary="게시판 쓰기에 대해 제목, 작성자, 이메일, 비밀번호, 내용, 첨부 순으로 작성하실 수 있습니다."
						class="member_table">
						<caption>게시판 쓰기</caption>
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="bbs_inp_title">아이디<span
										class="red">*</span></label></th>
								<td style="font-size: 13px; color: #777;">
									<input name="userid" id="userid" title="" type="text" size="40" value=""
									class="table_hundred">
									<!-- 아이디 중복 확인 여부 체크 -->
									<input type="hidden" id="idDupCheck" value="N">
								
								<!--  
								<button onclick="id_check(); return false;">중복확인</button>
								
								 아이디 중복 확인 메세지 띄우는 곳 
								<span id="idcheck"></span>
								-->
								
								<!-- 아이디 중복 확인 팝업 띄우기 -->
								<button onclick="idCheckPop(); return false;">아이디 중복 확인</button>
									
								<br> * 아이디는 영문, 숫자 조합으로 5~15자 이내로 입력해주세요.</td>
							</tr>
							<tr>
								<th scope="row"><label for="bbs_text_content">비밀번호<span
										class="red">*</span></label></th>
								<td style="font-size: 13px; color: #777;"><input
									name="userpwd" title="" id="userpwd" type="password"
									size="40" value="" class="table_hundred" autocomplete="off"><br>
									* 비밀번호는 영문, 숫자, 특수기호 조합으로 8~15자 이내로 입력해주세요.<br> 
									* @, #, &amp;, $, !, ?, %, * 외의 특수문자는 이용 하실 수 없습니다.</td>
							</tr>
							<tr>
								<th scope="row"><label for="bbs_text_content">비밀번호
										확인<span class="red">*</span>
								</label></th>
								<td><input name="userpwd2" title=""
									id="userpwd2" type="password" size="40" value=""
									class="table_hundred" autocomplete="off"></td>
							</tr>
							<tr>
								<th scope="row"><label for="bbs_inp_name"><span
										id="uname">회원이름</span><span class="red">*</span></label></th>
								<td><input name="name" title="" id="name"
									type="text" size="40" value="" class="table_hundred"></td>
							</tr>
							<tr>
								<th scope="row"><label for="bbs_inp_call">휴대전화<span
										class="red">*</span></label></th>
								<td><input type="text" name="uphone1" class="input_"
									size="4" maxlength="3" value=""
									onkeyup="next_input(this,'3','uphone2')" id="uphone1">- <input
									type="text" name="uphone2" id="uphone2" class="input_" size="4"
									maxlength="4" value="" onkeyup="next_input(this,'4','uphone3')">-
									<input type="text" name="uphone3" id="uphone3" class="input_" size="4"
									maxlength="4" value="" onkeyup="next_input(this,'4','phone1')">
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="bbs_inp_linecall">전화번호</label></th>
								<td><input type="text" name="phone1" id="phone1" class="input_"
									size="4" maxlength="3" value=""
									onkeyup="next_input(this,'3','phone2')">- <input
									type="text" name="phone2" id="phone2" class="input_" size="4" maxlength="4"
									value="" onkeyup="next_input(this,'4','phone3')">- <input
									type="text" name="phone3" id="phone3" class="input_" size="4" maxlength="4"
									value="" onkeyup="next_input(this,'4','email')"></td>
							</tr>
							<tr>
								<th scope="row"><label for="bbs_inp_email">이메일</label><span class="red">*</span></th>
								<td><input name="email" title="이메일을 입력하세요."
									id="email" type="text" size="15" value="">@ <input
									name="email2" title="이메일을 입력하세요." id="email2" class="eamil_domain"
									type="text" size="15" value=""> 
									<select id="email_ex">
										<c:forEach var="d" items="${domain}">
											<c:if test="${d == '직접입력'}">
												<option value="">${d}</option>
											</c:if>
											<c:if test="${d != '직접입력'}">
												<option value="${d}">${d}</option>
											</c:if>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row" rowspan="4"><label for="bbs_inp_title"><span
                              id="addr">주소</span><span class="red">*</span></label></th>
                        <td><input name="zipcode" id="zipcode" title="" type="text"
                           size="10" value="" readonly>
                           <input type="button" value="우편번호" style="width: 80px;height:30px" onclick="kakaopost()"></td>

							</tr>
							<tr>
								<td id="zipform" style="display: none"></td>
							</tr>
							<tr>
								<td>주소 <input name="address" id="address" title="" type="text"
									size="40" value="" class="table_hundred" readonly=""></td>
							</tr>
							<tr>
								<td>상세주소<input name="address2" id="address2" title=""
									type="text" size="40" value="" class="table_hundred"></td>
							</tr>
							
						</tbody>
					</table>

				</div>
				<input type="submit" style="display: none">
			</form>

			<div class="bbs_bottom_wrap">
				<div class="bbs_btn_area">
					<p class="bt_center">
						<a href="/" class="cancle_btn">취소하기</a>
						<a href="#" id="submit" onclick="javascript:join_check();">가입하기</a>
					</p>
				</div>
			</div>
		</div>


	</div>

	<%@ include file="../main/footer.jsp"%>
</body>
</html>