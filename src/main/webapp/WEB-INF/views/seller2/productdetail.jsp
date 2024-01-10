<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
            <td>
            	<fmt:formatDate value="${product.expiry}" pattern="yyyy-MM-dd"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <form action="/seller/contact" method="post">
                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="hidden" name="productId" value="${product.product}">
                    <input type="hidden" name="productId" value="${product.companyid}">
                    <button type="submit">상품 문의</button>
                </form>
            </td>
        </tr>
    </table>
</body>
</html>
