<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/배송</title>
<script src="/resources/js/member3.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>

<body>
<br/><button type="button" onclick="javascript:window.location='/member/all'">all로 가기</button>
<table>
<c:forEach var="map" items="${list }">
<c:set var="newdate">
<fmt:formatDate value="${map.PURDATE}" pattern="yyyy-MM-dd"/>
</c:set>
<c:if test="${!map.ORDERID.equals(orderid) }">
<tr><td colspan="7"><hr/></td></tr>
</c:if>
<c:if test="${!newdate.equals(date) }">
<tr>
<td colspan="7">
<h2>${newdate}</h2>
</td>
</tr>
</c:if>
<c:set var="date"><fmt:formatDate value="${map.PURDATE }" pattern="yyyy-MM-dd"/></c:set>
<c:if test="${!map.ORDERID.equals(orderid) }">
<tr>
<td></td><td></td><td></td><td></td><td></td><td></td><td><a href="javascript:void(0);" onclick="toOderDetail('${map.ORDERID}','${map.MEMBERID }')">주문상세>></a></td>
</tr>
<tr>
<td>주문번호</td><td>상품명</td><td>가격</td><td>구매 수량</td><td>구매 가격</td><td>주문상태</td><td>배송정보</td>
</tr>
</c:if>
<tr>
<td>${map.ORDERID }</td>
<td>${map.PRODUCT}</td><td>${map.PRICE}</td><td>${map.QUANTITY}</td><td>${map.QUANTITY* map.PRICE}</td>
<td>
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



</body>
</html>