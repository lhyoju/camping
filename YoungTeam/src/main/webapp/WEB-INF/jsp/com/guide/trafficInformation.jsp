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
</head>
<body>
   <%@ include file="../main/header.jsp"%>
   
   <div id="sub_visual">
      <div class="sub_visual2">
         <div class="sub_vis_inr wrap">
            <h1>이용안내</h1>
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
                  <span class="home"><a href="">홈</a></span><span class="middle_n">이용안내</span><span>위치 및 교통정보</span>
               </div>
               <h1>위치 및 교통 정보</h1>

            </div>
            
             <div class="page present" id="sub_page">
             <div id="map" style="width:800px;height:400px; margin:30px auto;"></div>
             
             <div class="clear"></div>
            
             <div style="text-align:center;">
             <div class="addr" style="height:100px;">
             <br/>
             <p>강원도 강릉시 연곡면 해안로 1282<br/>
             관리사무소 : 033-662-2900 / 팩스 : 033-662-2905</p>
             </div>
             </div>
            
             <div style="text-align:center;">
             <div class="road"  style="height:120px;">
             <br/>
             승용차를 이용하여 오시는 길<br/><br/>
             ● 강 릉IC -> 7번국도 -> 속초방향 -> 강릉아산병원 -> 연곡해수욕장<br/>
             ● 북강릉IC - 7번국도 -> 속초방향 -> 연곡해수욕장
             </div>
             </div>
             
             <div style="text-align:center;">
             <div class="bus" style="height:200px;">
             <br/>
             시내버스 이용안내<br/><br/>
             「연곡해변 솔향기캠핑장」은 연곡해변입구 정류장에서 내리셔서 도보로 1Km (약 10분~15분) 거리에 위치하고 있습니다.<br/><br/>
             노선번호 : 300번, 301번, 302번, 303번, 304번, 305번, 313번<br/>
             ※ 자세한 사항은 강릉버스정보 시스템(http://bis.gn.go.kr/)을 이용하여 주시기 바랍니다.<br/>
             </div>
             </div>
             </div>
         </div>
      </div>
   </div>


   <%@ include file="../main/footer.jsp"%>
   
   <!-- 지도[s] -->    
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=99d06d2d4402d057065d7c3f842999d8"></script>
    <script>
        var container = document.getElementById('map'); //지도 표시 div
        var options = {
            center: new kakao.maps.LatLng(37.859195, 128.853576), //지도의 중심좌표
            level: 2 //지도의 확대 레벨
        };
 		
        // 지도 생성
        var map = new kakao.maps.Map(container, options);
        
        // 마커가 표시될 위치
        var markerPosition  = new kakao.maps.LatLng(37.859195, 128.853576); 
 
        // 마커 생성
        var marker = new kakao.maps.Marker({
            position: markerPosition
        });
 
        // 마커가 지도 위에 표시되도록 설정
        marker.setMap(map);
 
        // 아래 코드는 지도 위의 마커를 제거하는 코드
        // marker.setMap(null);  
        
    </script>
    <!-- 지도[e] -->
</body>
</html>