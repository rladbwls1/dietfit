<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>최근 본 상품</title>
    <style>
        body {
            font-family: 'Arial', sans-serif; /* 전체 글꼴 설정 */
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4; /* 배경 색상 설정 */
        }

        h2 {
            color: #333; /* 제목 글꼴 색상 설정 */
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff; /* 테이블 배경 색상 설정 */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        img {
            max-width: 100px;
            height: auto;
            border-radius: 5px; /* 이미지에 둥근 모서리 추가 */
        }

        .product-info {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }

        .product-info a {
            text-decoration: none; /* 링크에 밑줄 제거 */
            color: #007bff; /* 링크 색상 설정 */
            font-weight: bold;
        }

        .product-info p {
            color: #888; /* 가격 글꼴 색상 설정 */
            margin: 5px 0;
        }

        .no-product {
            margin-top: 20px;
            color: #777;
        }
    </style>
</head>
<body>
    <h2>${id}님의 최근 본 상품</h2>

    <c:if test="${not empty recentlyViewedProducts}">
        <table>
            <tr>
                <th>상품명</th>
                <th>가격</th>
                <th>이미지</th>
            </tr>
            <c:forEach var="product" items="${list}">
                <tr>
                    <td class="product-info">
				    <a href="<c:url value='/seller/product/details/${product.companyid}/${product.category}/${product.category2}/${product.flavor}'/>">${product.product}</a>
				</td>
				<td>
				    <p>${product.price}</p>
				</td>
				<td>
				    <a href="<c:url value='/seller/product/details/${product.companyid}/${product.category}/${product.category2}/${product.flavor}'/>">
				        <img src="${product.imagePath}" alt="${product.product} 이미지">
				    </a>
				</td>

                </tr>
            </c:forEach>
        </table>
    </c:if>
    <!-- 최근 본 상품이 없는 경우에 대한 처리 -->
    <c:if test="${empty recentlyViewedProducts}">
        <p class="no-product">최근 본 상품이 없습니다.</p>
    </c:if>
</body>
</html>
