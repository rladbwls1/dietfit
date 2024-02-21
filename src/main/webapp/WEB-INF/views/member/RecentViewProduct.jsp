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
            text-decoration: none;
            color: #007bff; 
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
        .recentcontainer{
         	width :60%;
            margin: 0 auto;
			margin-bottom: 10px;
        }
    </style>
    <!-- template -->
	<!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


    <!-- Customized Bootstrap Stylesheet -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/resources/css/style.css" rel="stylesheet">
    
    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.6.0/kakao.min.js"
  		integrity="sha384-6MFdIr0zOira1CHQkedUqJVql0YtcZA1P0nbPrQYJXVJZUkTk/oX4U9GhUIs3/z8" crossorigin="anonymous"></script>

	<!-- table -->
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
	<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/navbar.jsp"/>
	<div class="container-fluid py-5 mb-5 hero-header">
		<div class="d-grid gap-2 col-6 mx-auto">
			<h1>${id}님의 최근 본 상품</h1>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			</div>
		</div>
	</div>
	<div class ="recentcontainer">
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
				    	${product.product}
					</td>
				<td>
				    <p>${product.price}</p>
				</td>
				<td>
				        <img src="${product.imagePath}" alt="${product.product} 이미지">
				</td>

                </tr>
            </c:forEach>
        </table>
    </c:if>
    <!-- 최근 본 상품이 없는 경우에 대한 처리 -->
    <c:if test="${empty recentlyViewedProducts}">
        <p class="no-product">최근 본 상품이 없습니다.</p>
    </c:if>
    </div>
</body>
</html>
