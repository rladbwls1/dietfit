<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/js/jquery-3.7.1.min.js"></script> 
</head>
<script>
	function adminCheck(num, check){
		$.ajax({
			url: "/admin/adminChk"
			data: {num: num,
					check: check},
			success: function(chk){
				console.log(chk);
			}
		});
	}
</script>
<body>
	<table border="1" style="border-collapse:collapse;">
		<tr>
			<th>no</th>
			<th>광고명</th>
			<th>회사 아이디</th>
			<th>광고 이미지</th>
			<th>광고 시작날짜</th>
			<th>광고 종료날짜</th>
			<th>승인 여부</th>
		</tr>
		<c:forEach var="comm" items="${commlist}">
			<tr>
				<td>${comm.num}</td>
				<td>${comm.comname}</td>
				<td>${comm.companyid}</td>
				<td><fmt:formatDate value="${comm.startdate}" pattern="yyyy-MM-dd"/></td> 
				<td><fmt:formatDate value="${comm.enddate}" pattern="yyyy-MM-dd"/></td>
				<td><img src="/resources/comimg/${comm.comfile}"/></td>
				<td>
					<button type="button" id="${coupon.couponid}1" onclick="adminCheck('${comm.num}',1);">승인</button>
					<button type="button" id="${coupon.couponid}2" onclick="adminChk('${comm.num}',2);">거부</button>
				</td>
			</tr>
		</c:forEach>	
	</table>	
</body>
</html>