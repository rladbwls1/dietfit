<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>best product</title>
</head>
<body>
	<h2>베스트 상품 > 누적</h2>
	<c:forEach var="best" items="${best}">
		${best.productid}
	</c:forEach>
</body>
</html>