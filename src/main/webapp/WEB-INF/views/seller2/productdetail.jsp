<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Product Details</title>
</head>
<body>
    <h2>Product Details</h2>
    <table>
        <tr>
            <td>상품이름:</td>
            <td>${product.product}</td>
        </tr>
        <tr>
            <td>가격:</td>
            <td>${product.price}</td>
        </tr>
        <tr>
            <td>상세설명:</td>
            <td>${product.detail}</td>
        </tr>
        <tr>
            <td>배송정보:</td>
            <td>${product.delivery}</td>
        </tr>
        <tr>
            <td>조회수:</td>
            <td>${product.count}</td>
        </tr>
        <tr>
            <td>유통기한:</td>
            <td>${product.expiry}</td>
        </tr>
    </table>
</body>
</html>
