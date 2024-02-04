<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>best2 product</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
	<h2>베스트 상품 > 주간</h2>
	<c:if test="${not empty best}">
	<div class="container">
	    <ul class="list-unstyled row">
	        <c:forEach var="best" items="${best}">
	            <li class="col-md-3">
	                <div><img style="width:200px; height:200px;" src="${best.imagePath}"/></div>
	                <div>${best.companyid}</div>
	                <div>${best.boardname}</div>
	            </li>
	        </c:forEach>
	    </ul>
	</div>
	</c:if>
	<c:if test="${empty best}">
		<h2>베스트 상품이 존재하지 않습니다</h2>
	</c:if>
</body>
</html>