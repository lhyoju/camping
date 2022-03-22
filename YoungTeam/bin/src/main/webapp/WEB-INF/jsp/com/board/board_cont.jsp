<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>솔향기캠핑장</title>
<link href="/css/main.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link href="/css/board.css" rel="stylesheet">
<link href="/css/sub.css" rel="stylesheet">
</head>
<body>
<%@ include file="../main/header.jsp"%>
<div id="sub_visual">
	<div class="sub_visual4">
		<div class="sub_vis_inr wrap">
			<h1>커뮤니티</h1>
			<p>솔향기캠핑장에 오신것을 환영합니다.</p>
		</div>
	</div>
</div>
<div id="sub_container">
	<div id="location"></div>
	<div id="sub_con_inner" class="wrap">
		<div id="sidebar" class="pc">
			<div class="submenu_title">
				<h2><span>COMMUNITY</span>커뮤니티</h2>
			</div>
		</div>
		<div id="sub_contents">
			<div id="title_container">
				<!-- 캠핑장 안내 -->
				<div class="page_navi">
					<span class="home"><a href="/">홈</a></span><span class="middle_n">커뮤니티</span><span>게시판</span>
				</div>
				<h1>게시판</h1>
			</div>
			<div class="page" id="bbs_container">
				<div class="bbs_read">
	  				<h4><span>title</span></h4>
	  				<table summary="게시판 읽기에 대해 작성일, 조회, 첨부, 내용 순으로 보실 수 있습니다.">
						<caption>게시판 읽기</caption>
						<colgroup>
							<col width="15%">
							<col width="35%">
							<col width="15%">
							<col width="35%">
						</colgroup>
						<thead>
			  				<tr>
								<th scope="col">제목</th>
								<td colspan="3">${b.board_title}</td>
			  				</tr>
							<tr>
								<th scope="col">작성일</th>
								<td>${b.board_date}</td>
								<th scope="col">조회</th>
								<td>${b.board_hit}</td>
							</tr>
			  				<tr>
								<th scope="col">작성자</th>
								<td colspan="3">${b.board_name}</td>
			  				</tr>
						</thead>
						<tbody>
		  					<tr>
								<td colspan="4" class="bbscon"><span>${b.board_cont}</span></td>
		 					</tr>
						</tbody>
	  				</table>
				</div>
	    		<input type="hidden" name="board_no" value="${b.board_no}" />
			    <input type="hidden" name="page" value="${page}" />
			    <input type="hidden" name="board_type" value="${type}" />
				<div class="bbs_bottom_wrap">
					<div class="bbs_btn_area">
	  					<p class="bt_left">
	  						<c:if test="${type=='A'}"><a href="/board_list">글목록</a></c:if>
	  						<c:if test="${type=='B'}"><a href="/often_list">글목록</a></c:if>
	  						<c:if test="${type=='C'}"><a href="/qna_list">글목록</a></c:if>
	  					</p>
	  					<p class="bt_right">
		  					<c:if test="${auth=='admin'}">
			  					<c:if test="${type=='C'}">
			  						<button type="button" class="bt_write" onclick="location='board_cont?no=${b.board_no}&page=${page}&state=reply';">답변</button>
			  					</c:if>
		  					</c:if>
	  						<c:if test="${auth=='admin'}">
		  						<button type="button" class="bt_write" onclick="location='board_cont?no=${b.board_no}&page=${page}&state=edit';">수정</button>
		  					</c:if>
		  					<c:if test="${auth=='admin'}">
			  					<c:if test="${type=='A'}">
			  						<button type="button" class="bt_write" onclick="location='board_cont?no=${b.board_no}&page=${page}&state=delA';">삭제</button>
			  					</c:if>
			  					<c:if test="${type=='B'}">
			  						<button type="button" class="bt_write" onclick="location='board_cont?no=${b.board_no}&page=${page}&state=delB';">삭제</button>
								</c:if>
								<c:if test="${type=='C'}">
			  						<button type="button" class="bt_write" onclick="location='board_cont?no=${b.board_no}&page=${page}&state=delC';">삭제</button>
			  					</c:if>
							</c:if>
							<c:if test="${type=='C'}">
								<c:if test="${userid==b.board_name}">
		  							<button type="button" class="bt_write" onclick="location='board_cont?no=${b.board_no}&page=${page}&state=delC';">삭제</button>
		  							<button type="button" class="bt_write" onclick="location='board_cont?no=${b.board_no}&page=${page}&state=edit';">수정</button>
		  						</c:if>
		  					</c:if>
		  				</p>
					</div>
				</div>
			</div>		
		</div>
	</div>
</div>
</body>
</html>