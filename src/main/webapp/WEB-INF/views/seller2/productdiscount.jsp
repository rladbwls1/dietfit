<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Company Products</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #286FAE;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        button {
            background-color: #286FAE;
            color: white;
            padding: 8px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #20588A;
        }
    </style>
</head>
<body>
	<button class="myPageButton" onclick="goToMyPage()">MYPAGE</button>
    <h2>할인율 설정</h2>
    <table>
        <thead>
            <tr>
                <th>상품이름</th>
                <th>카테고리</th>
                <th>재고량</th>
                <th>유통기한</th>
                <th>가격</th>
                <th>할인</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="product" items="${companyProducts}">
                <tr>
                    <td>${product.product}</td>
                    <td>${product.category}</td>
                    <td>${product.stock}</td>
                    <td>
                        <fmt:formatDate value="${product.expiry}" pattern="yyyy-MM-dd"/>
                    </td>
                    <td>${product.price}</td>
                    <td><button onclick="openDiscountFormPopup('${product.num}')">할인율 설정</button></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <script>
        function openDiscountFormPopup(num) {
            var popupUrl = '/seller/discountForm?num=' + num;
            var popupWindow = window.open(popupUrl, '_blank', 'width=600, height=450, scrollbars=yes');
            if (popupWindow) {
                popupWindow.focus();
            }
        }

        function closewindow2() {
            window.location.href="/seller/productdiscount";
        }
     // my페이지로 이동하는 함수
        function goToMyPage() {
            window.location.href = '/seller/mypage'; // 원하는 경로로 변경
        }
    </script>
</body>
</html>
