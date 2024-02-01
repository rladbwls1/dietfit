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

<c:if test="${empty list }">
	장바구니가 비었습니다.
</c:if>

<c:if test="${!empty list }">
<table>
<tr>
	<td><input type="checkbox" name="chk_all" id="chk_all" onclick="cartCheckAll()" value="all"/></td>
	<td>이미지</td><td>상품명</td><td>수량</td><td>가격</td><td></td>
</tr>
<c:set var="i" value="0"/>
<c:forEach var="cart" items="${list }" >
<tr id="${cart.num }" >
	<td><input type="checkbox" name="num" id="num" onclick="cartUpdateCheckAll()" value="${cart.num }"></td>
	<td>
		<a href="javascript:void(0)" style="text-decoration-line : none; color:black;" 
		onclick="getProductCodeANDtoDetail('${cart.product}')"><img src="${imgPaths[i]}" width="50"/></a>	
	</td>
	<td>
		<a href="javascript:void(0)" style="text-decoration-line : none; color:black;" 
		onclick="getProductCodeANDtoDetail('${cart.product}')">${cart.product }</a>
	</td>
	<td>
		<button type="button" onclick="cartQuantityDown('${cart.num}')">-</button> 
		<span id="${cart.num }_quantity" >${cart.quantity }</span>
		<button type="button" onclick="cartQuantityUp('${cart.num}')">+</button>
	</td>
	<td>
		<span id="${cart.num }_price" >${cart.price*cart.quantity }</span>
	</td>
	<td><a href="javascript:void(0);" onclick="deleteCart('${cart.num}')" ><img src="/resources/img/free-icon-x-mark-11147352.png" width=15 /></a> </td>
</tr>
<c:set var="i" value="${i+1 }"/>

</c:forEach>
<tr><td></td> 
<td colspan="1">총 상품 : <span id="totalQuantity"> 0</span></td>
<td colspan="1">총 가격 : <span id="amout">0</span></td>
<td colspan="2"><button type="button" onclick="toOrder()">주문하기</button></td></tr>
</table>
</c:if>
</body>
</html>