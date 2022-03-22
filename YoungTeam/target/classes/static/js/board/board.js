/**
 * board.js
 */

function bw_check(){
	if($.trim($("#board_name").val())==""){
		alert("이름을 입력하세요!");
		$("#board_name").val("").focus();
		return false;
	}
	if($.trim($("#board_title").val())==""){
		alert("제목을 입력하세요!");
		$("#board_title").val("").focus();
		return false;
	}
	if($.trim($("#board_cont").val())==""){
		alert("글내용을 입력하세요!");
		$("#board_cont").val("").focus();
		return false;
	}
}

 function bodChk(loginChk){
 	var form = document.fr;
	if(loginChk == 0){
		form.submit();
	}else{
		alert("로그인이 필요한 서비스입니다.");
		goLoginPop();
	}
}
 
 function goLoginPop(){
		var url = "/login";
		var name = "login popup";
		var option = "width = 500, height = 500, top = 100, left = 200, location = no";
		window.open(url, name, option);
	}