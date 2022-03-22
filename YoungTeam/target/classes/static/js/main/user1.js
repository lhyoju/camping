
function join_check(){
   if($.trim($('#userid').val()) ==''){
      alert('회원아이디를 입력하세요!');
      $('#userid').val('').focus();
      return false;
   }
   
   $userpwd = $.trim($('#userpwd').val());
   var pwdregular=$.trim($('#userpwd').val());
   $pwdchk= $.trim($('#pwdchk').val());
   
   if($userpwd == ''){
      alert('회원비번을 입력하세요!');
      $('#userpwd').val('').focus();
      return false;
   }

	if(/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#&$*()=_.|-]).{10,15}$/.test(pwdregular) == false){
		alert("사용할 수 없은 조합입니다.\n패스워드 설정안내를 확인해 주세요.");
		return false;
   }

   if($pwdchk == ''){
      alert('비번확인을 입력하세요!');
      $('#pwdchk').val('').focus();
      return false;
   }
   
   if($userpwd != $pwdchk){
      alert('비번이 다릅니다!');
      $('#userpwd').val('');//비번 입력필드 초기화
      $('#pwdchk').val('');//비번확인 입력필드 초기화
      return false;
   }
   
   if($.trim($('#userName').val()) ==''){
      alert('회원이름을 입력하세요!');
      $('#userName').val('').focus();//이름 해당 아이디 묻고만들기
      return false;
   }
   
   if($.trim($('#userEmail').val()) ==''){
      alert('이메일을 입력하세요!');
      $('#userEmail').val('').focus();
      return false;
   }
}

