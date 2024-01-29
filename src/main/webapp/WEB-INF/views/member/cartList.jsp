<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="/resources/js/member2.js"></script>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
<h1>장바구니</h1>
<br/><button type="button" onclick="javascript:window.location='/member/all'">all로 가기 </button>
<br/><button type="button" onclick="javascript:window.location='/member/wishList'">관심상품</button>
<br/><button type="button" onclick="javascript:window.location='/member/productList'">상품목록</button>
<br/>
<table>
<tr>
	<td>이미지</td><td>상품명</td><td>수량</td><td>가격</td><td></td>
</tr>
<c:set var="i" value="0"/>
<c:set var="amout" value="0" />
<c:forEach var="cart" items="${list }" >
<tr>
	<td>
		<img src="${imgPaths[i]}" width="50"/>	
	</td>
	<td>
		${cart.product }
	</td>
	<td>
		<button type="button" onclick="cartQuantityDown('${cart.num}','${cart.quantity }')">-</button> 
		${cart.quantity }
		<button type="button" onclick="cartQuantityUp('${cart.num}','${cart.quantity }')">+</button>
	</td>
	<td>
		${cart.price*cart.quantity }
	</td>
	<td><a href="javascript:void(0);" onclick="deleteCart('${cart.num}')" ><img src="/resources/img/free-icon-x-mark-11147352.png" width=15 /></a> </td>
</tr>
<c:set var="i" value="${i+1 }"/>
<c:set var="amout" value="${amout+cart.price*cart.quantity }" />
</c:forEach>
<tr><td colspan="4">총 가격 : ${amout }</td></tr>
</table>
</body>
</html>