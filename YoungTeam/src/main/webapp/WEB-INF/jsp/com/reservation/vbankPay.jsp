<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/main.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link href="/css/sub.css" rel="stylesheet">
<link href="/css/board.css" rel="stylesheet">
<style type="text/css">
#confirm {
    display: inline-block;
    background: #f68b1e;
    color: #fff;
    padding: 10px 20px;
}
</style>

<%
String name = request.getParameter("resName");
int price = Integer.parseInt(request.getParameter("price"));
%>

</head>

<body>
<%@ include file="../main/header.jsp"%>
입금자명 : <%=name %> <br>
입금할 금액 : <%=price %><br>
입금할 은행 : 농협 <br>
계좌번호 : 1111111111111
	<div onclick="location='/confirm'" id="confirm">예약확인</div>

<%@ include file="../main/footer.jsp"%>


</body>
</html>