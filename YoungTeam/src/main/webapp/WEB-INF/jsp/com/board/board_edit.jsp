<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>솔향기캠핑장</title>
<link href="/css/main.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link href="/css/board.css" rel="stylesheet">
<link href="/css/sub.css" rel="stylesheet">
<script src="/resources/static/js/board/board.js"></script>
<script src="/resources/static/js/board/jquery.js"></script>
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
<div id="sub_contents">
	<div id="title_container">
		<div class="page_navi">
			<span class="home"><a href="/">홈</a></span><span class="middle_n">커뮤니티</span>
			<c:if test="${type eq 'A'}"><span>공지사항</span></c:if>
			<c:if test="${type eq 'B'}"><span>자주하는질문</span></c:if>
			<c:if test="${type eq 'C'}"><span>Q&amp;A</span></c:if>
			
		</div>
		<c:if test="${type eq 'A'}"><h1>공지사항 작성</h1></c:if>
		<c:if test="${type eq 'B'}"><h1>자주하는질문 작성</h1></c:if>
		<c:if test="${type eq 'C'}"><h1>Q&amp;A 작성</h1></c:if>
	</div>
	<div class="page" id="bbs_container">
	<form method="post" action="/board/edit" accept-charset="UTF-8" class="form form-horizontal" name="board_edit_ok" id="board_edit_ok" onsubmit="return bw_check();">
	<input type="hidden" name="board_no" value="${b.board_no}" />
	<input type="hidden" name="page" value="${page}" />
		<div class="bbs_write">
  			<fieldset>
    			<table summary="게시판 쓰기에 대해 제목, 작성자, 이메일, 비밀번호, 내용, 첨부 순으로 작성하실 수 있습니다.">
					<caption>게시판 쓰기</caption>
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>
      				<tbody>
        				<tr>
							<th scope="row"><label for="board_title">제목</label></th>
							<td><input name="board_title" title="제목을 입력하세요." id="board_title" type="text" size="80" value="${b.board_title}" class="table_hundred">
							</td>
				        </tr>
						<tr>
							<th scope="row"><label for="board_name">작성자</label></th>
							<td><input name="board_name" title="이름을 입력하세요." id="board_name" type="text" size="80" value="${b.board_name}" class="table_hundred">
						</tr>
						<tr>
							<th scope="row"><label for="board_cont">내용</label></th>
							<td>
								<div class="col-md-10">
									<textarea class="form-control hide" placeholder="내용" id="board_cont" name="board_cont" rows="12" style="width:650px;">${b.board_cont}</textarea>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</fieldset>
		</div>
		<div class="bbs_bottom_wrap">
			<div class="bbs_btn_area">
				<p class="bt_right">
					<button type="submit" class="bt_write">저장</button>
					<c:if test="${type eq 'A'}"><button type="reset" class="bt_write" onclick="location='/board/news?page=${page}';">취소</button></c:if>
					<c:if test="${type eq 'B'}"><button type="reset" class="bt_write" onclick="location='/board/often?page=${page}';">취소</button></c:if>
					<c:if test="${type eq 'C'}"><button type="reset" class="bt_write" onclick="location='/board/qna?page=${page}';">취소</button></c:if>
	    			
			    </p>
			</div>
		</div>
	</form>
	</div>
</div>
</div>
</div>
<%@ include file="../main/footer.jsp"%>
</body>
</html>