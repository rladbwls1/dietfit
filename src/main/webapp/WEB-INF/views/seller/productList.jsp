<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Product List</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        img {
            display: block;
            margin: 0 auto;
            max-width: 100px;
            max-height: 100px;
        }
    </style>
</head>
<body>
    <h2>Product List</h2>
    <a href="<c:url value='productadd?companyid=${companyid}'/>">상품추가</a>
    <input type="hidden" name="companyid" value="${companyid}">
    <table>	
        <thead>
            <tr>
                <th>Product Name</th>
                <th>Price</th>
                <th>Image</th>
            </tr>
        </thead>
        <tbody>
		    <c:forEach var="product" items="${products}">
		        <tr>
		            <td><a href="<c:url value='/seller/product/details/${product.companyid}/${product.category}/${product.category2}/${product.flavor}'/>">${product.product}</a></td>
		            <td>${product.price}</td>
		            <td>
		                <img src="${product.imagePath}" alt="${product.product}">
		            </td>
		        </tr>
		    </c:forEach>
		</tbody>
    </table>
</body>
</html>
