<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${productcount == 0}">
		<h5> 판매상품이 없습니다. </h5>
	</c:if>
	<c:if test="${productcount > 0}">
		<table>
	        <thead>
	            <tr>
	                <th>상품이름</th>
	                <th>가격</th>
	                <th>조회수</th>
	                <th>재고수</th>
	                <th>유통기한</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach var="product" items="${productList}">
	                <tr>
	                    <td>${product.product}</td>
	                    <td>${product.price}</td>
	                    <td>${product.count}</td>
	                    <td>${product.stock}</td>
	                    <td>
	                    	<fmt:formatDate value= "${product.expiry}" pattern="yyyy-MM-dd"/>
	                    </td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
    </c:if>
</body>
</html>