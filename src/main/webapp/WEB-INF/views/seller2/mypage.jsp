<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seller mypage</title>
</head>
<body>
<h1>seller mypage</h1>
<form action="/seller/modify" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <input type="submit" value="정보수정"/>
</form>
<form action="/seller/productdiscount" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <input type="submit" value="상품할인율조정"/>
</form>
</body>
</html>