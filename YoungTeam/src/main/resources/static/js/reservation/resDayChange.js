function resDayChange(){
var back = document.getElementById("schGugun").options[document.getElementById("schGugun").selectedIndex].value;
var resDay = document.getElementById("testDatepicker").value;

var fr = document.getElementById("fr");

var resDayMid;
var resDayEnd;
var date = new Date(resDay);

/*if(back == 1){
var resDateEndDoc = document.getElementById("resDateEnd");
date.setDate(date.getDate() + 1);
resDayEnd = date.getFullYear() + "/" + (date.getMonth() + 1) + "/" + date.getDate();
resDateEndDoc.value = resDayEnd;
alert(resDayEnd);
}
if(back == 2){
var resDateMidDoc = document.getElementById("resDateMid");
var resDateEndDoc = document.getElementById("resDateEnd");
date.setDate(date.getDate() + 1);
resDayMid = date.getFullYear() + "/" + (date.getMonth() + 1) + "/" + date.getDate();
date.setDate(date.getDate() + 1);
resDayEnd = date.getFullYear() + "/" + (date.getMonth() + 1) + "/" + date.getDate();
resDateMidDoc.value = resDayMid;
resDateEndDoc.value = resDayEnd;
alert("resDayMid : " + resDayMid + ", resDayEnd : " + resDayEnd);
}*/
fr.action = "/reservation";
fr.submit();
}