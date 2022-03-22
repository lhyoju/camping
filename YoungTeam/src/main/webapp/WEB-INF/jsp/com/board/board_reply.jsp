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
<script type="text/javascript" src="/js/board/board.js"></script>
<script type="text/javascript" src="/js/board/jquery.js"></script>
</head>
<body>
<%@ include file="../main/header.jsp"%>
<div id="sub_contents">
	<div id="title_container">
		<div class="page_navi">
			<span class="home"><a href="/">홈</a></span><span class="middle_n">커뮤니티</span><span>Q&A 답변작성</span>
		</div>
		<h1>Q&A 답변작성</h1>
	</div>
	<div class="page" id="bbs_container">
	<form method="post" action="board_reply_ok" accept-charset="UTF-8" class="form form-horizontal" name="board_reply_ok" id="board_reply_ok" onsubmit="return bw_check();">
	<input type="hidden" name="board_ref" value="${b.board_ref}" />
	<input type="hidden" name="board_step" value="${b.board_step}" />
	<input type="hidden" name="board_level" value="${b.board_level}" />
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
							<td><input name="board_name" title="이름을 입력하세요." id="board_name" type="text" size="80" value="관리자" class="table_hundred">
						</tr>
						<tr>
							<th scope="row"><label for="board_cont">내용</label></th>
							<td>
								<div class="col-md-10">
									<textarea class="form-control hide" placeholder="내용" id="board_cont" name="board_cont" rows="12" style="width:650px;">
										&#10;${b.board_cont}&#10;&#10;&#10;----------------------------------------------------------------------------&#10;&#10;&#10;
									</textarea>
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
					<button type="submit" class="bt_write" onclick="javascript:bw_check();">저장</button>
	    			<button type="reset" class="bt_write" onclick="location='qna_list?page=${page}';">취소</button>
			    </p>
			</div>
		</div>
		<!-- <input type="hidden" name="user_id" value="admin"> -->
	</form>
	</div>
</div>
<%@ include file="../main/footer.jsp"%>
</body>
</html>