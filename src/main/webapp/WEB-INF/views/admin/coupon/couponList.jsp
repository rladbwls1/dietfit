<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</head>
<body>
	<c:if test="${couponcount == 0 }">
		<h5> 다운로드 가능 한 쿠폰이 없습니다.</h5>
	</c:if>
	<c:if test="${couponcount > 0 }">
		<h3> 쿠폰 다운로드</h3>
		<table class="table">
			<thead>
				<tr>
					<th>쿠폰명</th>
					<th>기간</th>
					<th>금액</th>
					<th>업체</th>
					<!-- <th>다운로드 가능</th> -->
					<th>할인률(%)</th>
					<!-- <th>적용 가능 제품</th> -->
					<th>최소구매금액</th>
					<th>다운로드 </th>
				</tr>
				
				<c:forEach var="coupon" items="${couponList}">
					<tr>
					<td>${coupon.coupon}</td>
					<td><fmt:formatDate value="${coupon.deletedate}" pattern="yyyy-MM-dd"/>까지</td>
					<td>${coupon.minprice}원 이상</td>
					<td>${coupon.companyid}</td>
					<!-- <td>${coupon.download}</td> -->
					<td>${coupon.discount}</td>
					<!--  <td>${coupon.boardnums}</td> -->
					<td>${coupon.onstatus}</td>
					<td>
						<c:if test="${!userList.contains(coupon.couponid) }">
						<form action="coupondownloadPro" method="post" >
							<input type="hidden" name="couponid" value="${coupon.couponid }"/>
							<input type="hidden" name="createdate" value=<fmt:formatDate value="${coupon.createdate}" pattern="yyyy-MM-dd"/> />
							<input type="hidden" name="deletedate" value=<fmt:formatDate value="${coupon.deletedate}" pattern="yyyy-MM-dd"/>/>
							<input type="hidden" name="coupon" value="${coupon.coupon }"/>
							<button class="btn btn-primary" type="submit">다운로드</button>
						</form>
						</c:if>
						<c:if test="${userList.contains(coupon.couponid) }">
							<mark>다운로드 완료</mark>
						</c:if>
					</td>
					</tr>
				</c:forEach>
			</thead>
		</table>
		<!-- 
		<button type="button" onclick="window.location.href='all'" >all로 가기 </button>
		<button type="button" onclick="window.location.href='myCoupon'" >내 쿠폰함 가기</button>
		 -->
		
	</c:if>
</body>
</html>