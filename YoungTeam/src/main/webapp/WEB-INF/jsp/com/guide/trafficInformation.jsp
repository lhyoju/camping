<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="/css/main.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link href="/css/sub.css" rel="stylesheet">
<link href="/css/guide.css" rel="stylesheet">

 <script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
 <script>
  function initialize() {
   var myLatlng = new google.maps.LatLng(37.859169, 128.853662);
   var mapOptions = {
        zoom: 17,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
   }
   var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
   var marker = new google.maps.Marker({
       position: myLatlng,
       map: map,
       title: "솔향기캠핑장"
});
  }
 </script>
</head>
<body onload="initialize()">
   <%@ include file="../main/header.jsp"%>
   
   <div id="sub_visual">
      <div class="sub_visual4">
         <div class="sub_vis_inr wrap">
            <h1>위치 및 교통정보</h1>
            <p>솔향기캠핑장에 오신것을 환영합니다.</p>
         </div>
      </div>
   </div>
   
   <div id="sub_container">
      <div id="location"></div>
      <div id="sub_con_inner" class="wrap">

         

         <div id="sub_contents">
            <div id="title_container">
               <!-- 캠핑장 안내 -->
               <div class="page_navi">
                  <span class="home"><a href="">홈</a></span><span class="middle_n">이용안내
                     </span><span>위치 및 교통정보</span>
               </div>
               <h1>위치 및 교통 정보</h1>

            </div>
            
            
             <div id="map_canvas" style="width:600px; height:400px;"></div>
             <div class="clear"></div>
            
             <div class="addr" style="width:600px;height:100px;">
             <br/>
             <p>강원도 강릉시 연곡면 해안로 1282<br/>
             관리사무소 : 033-662-2900 / 팩스 : 033-662-2905</p>
             </div>
            
            
             <div class="road"  style="width:600px;height:120px;">
             <br/>
             승용차를 이용하여 오시는 길<br/><br/>
             ● 강 릉IC -> 7번국도 -> 속초방향 -> 강릉아산병원 -> 연곡해수욕장<br/>
             ● 북강릉IC - 7번국도 -> 속초방향 -> 연곡해수욕장

             </div>
            
             <div class="bus" style="width:600px;height:200px;">
             <br/>
             시내버스 이용안내<br/><br/>
             「연곡해변 솔향기캠핑장」은 연곡해변입구 정류장에서 내리셔서 도보로 1Km (약 10분~15분) 거리에 위치하고 있습니다.<br/><br/>
             노선번호 : 300번, 301번, 302번, 303번, 304번, 305번, 313번<br/>
             ※ 자세한 사항은 강릉버스정보 시스템(http://bis.gn.go.kr/)을 이용하여 주시기 바랍니다.<br/>
             </div>
             

         </div>
      </div>

   </div>


   <%@ include file="../main/footer.jsp"%>
</body>
</html>