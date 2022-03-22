var payMethod1;
var check_module;


const showValue = (target) => {
if(target.value == "card"){
payMethod1 = "card";
}else if(target.value == "vbank"){
payMethod1 = "vbank";
}
var form = document.getElementById("fr");
var pay = document.getElementById("payMethod");
if(payMethod1 == "0"){
pay.value = "card";
}else if(payMethod1 == "1"){
pay.value = "vbank";
}
}

function pay(payPrice, resName, phone){
if(payMethod1 == "card"){
card(payPrice, payMethod1, resName, phone);
}
if(payMethod1 == "vbank"){
var form = document.getElementById("fr");
form.action = "/vbank";
form.submit();
}
}

 function card(price, payMethod, resName, phone){

var form = document.getElementById("fr");
var IMP = window.IMP; // 생략가능
var pay = document.getElementById("payMethod");

IMP.init("imp49355872");
// "iamport" 대신 부여받은 "가맹점 식별코드"를 사용
// i"mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
IMP.request_pay({
pg: "html5_inicis", // version 1.1.0부터 지원.



pay_method: payMethod,
/*
"samsung":삼성페이,
"card":신용카드,
"trans":실시간계좌이체,
"vbank":가상계좌,
"phone":휴대폰소액결제
*/
merchant_uid: "merchant_" + new Date().getTime(),
/*
merchant_uid에 경우
https://docs.iamport.kr/implementation/payment
위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
참고하세요.
나중에 포스팅 해볼게요.
*/
name: "솔향기 캠핑장",
//결제창에서 보여질 이름
amount: price,
//가격
buyer_email: "iamport@siot.do",
buyer_name: resName,
buyer_tel: phone,
buyer_addr: "서울특별시 강남구 삼성동",
buyer_postcode: "123-456",
m_redirect_url: "https://www.yourdomain.com/payments/complete"
/*
https://www.yourdomain.com/payments/complete
모바일 결제시,
결제가 끝나고 랜딩되는 URL을 지정
(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
*/
}, function (rsp) {
console.log(rsp);
if (rsp.success) {
var mid = document.getElementById("mid");
mid.value = rsp.merchant_uid;
$.ajax({
type:"post",
url:"/resCon",
data:{
	"imp_uid" : rsp.imp_uid
}
})
form.submit();
} else {
var msg = "결제에 실패하였습니다.";
msg += "에러내용 : " + rsp.error_msg;
alert(msg);
}


});

}
