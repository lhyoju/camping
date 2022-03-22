<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>솔향기캠핑장</title>
<link href="/css/style.css" rel="stylesheet">﻿

</head>

<body>

	<div>
		<h1>로그인</h1>
		<hr>
		<div class="member_login">
			<form method="POST" action="" accept-charset="UTF-8"
				class="form form-horizontal" name="userForm" id="userForm">
				<input name="_token" type="hidden" value="">
				<h3 class="login_new_title">아이디 찾기</h3>

				<div class="login_box_new">

					<div class="login">
						<p class="input" style="margin-bottom: 30px;height: 100px; line-height:100px; text-align:center;">
							회원님의 아이디는 <strong>${userid}</strong> 입니다.
						</p>
						
						<div class="btn">
							<a href="/login" style="width: 235px;float:left;" onclick="javascript:goPwdsearch();">로그인 하기</a>
							<a href="#" onclick="window.close();" style="width: 235px;float:left;margin-left: 10px;">닫기</a>
						</div>

					</div>
				</div>
			</form>
		</div>
	</div>

</body>
</html>