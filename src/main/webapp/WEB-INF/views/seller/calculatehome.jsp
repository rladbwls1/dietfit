<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .button-container {
            text-align: center;
        }

        .product-button {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            font-size: 16px;
            font-weight: bold;
            text-decoration: none;
            color: #fff;
            background-color: #007bff;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .product-button:hover {
            background-color: #0056b3;
        }
    </style>
    <title>Product Buttons</title>
</head>
<body>

    <div class="button-container">
        <a href="<c:url value='/seller/calculate/AA'/>" class="product-button">AA Products</a>
        <a href="<c:url value='/seller/calculate/AB'/>" class="product-button">AB Products</a>
        <a href="<c:url value='/seller/calculate/AC'/>" class="product-button">AC Products</a>
        <a href="<c:url value='/seller/calculate/AD'/>" class="product-button">AD Products</a>
        <a href="<c:url value='/seller/calculate/AE'/>" class="product-button">AE Products</a>
    </div>

</body>
</html>
