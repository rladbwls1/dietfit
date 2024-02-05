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
</head>


<br/><button type="button" onclick="javascript:window.location='/member/all'">all로 가기</button>
<table>
<c:forEach var="order" items="${list }">
<c:set var="newdate">
<fmt:formatDate value="${order.purdate }" pattern="yyyy-MM-dd"/>
</c:set>
<c:if test="${!order.orderid.equals(orderid) }">
<tr><td colspan="6"><hr/></td></tr>
</c:if>
<c:if test="${!newdate.equals(date) }">
<tr>
<td colspan="6">
<h2>${newdate}</h2>
</td>
</tr>
</c:if>
<c:set var="date"><fmt:formatDate value="${order.purdate }" pattern="yyyy-MM-dd"/></c:set>
<c:if test="${!order.orderid.equals(orderid) }">
<tr>
<td></td><td></td><td></td><td></td><td></td><td><a href="javascript:void(0);" onclick="toOderDetail('${order.orderid}','${order.memberid }')">주문상세>></a></td>
</tr>
<tr>
<td>주문번호</td><td>상품명</td><td>가격</td><td>구매 수량</td><td>구매 가격</td><td>구매 확정 여부</td>
</tr>
</c:if>
<tr>
<td>${order.orderid }</td>
<td>${order.product}</td><td>${order.price }</td><td>${order.quantity }</td><td>${order.quantity* order.price}</td>
<td>
<c:choose>
<c:when test="${order.purchase==0 }">구매 확정 전</c:when>
<c:when test="${order.purchase==4 }">구매 취소</c:when>
<c:when test="${order.purchase==5 }">환불</c:when>
<c:when test="${order.purchase==6 }">교환</c:when>
<c:when test="${order.purchase==9 }">구매 확정</c:when>
</c:choose>
</td>
</tr>

<c:set var="orderid" value="${order.orderid }"/>
</c:forEach>
<tr><td colspan="6"><hr/></td></tr>
</table>





<body>
</body>
</html>