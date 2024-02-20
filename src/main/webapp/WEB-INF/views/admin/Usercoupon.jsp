<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	#coupon{
		width: 100%;
		text-align: center;
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
    <a class="nav-link active" href="/admin/Usercoupon?id=${info.id}">쿠폰내역</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/admin/Userreview?id=${info.id}">리뷰목록</a>
  </li>
</ul>
<h4 id="title">쿠폰 승인</h4>
	<table id="coupon" border="1" style="border-collapse:collapse;">
		<tr>
			<th>no</th>
			<th>쿠폰명</th>
			<th>쿠폰 기간</th>
			<th>사용 여부</th>
		</tr>
		<c:forEach var="coupon" items="${coupon}">
			<tr>
				<td>${coupon.num}</td>
				<td>${coupon.coupon}</td>
				<td><fmt:formatDate value="${coupon.createdate}" pattern="yyyy-MM-dd"/> ~ 
					<fmt:formatDate value="${coupon.deletedate}" pattern="yyyy-MM-dd"/></td>
				<td>
				<c:if test="${coupon.status==0}">사용 안함</c:if>
				<c:if test="${coupon.status==1}">사용</c:if>
				<c:if test="${coupon.status==99}">기간 만료</c:if>
				</td>
			</tr>
		</c:forEach>	
	</table>	
	</div>
</body>
</html>