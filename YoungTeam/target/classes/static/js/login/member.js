
//회원 수정 체크
function edit_check(){
	var regExUPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;	
	var regExPhone = /^[0-9]{2,3}-?[0-9]{3,4}-?[0-9]{4}$/;	
	var regExPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,15}$/;
	var regExEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	var userpwd = $.trim($('#userpwd').val());
	var userpwd2 = $.trim($('#userpwd2').val());
	var uphone = $.trim($('#uphone1').val()) + "-" + $.trim($('#uphone2').val()) + "-" + $.trim($('#uphone3').val());
	var phone = $.trim($('#phone1').val()) + "-" + $.trim($('#phone2').val()) + "-" + $.trim($('#phone3').val());
	var email = $.trim($('#email').val()) + "@" + $.trim($('#email2').val());
	var address = $.trim($('#address').val());
	var address2 = $.trim($('#address2').val());
	
	
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

	document.editForm.action = "/member_edit_ok";
	document.editForm.submit();
	
}



//회원탈퇴 폼 체크
function del_check(){
	if($.trim($("#userpwd").val())==""){
		 alert("탈퇴 비번을 입력하세요!");
		 $("#userpwd").val("").focus();
		 return false;
	 }
	 if($.trim($("#delcont").val())==""){
		 alert("탈퇴 사유를 입력하세요!");
		 $("#delcont").val("").focus();
		 return false;
	 }
	 
	document.delForm.action = "/member_del_ok";
	document.delForm.submit();
}