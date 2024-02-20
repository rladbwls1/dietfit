<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/resources/js/member2.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<c:set var="a" value="${pmap.PRICE*100 }"/>
<c:set var="b" value="${pmap.PRICE*pmap.SALE }"/>
<c:set var="c" value="${a-b}"/>
<c:set var="d" value="${c/100}"/>
<input type="hidden" id="price" value="${d}" />
상품: <select name="chooseProductCart" id="chooseProductCart" onchange="showQuantityDiv()">
    <option value="${pmap.PRODUCT}">${pmap.PRODUCT}</option>
</select> <br/>
수량: <button type="button" onclick="quantityDown()">-</button>
<input type="text" id="quantity" value=1 size=3 maxlength=3 
oninput="quatityChange()" 
onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
<button type="button" onclick="quantityUp()">+</button>
<br/>
<br/>
<br/>
-----------얘넨 지우면 됨--------<br/>
할인전 가격: ${pmap.PRICE }<br/>
할인%: ${pmap.SALE } <br/>
-----------얘넨 지우면 됨--------<br/>
<br/>
<br/>
가격 <span id="amout">${d}</span> <br/>
<button type="button" onclick="addCartAndOrder()">즉시구매</button>
<input type="checkbox" id="chk">정기배송으로 받아보시겠어요?
<button type="button" onclick="addCartFromList()">장바구니</button>

</body>
</html>