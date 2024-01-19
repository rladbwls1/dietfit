<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>식단 짜주기 페이지</h2>
	<div>
	<c:forEach var="food" items="${list0}">
	    아침${food.productid}
	</c:forEach>
	</div>
	<div>
	<c:forEach var="food" items="${list1}">
	    점심${food.productid}
	</c:forEach>
	</div>
	<div>
	<c:forEach var="food" items="${list2}">
	    저녁${food.productid}
	</c:forEach>
	</div>
	<div>
		점심 ${rmeal.productid}
		칼로리 ${rmeal.kcal}
	</div>
	</body>
</html>