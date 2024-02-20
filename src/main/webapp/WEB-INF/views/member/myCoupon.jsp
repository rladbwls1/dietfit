<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 쿠폰</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</head>
<body>
<c:if test="${empty list }">
<h3>쿠폰이 없습니다.</h3>
</c:if>
<c:if test="${!empty list }">
<h3>쿠폰함</h3>
<table class="table">
	<thead>
		<tr>
			<th>쿠폰 이름</th>
			<th>쿠폰 기간</th>
		</tr>
	</thead>
	<c:forEach var="coupon" items="${list }">
		<tr>
			<td>${coupon.coupon }</td> 
			<td><fmt:formatDate value="${coupon.createdate }" pattern="yyyy-MM-dd"/>~<fmt:formatDate value="${coupon.deletedate }" pattern="yyyy-MM-dd"/></td>
		</tr>
	</c:forEach>
</table>
</c:if>
</body>
</html>