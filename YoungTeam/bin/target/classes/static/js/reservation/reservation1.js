/**
 * 
 */
 
 function resChk(loginChk){
 var form = document.fr;
 if(loginChk == 0){
 // 날짜
 if(form.startDay.value == ""){
 alert("날짜를 선택하세요");
 form.startDay.focus();
 return;
 }
 
 if(form.price.value == 0){
 alert("싸이트를 선택해주세요");
 window.scrollTo(0,0);
 return;
 }

 form.submit();
 }else{
 alert("로그인 후 예약하세요");
 goLoginPop();
 }
 }
 
 function goLoginPop(){
		var url = "/login";
		var name = "login popup";
		var option = "width = 500, height = 500, top = 100, left = 200, location = no";
		window.open(url, name, option);
	}
