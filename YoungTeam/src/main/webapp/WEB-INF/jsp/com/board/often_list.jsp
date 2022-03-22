<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<form method="get" action="often_list">
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
					<span class="home"><a href="/">홈</a></span><span class="middle_n">커뮤니티</span><span>자주묻는질문</span>
				</div>
				<h1>자주묻는질문</h1>
			</div>
			<div class="page notice_list" id="bbs_container">
				<div id="bbs_top_wrap">
					  <p class="bbs_info_wrap">Total : ${listcount}</p>
					  <div class="bbs_search_area">
						  <fieldset>
							<legend>게시물 검색 폼</legend>
							<select name="find_field" id="bbs_sch_type">
								<option value="board_title"	<c:if test="${find_field=='board_title'}">${'selected'}</c:if>>제목</option>
								<option value="board_cont" <c:if test="${find_field=='board_cont'}">${'selected'}</c:if>>내용</option>
							</select>
							<input name="find_name" id="bbs_sch_word" size="14" value="${find_name}" />
							<input class="bbs_search_btn" type="image" src="/img/btn_search.gif">
						  </fieldset>
					  </div>
					</div>
					<div class="bbs_list">
					  <table class="list_table" summary="게시판 목록에 대해 번호, 제목, 작성자, 첨부, 작성일, 조회수 순으로 보실 수 있습니다.">
						<caption>
						자주묻는질문 목록
						</caption>
						<colgroup>
							<col width="9%">
							<col>
							<col width="15%">
							<col width="14%">
							<col width="9%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col" class="lc01">게시번호</th>
								<th scope="col" class="lc02">제목</th>
								<th scope="col" class="lc03">작성자</th>
								<th scope="col" class="lc05">작성일</th>
								<th scope="col" class="lc06">조회</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${!empty blist}">
								<c:forEach var="b" items="${blist}">
									<tr class="notice">
										<td class="lc01"><img src="/img/ico_notice.gif">${b.board_no}</td>
										<td class="lc03"><a href="/board_cont?no=${b.board_no}&page=${page}&state=cont">${b.board_title}</a></td>
										<td class="lc04">${b.board_name}</td>
										<td class="lc05">${b.board_date}</td>
										<td class="lc06">${b.board_hit}</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty blist}">
								<tr>
									<th colspan="5">목록이 없습니다!</th>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
				<div class="bbs_bottom_wrap">
					<div class="pageing_area">
						<div class="pageing">
							<c:if test="${(empty find_field) && (empty find_name)}">
								<c:if test="${page<=1}"><a href="">&lt;</a></c:if>
								<c:if test="${page>1}"><a href="often_list?page=${page-1}">&lt;</a></c:if>
								<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
									<c:if test="${a == page}"><strong><a>${a}</a></strong></c:if>
									<c:if test="${a != page}"><a href="often_list?page=${a}">${a}</a></c:if>
								</c:forEach>
								<c:if test="${page >= maxpage}"><a href="">&gt;</a></c:if>
								<c:if test="${page<maxpage}"><a href="often_list?page=${page+1}">&gt;</a></c:if>
							</c:if>
							<c:if test="${(!empty find_field) || (!empty find_name)}">
								<c:if test="${page<=1}"><a href="">&lt;</a></c:if>
								<c:if test="${page>1}"><a href="often_list?page=${page-1}&find_field=${find_field}&find_name=${find_name}">&lt;</a>&nbsp;</c:if>
								<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
									<c:if test="${a == page}"><strong><a>${a}</a></strong></c:if>
									<c:if test="${a != page}"><a href="often_list?page=${a}&find_field=${find_field}&find_name=${find_name}">${a}</a></c:if>
								</c:forEach>
								<c:if test="${page >= maxpage}"><a href="">&gt;</a></c:if>
								<c:if test="${page<maxpage}"><a href="often_list?page=${page+1}&find_field=${find_field}&find_name=${find_name}">&gt;</a></c:if>
							</c:if>
						</div>
					</div>
					<c:if test="${auth=='admin'}">
						<div class="bbs_btn_area">
							<p class="bt_right"><a href="/often_write" class="bt_write">글쓰기</a></p>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>
</form>
	<%@ include file="../main/footer.jsp"%>
</body>
</html>