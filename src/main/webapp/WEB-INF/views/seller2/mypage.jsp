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
<br>
<form action="/seller/modify" method="post">
    <input type="submit" value="정보수정"/>
</form>
<br>
<form action="/seller/productdiscount" method="post">
    <input type="submit" value="상품할인율조정"/>
</form>
<form action="/seller/coupon/request" method="post">
    <input type="submit" value="쿠폰요청"/>
</form>
<br>
<form action="/seller/sellerchatlist" method="post">
    <input type="submit" value="상품문의 목록"/>
</form>
<br>
<form action="/seller/orderhome" method="post">
    <input type="submit" value="상품주문 목록"/>
</form>
<br>
<form action="/seller/store/home" method="post">
    <input type="submit" value="상품 목록"/>
</form>
<br>
<form action="/seller/calculatehome" method="post">
    <input type="submit" value="정산"/>
</form>
<br>
<form action="/seller/Advertising" method="post">
    <input type="submit" value="광고 신청"/>
</form>
</body>
</html>