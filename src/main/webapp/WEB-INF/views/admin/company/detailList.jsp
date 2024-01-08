<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dietfit - company</title>
</head>
<body>
	<h5>${companyDetail.id}님 상세보기</h5>
	<table>
		<tr>      
			<td><b>번호</b></td>
			<td><b>회사주소</b></td>
			<td><b>회사ID</b></td>
			<td><b>회사명</b></td>
			<td><b>사업자번호</b></td>
		</tr>      
		<tr>
			<td>${companyDetail.phone}</td>
			<td>${companyDetail.addr1}, ${companyDetail.addr2}</td>
			<td>${companyDetail.companyid}</td>
			<td>${companyDetail.company}</td>
			<td>${companyDetail.businessnum}</td>
		</tr>
	</table>
</body>
</html>