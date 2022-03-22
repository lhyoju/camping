<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>솔향기캠핑장</title>
<link href="/css/style.css" rel="stylesheet">
﻿<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>﻿
<script>
	function goLogin() {
	    if($.trim($('#userid').val())=="") {
	        alert("아이디를 입력하세요!");
	        $('#userid').val('').focus();
	        return;
	    }
	 
	    if($.trim($('#userpwd').val())=="") {
	        alert("비밀번호를 입력하세요!");
	        $('#userpwd').val('').focus();
	        return;
	    }
	    document.userForm.action = "/loginOk";
	    document.userForm.submit();
	}
	
	//로그인 폼에서 회원가입 폼으로 이동
	function goJoin(){
		opener.location.replace('/join'); //부모창 회원가입폼으로 이동
		window.close(); //로그인 팝업 닫아주기
	}
	
	jQuery(document).ready(function(){
	    
	    var idTarget = $(".input input[type=text]");
	 
	    idTarget.focus(function(){
	        $(this).siblings("label").fadeOut("fast");
	    });
	 
	    idTarget.focusout(function(){
	        if($(this).val() == ""){
	            $(this).siblings("label").fadeIn("fast");
	        }
	    });
	    
	    var passTarget = $(".input input[type=password]");
		 
	    passTarget.focus(function(){
	        $(this).siblings("label").fadeOut("fast");
	    });
	 
	    passTarget.focusout(function(){
	        if($(this).val() == ""){
	            $(this).siblings("label").fadeIn("fast");
	        }
	    });
	 
	});
</script>


</head>

<body>

	<div>
		<h1>로그인</h1>
		<hr>
		<div class="member_login">
			<form method="POST" action="" accept-charset="UTF-8"
				class="form form-horizontal" name="userForm" id="userForm">
				<input name="_token" type="hidden" value="">
				<h3 class="login_new_title">회원로그인</h3>

				<div class="login_box_new">

					<div class="login">
						<p class="input">
							<label for="userid" style="display: block;">
								<strong>아이디</strong>
								<span>최소 5자 ~ 최대 15자</span>
							</label>
							<input class="id_input" name="userid" id="userid" type="text" maxlength="20" value="" style="height:54px;">
						</p>
						<p class="input">
							<label for="userpwd" style="display: block;">
								<strong>비밀번호</strong>
								<span>영문, 숫자, 특수문자 혼합 10~15자</span>
							</label>
							<input class="pass_input" name="userpwd" id="userpwd" type="password" autocomplete="off"
								onkeydown="if(event.keyCode==13) { goLogin(); return }">
						</p>
						
						<div class="btn">
							<a href="#로그인" onclick="javascript:goLogin();">로그인</a>
						</div>

					</div>
				</div>
				<div class="id-search">
					<a href="/idsearch" ><span class="id-s"></span>아이디 찾기</a>
					<a href="/pwdsearch"><span class="pw-s"></span>비밀번호 찾기</a>
					<a href="javascript:goJoin();"> <span class="join-s"></span>회원가입
					</a>
				</div>
				<input type="hidden" name="" value="">
			</form>
		</div>
	</div>

</body>
</html>