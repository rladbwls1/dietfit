<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/resources/js/member2.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<title>Insert title here</title>
<style>
	#chooseProductCart{
	    margin: 10px 0;
	    width: 100%;
	    height: 40px;
	}
	body{
		width: 90%;
		margin: 0 auto;
		
	}
	h2{
		color: #50AB89; 
	}
	#cart_bg{
		background-color: rgba(0,0,0,.03);
	    width: 100%;
	    padding: 7px;
	}
	#button{
		display: flex;
		margin-top: 10px;
	}
	#button button{
		border: 1px solid lightgray;
    	width: 32px;
    	height: 32px;
	}
	#total_price{
		margin-top: 10px;
		color: #f27370;
		font-size: 18px;
		font-weight: 600;
	}
	hr{
		border: 1px solid #f27370;
	}
	#buy{
		display: flex;
		width: 100%;
	}
	#btn1, #btn2{
		margin-top: 10px;
		width: 100%;
	}
	#btn1{
		color: white; 
		background-color: #50AB89;
		border: 1px solid #50AB89; 
		padding: 5px 10px;
	}
	#btn2{
		padding: 7px 15px;
		color: #50AB89; 
		background-color: white;
		border: 1px solid #50AB89; 
		margin-left: 8px;
	}
	#amout{
		text-align: right;
		margin-bottom: 15px;
		font-size: 20px;
		font-weight: 600;
	}
</style>
</head>
<body>

<c:set var="a" value="${pmap.PRICE*100 }"/>
<c:set var="b" value="${pmap.PRICE*pmap.SALE }"/>
<c:set var="c" value="${a-b}"/>
<c:set var="d" value="${c/100}"/>
<input type="hidden" id="price" value="${d}" />
<h2>장바구니</h2>
<select name="chooseProductCart" id="chooseProductCart" onchange="showQuantityDiv()">
    <option value="${pmap.PRODUCT}">${pmap.PRODUCT}</option>
</select> <br/>
<div id="cart_bg">
	<div>${pmap.PRODUCT}</div>
	<div id="button">
	<button type="button" onclick="quantityDown()">-</button>
	<input type="text" id="quantity" value=1 size=3 maxlength=3 
	oninput="quatityChange()" 
	onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
	<button type="button" onclick="quantityUp()">+</button>
	</div>
</div>
<div id="total_price">총 상품금액</div><hr>
<div id="amout"><fmt:formatNumber value="${d}" type="number" pattern="#,###원"/></div>
<div>
<div>
<input type="checkbox" id="chk">정기배송으로 받아보시겠어요?
</div>
<div id="buy">
<button type="button" id="btn1" onclick="addCartFromList()">장바구니</button>
<button type="button" id="btn2" onclick="addCartAndOrder()">즉시구매</button>
</div>
</div>
</body>
</html>