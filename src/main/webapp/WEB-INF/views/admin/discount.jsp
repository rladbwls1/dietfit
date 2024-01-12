<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>discount</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
	<h2>오늘의 특가</h2>
	<div class="container">
	    <ul class="list-unstyled row">
	        <c:forEach var="discount" items="${discount}">
	            <li class="col-md-3">
	                <div><img style="width:200px; height:200px;" src="${discount.imagePath}"/></div>
	                <div>${discount.companyid}</div>
	                <div>${discount.boardname}</div>
	                <div style="text-decoration: line-through;">
	                	<fmt:formatNumber value="${discount.price}" type="number" pattern="#,###원"/>
	                </div>
	                <div>
	                	<fmt:formatNumber value="${discount.price - (discount.price * (discount.sale / 100))}" type="number" pattern="#,###원"/>
	                </div>	
	            </li>
	        </c:forEach>
	    </ul>
	</div>
</body>
</html>