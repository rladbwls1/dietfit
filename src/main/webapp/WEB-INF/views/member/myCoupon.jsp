<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 쿠폰</title>
</head>
<body>
<c:forEach var="coupon" items="${list }">
쿠폰 이름: ${coupon.coupon } <br/>
쿠폰 생성날짜: ${coupon.createdate } <br/>
쿠폰 만료날짜: ${coupon.deletedate } <br/>
쿠폰 사용여부: ${coupon.status } <br/>
<br/>
</c:forEach>
<button type="button" onclick="window.location.href='all'" >all로 가기 </button>
</body>
</html>