<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 설정</title>
<script src="/resources/js/member3.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<c:if test="${list.size()<5 }">
<button type="button" onclick="window.location.href='addDelivery'">배송지 추가하기</button>
</c:if>
<c:if test="${list.size()>=5 }">
<button type="button" onclick="alert('배송지는 최대 5개 저장 가능합니다.')">배송지 추가하기</button>
</c:if>
<br/>
<c:if test="${empty list}">
저장된 배송지가 없습니다.</c:if>
<c:if test="${!empty list}">
기본 배송지를 설정하면 주문시 자동으로 입력됩니다. 
<form action="setDefaultDelivery" method="post" onsubmit="return checkNicaddr()"> 
<table border="1">
<c:forEach var="dto" items="${list}">
<tr><td><input type="radio" name="nicaddr" id="nicaddr" value="${dto.nicaddr }" ></td>
<td>
<span style="font-weight:bold; ">${dto.nicaddr }</span>
<c:if test="${dto.defaultaddr==9 }">
<span style="font-weight:bold; color:red;">[기본 배송지]</span>
</c:if>
<p>${dto.receiver }</p>
<p>[${dto.postnum }] ${dto.addr1 } ${dto.addr2} </p>
<p>${dto.phone }</p>
</td>
<td><a href="javascript:void(0);" onclick="deleteDelivery('${dto.nicaddr }')"><img src="/resources/img/free-icon-x-mark-11147352.png" width=15 /></a></td>
</tr>
</c:forEach>
<tr><td colspan="3"><button type="submit" >기본 배송지 설정</button></td></tr>
</table>
</form>

</c:if>

</body>
</html>