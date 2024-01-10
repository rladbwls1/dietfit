<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>all_coupon</title>
<script src="/resources/js/jquery-3.7.1.min.js"></script> 
</head>
<script>
	//setInterval(alram, 10000);
	function adminCheck(couponId) {
		$.ajax({
			url: "/admin/adminCheck",
			data: {couponId: couponId},
			success: function(chk){
				console.log(chk);
				if(chk.result == '1'){
					$("#"+couponId).text('승인 완료');
					$("#alram").text(chk.msg);
					$("#" + couponId + "1").hide();
	                $("#" + couponId + "2").hide();
				}
			}
		});
		}
	function adminChk(couponId){
		$.ajax({
			url: "/admin/adminCheck2",
			data: {couponId: couponId},
			success: function(e){
				if(e == '1'){
					$("#"+couponId).text('승인 거부');
					$("#" + couponId + "1").hide();
	                $("#" + couponId + "2").hide();
				}
			}
		});
       	$("#"+couponId+"1").prop("disabled", true);
       	$("#"+couponId).text('승인 거부');
	}
</script>
<body>
	<h2>전체 쿠폰</h2>
	<h2>쿠폰 요청<i id="alram">(${alram})</i></h2>
	<h4>총 ${count} 쿠폰</h4>
	<table border="1" style="border-collapse:collapse;">
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
		<c:forEach var="coupon" items="${couponlist}">
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
						<button type="button" id="${coupon.couponid}1" onclick="adminCheck('${coupon.couponid}');">승인</button>
						<button type="button" id="${coupon.couponid}2" onclick="adminChk('${coupon.couponid}');">거부</button>
					</c:if>
				</td>
			</tr>
		</c:forEach>	
	</table>	
		<c:if test="${count > 0}">
			<c:if test="${startPage > 10}">
			<a href="/admin/allcoupon?pageNum=${startPage-10}">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="/admin/allcoupon?pageNum=${i}">[${i}]</a>			
			</c:forEach>
			<c:if test="${endPage > pageCount}">
			<a href="/admin/allcoupon?pageNum=${startPage+10}">[다음]</a>
			</c:if>
		</c:if>
</body>
</html>