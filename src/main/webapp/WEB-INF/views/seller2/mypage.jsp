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
<p>${id}님 환영합니다.</p>
<form action="/seller/modify" method="post">
    <input type="submit" value="정보수정"/>
</form>
<form action="/seller/productdiscount" method="post">
    <input type="submit" value="상품할인율조정"/>
</form>
<form action="/seller/sellerchatlist" method="post">
    <input type="submit" value="상품문의 목록"/>
</form>
</body>
</html>