<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>솔향기캠핑장</title>
<link href="/css/style.css" rel="stylesheet">
﻿<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>﻿
<script>
	
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
	
	//아이디 중복 체크 여부 구분 변수
	var idck = 0;
	
	//아이디 중복 체크
	function id_check(){

		var regExId = /^(?=.*[a-z])(?=.*[0-9]).{5,15}$/;
		
		$userid=$.trim($("#userid").val());
		//1.입력글자 길이 체크
		if($userid.length < 5){
			$newtext='아이디는 5자 이상이어야 합니다.';
			$("#idcheck").text('');
			//idcheck 아이디 영역 문자열을 초기화
			$("#idcheck").html($newtext);
			$("#idcheck").css('color','red');
			$("#idcheck").css('font-weight','bold');
			$("#userid").val('').focus();
			return false;
		};
		if($userid.length > 12){
			$newtext='아이디는 15자 이하이어야 합니다.';
			$("#idcheck").text('');
			$("#idcheck").html($newtext);
			$("#idcheck").css('color','red');
			$("#idcheck").css('font-weight','bold');
			$("#userid").val('').focus();
			return false;
		};
		//2.입력글자 확인
		if(!regExId.test($userid)){
			$newtext='아이디는 영문 소문자, 숫자 조합만 가능합니다.';
			$("#idcheck").text('');
			$("#idcheck").html($newtext);
			$("#idcheck").css('color','red');
			$("#idcheck").css('font-weight','bold');
			$("#userid").val('').focus();
			return false;
		};
		//3.아이디 중복확인
	    $.ajax({
	        type:"POST",//HTTP 통신의 종류
	        url:"/join_idcheck", //아작스 서버 주소 파일명
	        data: $userid, //전송할 데이터
	        dataType:"json",//서버에서 반환되는 데이터 형식
	        contentType:"application/json; charset=UTF-8;", //서버에 데이터를 보낼 때 사용
	        success: function (data) {//success는 아작스로 받아오는것이 성공했을 경우 서버 데이터를 data변수에 저장
	      	  if(data.cnt > 0){//중복 아이디가 있다면
	      		$newtext='중복 아이디입니다.';
	      		$("#idcheck").text('');
				$("#idcheck").html($newtext);
				$("#idcheck").css('color','red');
				$("#idcheck").css('font-weight','bold');        		
	          	$("#userid").val('').focus();
	          	return false;
		     
	      	  }else{//중복 아이디가 아니면
	      		$newtext='사용가능한 아이디입니다.';
	      		$("#idcheck").text('');
				$("#idcheck").html($newtext);
				$("#idcheck").css('color','blue');
				$("#idcheck").css('font-weight','bold');   
	      		$("#userpwd").focus();
	      		//아이디가 사용가능한 경우  idck = 1 
	            idck = 1;
	      		
	      		//중복입력 확인 후 다시 키보드 입력할 경우 idck = 0을 변경
	      		$('#userid').keydown(function(){
	      			idck=0;	
	      		});
	      		
	      	  }  	    	  
	        },
	    	  error:function(){//비동기식 아작스로 서버디비 데이터를
	    		  //못가져와서 에러가 발생했을 때 호출되는 함수이다.
	    		  alert("data error");
	    	  }
	      });
		
	}
	
	//중복체크 했을 경우 idck == 1, 부모창의 id 입력필드에 중복체크한 값 넣고 readonly 속성 추가, 중복확인 체크할 수 있는 idDupCheck id값에 Y값 부여
	function id_check_ok(){
		if(idck==1){
			$("#userid", opener.document).val($("#userid").val());
			$("#userid", opener.document).prop('readonly', true);    
			$("#idDupCheck", opener.document).val('Y');
			window.close(); 
		}else{
			alert('아이디 중복확인을 해주세요!');
		}
		
	}
	
</script>

</head>

<body>

	<div>
		
		<div class="member_login">
			<form method="POST" action="" accept-charset="UTF-8"
				class="form form-horizontal" id="idCheckForm">
				<h3 class="login_new_title">아이디 중복 확인</h3>
				<hr/>

				<div style="padding-top: 30px;">
					<div class="login">
						<p class="input">
							<label for="userid" style="display: block;">
								<strong style="top: 17px;">아이디</strong>
							</label>
							<input name="userid" id="userid" type="text" maxlength="15" style="height: 54px;">
							
						</p>
						
						<!-- 중복확인 결과 확인 -->
						<span id="idcheck" style="display:block;"></span><br/>
					
						
						<div class="btn">
							<a href="#" onclick="id_check(); return false;" style="width: 235px;float:left;" >아이디 중복 확인</a>
							<a href="#" onclick="javascript:id_check_ok();" style="width: 235px;float:left;margin-left: 10px;">확인</a>
						</div>
				
					</div>
				</div>
				<hr/>
			</form>
		</div>
	</div>

</body>
</html>