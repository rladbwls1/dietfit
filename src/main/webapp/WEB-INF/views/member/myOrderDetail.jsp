<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
 <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="/resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="/resources/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="/resources/css/style.css" rel="stylesheet">
   		<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.6.0/kakao.min.js"
      		integrity="sha384-6MFdIr0zOira1CHQkedUqJVql0YtcZA1P0nbPrQYJXVJZUkTk/oX4U9GhUIs3/z8" crossorigin="anonymous"></script>
        
<title>주문상세</title>
<script src="/resources/js/member3.js"></script>
<link rel="stylesheet"  href="/resources/css/myOrder.css" >
</head>

<body>
<jsp:include page="/WEB-INF/views/navbar.jsp"/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<table>
<tr><td>주문번호: ${orderid} </td></tr>
<tr><td>배송지 정보 <br/>
${dto.nicaddr } <br/>
${dto.postnum } ${dto.addr1 } ${dto.addr2 } <br/>
${dto.receiver } ${dto.phone }<br/></td></tr>
</table>
<table >
<tr><td colspan="2">상품</td><td>구매수량</td><td>구매 금액</td></tr>
<c:set var="i" value="0"/>
<c:forEach var="order" items="${list }">
	<tr>
	<td><img src="${imgPaths.get(i) }" width="50"/></td>
	<td>${order.product }<br/>${order.price }원<br/><br/>
	<c:choose>
		<c:when test="${reviewable.get(i)==1}">
			<span style="color:green">리뷰 작성 완료</span>
		</c:when>
		<c:otherwise>
			<button type="button" onclick="toReviewForm('${order.productid}','${order.orderid }')" >리뷰 쓰기</button>
		</c:otherwise>
	</c:choose>
	<button type="button" onclick="toChatByOrderdateil('${order.product}','${order.productid.substring(0,2) }')" >문의하기</button>
	</td>
	<td>${order.quantity }</td>
	<td>${order.quantity*order.price }</td>
	</tr>
<c:set var="amount" value="${amount+order.quantity*order.price}"/>
<c:set var="i" value="${i+1 }"/>
</c:forEach>
</table>
<table>
<tr><td>총금액: ${amount }원</td></tr>
<tr><td>쿠폰 사용: 사용 안 함</td></tr>
<tr><td>적립금 사용: 0원</td></tr>
<tr><td>할인된 금액: 0원</td></tr>
<tr><td>결제금액: ${amount }원</td></tr>
</table>





</body>


</html>