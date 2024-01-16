<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>best product</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
	<h2>베스트 상품 > 월간</h2>
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
</body>
</html>