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
	function goPwdsearch() {
	    if($.trim($('#userid').val())=="") {
	        alert("아이디를 입력하세요!");
	        $('#userid').val('').focus();
	        return;
	    }
	 
	    if($.trim($('#email').val())=="") {
	        alert("이메일을 입력하세요!");
	        $('#email').val('').focus();
	        return;
	    }
	    
	    //이메일 유효성 검사 (이메일이 올바른 양식으로 작성되었는지)
		var regExEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		if(!regExEmail.test($('#email').val())){
			alert('이메일 입력을 확인해주세요.');
			$('#email').val('').focus();
			return;
		}
		
		//비밀번호 찾기 ajax
		$.ajax({
			url : "/pwdsearch",
			type : "POST",
			data : {
				userid : $("#userid").val(),
				email : $("#email").val()
			},
			success : function(result) {
				alert(result);
			},
		});
		
		
//	    document.userForm.action = "/pwdsearch_ok";
//	    document.userForm.submit();
	}
	
	
	
	//폼 입력시 폼 안에 글씨 사라지게 하기
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
				<h3 class="login_new_title">비밀번호 찾기</h3>

				<div class="login_box_new">

					<div class="login">
						<p class="input">
							<label for="userid" style="display: block;">
								<strong>아이디</strong>
							</label>
							<input class="id_input" name="userid" id="userid" type="text" maxlength="20" value="" style="height:54px;">
						</p>
						<p class="input">
							<label for="name" style="display: block;">
								<strong>이메일</strong>
							</label>
							<input class="pass_input" name="email" id="email" type="text" style="height:54px;">
						</p>
						
						<div class="btn">
							<a href="#비밀번호찾기" style="width: 235px;float:left;" onclick="javascript:goPwdsearch();">비밀번호 찾기</a>
							<a href="/login" style="width: 235px;float:left;margin-left: 10px;">취소</a>
						</div>

					</div>
				</div>
			</form>
		</div>
	</div>

</body>
</html>