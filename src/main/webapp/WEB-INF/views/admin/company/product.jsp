<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
                    <td>${product.expiry}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>