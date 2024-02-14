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
상품명, boardname <br/>
<input type="hidden" id="price" value="${price}" />
<select name="chooseProductCart" id="chooseProductCart" onchange="showQuantityDiv()">
    <c:forEach var="productdto" items="${list }">
    	<option value="${productdto.product}">${productdto.product}</option>
    </c:forEach>
</select> <br/>
<button type="button" onclick="quantityDown()">-</button>
<input type="text" id="quantity" value=1 size=3 maxlength=3 onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
<button type="button" onclick="quantityUp()">+</button>
<br/>
<br/>
<br/>
가격 <span id="amout">${price }</span> <br/>
<button type="button" onclick="">즉시구매</button>
<input type="checkbox" id="chk">정기배송으로 받아보시겠어요?
<button type="button" onclick="addCartFromList()">장바구니</button>

</body>
</html>