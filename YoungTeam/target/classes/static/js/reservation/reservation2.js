
function plusPrice(price, site){


 var form = document.fr;
 var amPr = 0; // 총 금액
 var day = form.schGugun.value;
 var stPrice = price * day;
 var bagPrice = 680 * day;
 
 a++;
 
 form.siteprice.value = stPrice;
 form.bagprice.value = bagPrice;
 amPr = stPrice + bagPrice;
 form.price.value = amPr;
 var siteName = site + "_site";
 if(a % 2 == 1){
 document.getElementById(siteName).className += " cbtn_clink";
 }else{
 document.getElementById(siteName).classList.remove("cbtn_clink");
 form.siteprice.value = 0;

 form.bagprice.value = 680 * day;
 form.price.value = 0;
 location.reload();
 }
  form.siteNum.value = site;
 window.scrollTo(0,0);
 }