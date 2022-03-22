<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>test</title>

</head>

<body>

	<c:forEach var="item" items="${list}">
	${item.resId}<br>
	${item.resDay }<br>
	${item.startDay} <br>
	${item.endDay} <br>
	${item.price} <br>
	${item.sitenum}<br>
	${item.siteStatus} <br>
	${item.userid} <br>
	${item.resname} <br>
	${item.phone} <br>
	${item.carnum}<br>
	${item.carkinds} <br>
	${item.paymethod}<br>
	${item.paystatus}<hr>
	</c:forEach>

</body>
</html>