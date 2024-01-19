<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>식단</title>
</head>
<body>
	<h2>식단 짜주기</h2>
	<form action="/admin/foodPro" method="post">
		<input type="text" name="kcal"/>
		<button type="submit">전송</button>
	</form>
</body>
</html>
