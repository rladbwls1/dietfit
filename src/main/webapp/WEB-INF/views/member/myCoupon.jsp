<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 쿠폰</title>
</head>
<body>
<c:if test="${empty list }">
<h3>쿠폰이 없습니다.</h3>
</c:if>
<c:if test="${!empty list }">
<table border="1">
<tr><td>쿠폰 이름</td><td>쿠폰 기간</td></tr>
<c:forEach var="coupon" items="${list }">
<tr><td>${coupon.coupon }</td> <td><fmt:formatDate value="${coupon.createdate }" pattern="yyyy-MM-dd"/>~<fmt:formatDate value="${coupon.deletedate }" pattern="yyyy-MM-dd"/></td></tr>
</c:forEach>
</table>
</c:if>
<button type="button" onclick="window.location.href='all'" >all로 가기 </button>
</body>
</html>