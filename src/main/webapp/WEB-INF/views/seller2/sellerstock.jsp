<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>재고 추가</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h2>재고 추가</h2>
    <form action="/addStock" method="post">
        <label for="product">상품명:</label>
        <input type="text" id="product" name="product" value="${product}" readonly>
        

        <label for="productId">상품ID:</label>
        <input type="text" id="productId" name="productId" value="${productId}" readonly>

        <label for="quantity">추가 수량:</label>
        <input type="number" id="quantity" name="quantity" min="1" required>

        <button type="submit">재고 추가</button>
    </form>
</body>
</html>
