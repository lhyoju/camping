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
<script type="text/javascript" src="/js/login/member.js">
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

//아이디 중복 체크 0 -> 중복체크 x / 1-> 중복체크 완료
var idck = 0;
</script>

<script>
	
	$(document).ready(function(){
		$("#email_ex").change(function(){
			$(".eamil_domain").val($(this).val());
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
			<h3>회원정보입력</h3>
			<form method="POST" action="" accept-charset="UTF-8"
				class="form form-horizontal" name="delForm" id="delForm">
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
								<th scope="row"><label for="userid">아이디<span class="red">*</span></label>
								</th>
								<td style="font-size: 13px; color: #777;">
									<input name="userid" id="userid" title="" type="text" size="40" value="${m.userid}" class="table_hundred" readonly>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="userpwd">비밀번호<span class="red">*</span></label></th>
								<td style="font-size: 13px; color: #777;"><input
									name="userpwd" title="" id="userpwd" type="password"
									size="40" value="" class="table_hundred" autocomplete="off"></td>
							</tr>
							<tr>
								<th scope="row"><label for="delcont">탈퇴사유<span class="red">*</span></label></th>
								<td><textarea rows="11" cols="36" id="delcont" name="delcont"></textarea></td>
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
						<a href="#" id="submit" onclick="javascript:del_check();">탈퇴하기</a>
					</p>
				</div>
			</div>
		</div>


	</div>

	<%@ include file="../main/footer.jsp"%>
</body>
</html>