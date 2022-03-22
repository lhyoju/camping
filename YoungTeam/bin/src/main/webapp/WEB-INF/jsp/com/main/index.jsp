<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>솔향기캠핑장</title>
<link href="/css/main.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">

</head>

<body>

   <%@ include file="./header.jsp"%>
   <div id="main_container">
      <div style="margin: 0;">
         <img src="/img/main_vis01.jpg">
         <!-- <img src="/img/visual_left.png"> 
      <img src="/img/visual_right.png">
      -->
      </div>

      <div id="main_contents_01">
         <div id="mcon_inner" class="wrap"">
            <div aria-live="polite">
               <div
                  style="opacity: 1; width: 1200px; transform: translate3d(0px, 0px, 0px);">
                  <div class="contents_menu" style="width: 230px;">
                     <a href="/introduce"> <img src="/img/main_C1_icon01.png">
                        <p>
                           캠핑장 소개 <br>
                           <span>INTRODUCE</span>
                        </p>
                     </a>
                  </div>
                  <div class="contents_menu" style="width: 230px;">
                     <a href="/reservation"> <img src="/img/main_C1_icon02.png">
                        <p>
                           예약하기 <br>
                           <span>RESERVATION</span>
                        </p>
                     </a>
                  </div>
                  <div class="contents_menu" style="width: 230px;">
                     <a href="/confirm"> <img src="/img/main_C1_icon03.png">
                        <p>
                           예약확인 <br>
                           <span>CONFIRM</span>
                        </p>
                     </a>
                  </div>
                  <div class="contents_menu" style="width: 230px;">
                     <a href="/time_fare"> <img src="/img/main_C1_icon04.png">
                        <p>
                           요금안내 <br>
                           <span>FARE GUIDE</span>
                        </p>
                     </a>
                  </div>
                  <div class="contents_menu" style="width: 230px;">
                     <a href="/trafficInformation"> <img src="/img/main_C1_icon05.png">
                        <p>
                           찾아오시는 길 <br>
                           <span>LOCATION</span>
                        </p>
                     </a>
                  </div>
               </div>
            </div>
         </div>
      </div>


      <div>
         <img src="/img/main_C3_allbg.jpg">
         

      </div>

         <div id="main_contents_04">
      <div id="mcon4_innner" class="wrap">
         <div class="facility">
            <h2>시설안내</h2>
            <p>
               솔향기캠핑장 홈페이지에서<br />
               원하는 정보를 찾아보세요!
            </p>
            <a href="/convenience">바로가기</a>
         </div>
         <div class="online">
            <h2>온라인문의</h2>
            <p>
               솔향기캠핑장 고객님들을 위해<br />
               최선을 다하고 있습니다.
            </p>
            <div class="go_btn">
               <a href="/often_list" class="many_q">자주하는 질문</a>
               <a href="/qna_list" class="q_a">묻고 답하기</a>
            </div>
         </div>
         <div class="call">
            <h2>문의 및 안내전화</h2>
            <b>
               033-662-2900<br>
               <font style="font-size:20px;">051-337-2262</font>
            </b>
            <p>
               FAX.033-662-2905
               <br />
            </p>
         </div>

      </div>
   </div><!-- main_contents_04 F -->
   </div>
   <%@ include file="./footer.jsp"%>
</body>
</html>