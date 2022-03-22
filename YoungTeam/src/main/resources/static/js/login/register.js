
//회원가입 체크
function join_check(){
	var regExId = /^(?=.*[a-z])(?=.*[0-9]).{5,15}$/;
	var regExUPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;	
	var regExPhone = /^[0-9]{2,3}-?[0-9]{3,4}-?[0-9]{4}$/;	
	var regExPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,15}$/;
	var regExName = /^[가-힣]{2,15}$/;
	var regExEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	var userid = $.trim($('#userid').val());
	var userpwd = $.trim($('#userpwd').val());
	var userpwd2 = $.trim($('#userpwd2').val());
	var username = $.trim($('#name').val());
	var uphone = $.trim($('#uphone1').val()) + "-" + $.trim($('#uphone2').val()) + "-" + $.trim($('#uphone3').val());
	var phone = $.trim($('#phone1').val()) + "-" + $.trim($('#phone2').val()) + "-" + $.trim($('#phone3').val());
	var email = $.trim($('#email').val()) + "@" + $.trim($('#email2').val());
	var address = $.trim($('#address').val());
	var address2 = $.trim($('#address2').val());
	
	//아이디 유효성 검증
	if(userid == ""){
		alert('아이디를 입력해주세요.');
		$('#userid').val('').focus();
		return;
	}
	
    //아이디 중복 체크했는지 확인 -> idDupCheck 아이디 값이 Y일 경우 중복체크 O, N일 경우 중복체크 X
    if($('#idDupCheck').val() != 'Y'){
    	alert('아이디 중복체크를 해주세요.');
		return false;
    }
	
	//비밀번호 유효성 검증
	if(userpwd == ""){
		alert('비밀번호를 입력해주세요!');
		$('#userpwd').val('').focus();
		return;
	}
	
	if(!regExPwd.test(userpwd)){
		alert('비밀번호는 영문, 숫자, 특수기호 조합으로 8~15자 이내로 입력해주세요.');
		$('#userpwd').val('').focus();
		return;
	}
	
	if(userpwd2 == ""){
		alert('비밀번호 확인을 입력해주세요!');
		$('#userpwd2').val('').focus();
		return;
	}
	
	if(userpwd != userpwd2){
		alert('비밀번호가 틀립니다. 다시 확인하여 입력해주세요.');
		$('#userpwd2').val('').focus();
		return;
	}
	
	//이름 유효성 검증
	if(username == ""){
		alert('이름을 입력해주세요.');
		$('#name').val('').focus();
		return;
	}
	
	if(!regExName.test(username)){
		alert('이름은 한글만 입력해주세요.');
		$('#name').val('').focus();
		return;
	}
	
	//핸드폰 번호 유효성 검증
	if(!regExUPhone.test(uphone)){
		alert('휴대전화번호 입력을 확인해주세요.');
		$('#uphone1').focus();
		return;
	}
	
	//전화번호 유효성 검증
	if(phone != "--" && !regExPhone.test(phone)){
		alert('전화번호 입력을 확인해주세요.');
		$('#phone1').focus();
		return;
	}
	
	//이메일 유효성 검증
	if($.trim($('#email').val()) == ""){
		alert('이메일을 입력해주세요.');
		$('#email').val('').focus();
		return;
	}
	
	if($.trim($('#email2').val()) == ""){
		alert('이메일을 입력해주세요.');
		$('#email2').val('').focus();
		return;
	}
	
	if(!regExEmail.test(email)){
		alert('이메일 입력을 확인해주세요.');
		$('#email').focus();
		return;
	}
	
	//주소 유효성 검증
    if(address == ""){
		alert('주소를 입력해주세요.');
		$('#address').focus();
		return;
	}
	
	if(address2 == ""){
		alert('상세 주소를 입력해주세요.');
		$('#address2').focus();
		return;
	}
	
	document.writeForm.action = "/join_ok";
	document.writeForm.submit();
	
}

//아이디 중복 검사
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
      		//사용가능한 아이디일 경우  idck = 1 
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

//로그인 페이지 팝업
function goLoginPop(){
	var url = "/login";
	var name = "login popup";
	var option = "width = 550, height = 650, top = 100, left = 200, location = no";
	window.open(url, name, option);
}

function idCheckPop(){
	var url = "/idCheckForm";
	var name = "idCheck popup";
	var option = "width = 550, height = 400, top = 100, left = 200, location = no";
	window.open(url, name, option);
}