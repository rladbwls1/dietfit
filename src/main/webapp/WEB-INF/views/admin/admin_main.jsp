<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>
	<h2>일단은 main</h2>
	<div style="display: flex;">
		<button onclick="window.location.href='/admin/best'">BEST 상품</button>
		<button onclick="window.location.href='/admin/discount'">오늘의 특가</button>
		<button onclick="window.location.href='/admin/product'">상품 추천</button>
		<button onclick="window.location.href='/admin/food'">식단 설문</button>
	</div>
	<hr>
	<div style="display: flex;">
		<button onclick="window.location.href='/admin/mList'">회원 목록</button>
		<button onclick="window.location.href='/admin/allcoupon'">쿠폰 요청</button>
	</div>
</body>
</html>