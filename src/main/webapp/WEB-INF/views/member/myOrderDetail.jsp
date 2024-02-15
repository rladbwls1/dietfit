<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문상세</title>
<script src="/resources/js/member3.js"></script>
</head>

<body>
<button type="button" onclick="window.location.href='all'" >all로 가기 </button><br/>
<button type="button" onclick="window.location.href='myOrder'" >주문/배송으로 가기</button><br/>
<hr/>
주문번호: ${orderid} <br/>
<hr/>
배송지 정보 <br/>
${dto.nicaddr } <br/>
${dto.postnum } ${dto.addr1 } ${dto.addr2 } <br/>
${dto.receiver } ${dto.phone }<br/>
<hr/>
<table >
<tr><td>상품</td><td>구매수량</td><td>구매 금액</td></tr>
<c:forEach var="order" items="${list }">
	<tr>
	<td>${order.product }<br/>${order.price }원<br/><br/>
	<button type="button" onclick="toReviewForm('${order.productid}')" >리뷰 쓰기</button>
	<button type="button" onclick="toChatByOrderdateil('${order.product}','${order.productid.substring(0,2) }')" >문의하기</button>
	</td>
	<td>${order.quantity }</td>
	<td>${order.quantity*order.price }</td>
	</tr>
<c:set var="amount" value="${amount+order.quantity*order.price}"/>
</c:forEach>
<tr><td><hr/></td></tr>
<tr><td>총금액: </td><td>${amount }원</td></tr>
<tr><td>쿠폰 사용: </td><td>사용 안 함</td></tr>
<tr><td>적립금 사용: </td><td>0원</td></tr>
<tr><td>할인된 금액: </td><td>0원</td></tr>
<tr><td><hr/></td></tr>
<tr><td>결제금액: </td><td>${amount }원</td></tr>

</table>




</body>


</html>