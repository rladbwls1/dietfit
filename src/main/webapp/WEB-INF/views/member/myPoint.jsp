<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 적립금</title>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
	<c:if test="${empty list }">
	적립 내역이 없습니다.
	</c:if>
	
	<c:if test="${!empty list }">
		<table>
			<thead>
				<tr>
					<th>날짜</th>
					<th><mark>보유 포인트:</mark></th>
					<th><mark>${myPoint } point</mark></th>
				</tr>
			</thead>
			<c:forEach var="dto" items="${list }">
				<c:if test="${dto.opt==0 }">
					<tr>
						<td>
							<fmt:formatDate value="${dto.createdate }" pattern="yyyy-MM-dd"/>
						</td>
						<td>구매확정 적립금</td>
						<td>
							<p style="color:green;">+${dto.change }</p>
						</td>
					</tr>
				</c:if>
				<c:if test="${dto.opt!=0 }">
					<tr>
						<td>
							<fmt:formatDate value="${dto.deletedate }" pattern="yyyy-MM-dd" />
						</td>
						<td>적립금 사용</td>
						<td>
							<p style="color:red;">-${dto.change }</p>
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>