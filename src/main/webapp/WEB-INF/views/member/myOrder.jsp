<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>     
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- css -->
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
        
     


<!-- css -->
    
<title>주문/배송</title>
<script src="/resources/js/member3.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
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
<c:set var="i" value="0"/>
<c:forEach var="map" items="${list }">
<c:set var="newdate">
<fmt:formatDate value="${map.PURDATE}" pattern="yyyy-MM-dd"/>
</c:set>
<c:if test="${!map.ORDERID.equals(orderid) }">
<!-- 
<tr><td colspan="7"><hr/></td></tr>
 -->
</c:if>
<c:if test="${!newdate.equals(date) }">
<tr>
<td colspan="7">
<h1 class="text-primary display-6">${newdate}</h1>
</td>
</tr>
</c:if>
<c:set var="date"><fmt:formatDate value="${map.PURDATE }" pattern="yyyy-MM-dd"/></c:set>
<c:if test="${!map.ORDERID.equals(orderid) }">
<tr>
<td></td><td></td><td></td><td></td><td></td><td></td><td><a href="javascript:void(0);" onclick="toOderDetail('${map.ORDERID}','${map.MEMBERID }')" >주문상세>></a></td>
</tr>
<tr>
<td>주문번호</td><td>상품</td><td>가격</td><td>구매 수량</td><td>구매 가격</td><td>주문상태</td><td>배송정보</td>
</tr>
</c:if>
<tr>
<td>${map.ORDERID }</td>
<td><img src="${imgPaths.get(i) }" width="50"/>${map.PRODUCT}</td><td>${map.PRICE}</td><td>${map.QUANTITY}</td><td>${map.QUANTITY* map.PRICE}</td>
<td>
<c:set var="i" value="${i+1}"/>
<span id="${map.get('ORDERID') }${map.get('PRODUCTID') }afterClick">
<c:choose>
<c:when test="${map.PURCHASE==0 }">입금 완료<br/><button type="button" onclick="defintePurchase('${map.ORDERID}','${map.PRODUCTID }','${map.QUANTITY*map.PRICE}')">구매확정</button></c:when>
<c:when test="${map.PURCHASE==4 }">구매 취소</c:when>
<c:when test="${map.PURCHASE==5 }">환불</c:when>
<c:when test="${map.PURCHASE==6 }">교환</c:when>
<c:when test="${map.PURCHASE==9 }">구매 확정</c:when>
</c:choose>
</span>
</td>
<c:if test="${!empty map.VALUE }">
<td>${map.TRACKING }<br/>${map.VALUE }</td>
</c:if>
<c:if test="${empty map.VALUE }">
<td>배송전</td>
</c:if>
</tr>

<c:set var="orderid" value="${map.ORDERID}"/>

</c:forEach>
<tr><td colspan="7"><hr/></td></tr>
</table>

<!-- 부트스트랩 JS 및 기타 스크립트를 추가할 수 있습니다. -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</body>
</html>