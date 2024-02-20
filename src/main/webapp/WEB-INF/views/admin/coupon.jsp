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
<style>
	#content{
		padding: 0 15px;
	}
	#user{
		background-color: #007bff;
		color: white;
		padding: 5px 0 5px 10px;
		margin: 0 0 20px 0;
	}
	#coupon th, #coupon td{
		border: 1px solid lightgray;
		padding: 5px;
	}
	#title{
		margin: 10px 0;
	}
	.btn1{
		padding: 3px 12px;
   		border: 1px solid #007bff;
   		border-radius: 5px;
   		background-color: #007bff;
   		color: white;
	}
	.btn2{
		padding: 3px 12px;
   		border: 1px solid gray;
   		border-radius: 5px;
   		background-color: white;
   		color: gray;
	}
</style>
</head>
<body>
	<div id="user">${info.id}(${info.name}) 님의 회원정보입니다.</div>
	<div id="content">
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link" aria-current="page" href="/admin/management?id=${info.id}">회원정보</a>
  </li>
	  <li class="nav-item">
	    <a class="nav-link active" href="/admin/coupon?id=${info.id}">쿠폰요청</a>
	  </li>
</ul>
<h4 id="title">쿠폰 승인</h4>
	<table id="coupon" border="1" style="border-collapse:collapse;">
		<tr>
			<th>쿠폰명</th>
			<th>쿠폰 아이디</th>
			<th>쿠폰 기간</th>
			<th>최소 사용 금액</th>
			<th>업체</th>
			<th>다운로드 가능</th>
			<th>발급 인원수</th>
			<th>적용 가능 제품</th>
			<th>승인 여부</th>
		</tr>
		<c:forEach var="coupon" items="${coupon}">
			<tr>
				<td>${coupon.coupon}</td>
				<td>${coupon.couponid}</td>
				<td><fmt:formatDate value="${coupon.createdate}" pattern="yyyy-MM-dd"/> ~ 
					<fmt:formatDate value="${coupon.deletedate}" pattern="yyyy-MM-dd"/></td>
				<td>${coupon.minprice}</td>
				<td>${coupon.companyid}</td>
				<td>${coupon.download}</td>
				<td>${coupon.discount}</td>
				<td>${coupon.boardnums}</td>
				<td>
					<div id="${coupon.couponid}">
						<c:if test="${coupon.admincheck==1}">승인 완료</c:if>		
						<c:if test="${coupon.admincheck==2}">승인 거부</c:if>		
					</div>
					<c:if test="${coupon.admincheck==0}">
						<button type="button" class="btn1" id="${coupon.couponid}1" onclick="adminCheck('${coupon.couponid}');">승인</button>
						<button type="button" class="btn2" id="${coupon.couponid}2" onclick="adminChk('${coupon.couponid}');">거부</button>
					</c:if>
				</td>
			</tr>
		</c:forEach>	
	</table>	
	</div>
</body>
</html>