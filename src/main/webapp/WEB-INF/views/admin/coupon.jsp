<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 요청</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</head>
<body>
	<div>${info.id}(${info.name}) 님의 회원정보입니다.</div>
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link" aria-current="page" href="/admin/management?id=${info.id}">회원정보</a>
  </li>
	  <li class="nav-item">
	    <a class="nav-link active" href="/admin/coupon?id=${info.id}">쿠폰요청</a>
	  </li>
</ul>
<h2>쿠폰 승인</h2>
	<table border="1" style="border-collapse:collapse;">
		<tr>
			<th>아이디</th>
			<td>${info.id}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${info.name}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${info.email}</td>
		</tr>
		<tr>
			<th>등급</th>
			<td>
				<c:if test="${info.status==1}">new</c:if>
				<c:if test="${info.status==2}">bronze</c:if>
				<c:if test="${info.status==3}">silver</c:if>
				<c:if test="${info.status==4}">gold</c:if>
				<c:if test="${info.status==0}">정지회원</c:if>
				<c:if test="${info.status==99}">탈퇴회원</c:if>
				<c:if test="${info.status==888}">판매자</c:if>
				<c:if test="${info.status==999}">관리자</c:if>
			</td>
		</tr>
		<tr>
			<th>가입날짜</th>
			<td><fmt:formatDate value="${info.reg}" pattern="yyyy-MM-dd HH:ss"/></td>
		</tr>
	</table>
</body>
</body>
</html>