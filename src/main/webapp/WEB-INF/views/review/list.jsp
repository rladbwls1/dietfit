<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
	<head>
	
	</head>
		<form action="write" method="post">
			<button type="submit">글쓰기</button>
		</form>
	<body>
		<table>
			<c:forEach var="list" items="${list}">
			<tr>
				<td>${list.num }</td>
				<td>${list.writer }</td>
				<td>상품</td>
				<td>${list.content }</td>
				<td>${list.starscore }</td>
				<td>${list.recommend }</td>
			</tr>
			</c:forEach>
		</table>
	</body>
</html>