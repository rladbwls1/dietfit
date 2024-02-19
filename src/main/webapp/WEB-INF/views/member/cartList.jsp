<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="/resources/js/member2.js"></script>
<meta charset="UTF-8">
<title>일반배송 장바구니</title>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
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
</head>
<body>
	<jsp:include page="/WEB-INF/views/navbar.jsp"/>
	<div class="container-fluid py-5 mb-5 hero-header">
		<div class="d-grid gap-2 col-6 mx-auto">
			<h1>일반배송 장바구니</h1>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
				  <ol class="breadcrumb">
				    <li class="breadcrumb-item"><b style="color: #50AB89;">장바구니</b></li>
				    <li class="breadcrumb-item">주문하기</li>
				    <li class="breadcrumb-item active" aria-current="page">결제</li>
				  </ol>
				</nav>
			</div>
		</div>
	</div>	
	
	<div class="container-fluid fruite py-5">
	<c:if test="${empty list }">
		장바구니가 비었습니다.
	</c:if>
	
	<c:if test="${!empty list }">
		<div class="d-grid gap-2 col-6 mx-auto">
			<div class="card text-center">
			  <div class="card-header">
			    <ul class="nav nav-tabs card-header-tabs">
			      <li class="nav-item">
			        <a class="nav-link active" aria-current="true" href="#">일반배송</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="/member/Rdelivery">정기배송</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="/member/wishList">관심상품</a>
			      </li>
			    </ul>
			  </div>
			  <div class="card-body">
			  	<div class="d-grid gap-2 d-md-block">
					<button type="button" class = "btn btn-outline-dark" onclick="Rdelivery(1)">배송방법 변경 > 정기배송</button>
				</div>
			  	<table class="table table-borderless">
			  		<thead>
					<tr>
						<th><input type="checkbox" name="chk_all" id="chk_all" onclick="cartCheckAll()" value="all"/></th>
						<th>이미지</th>
						<th>상품명</th>
						<th>가격</th>
						<th>구매수량</th>
						<th>구매가격</th>
						<th></th>
					</tr>
			  		</thead>
					
					<c:set var="i" value="0"/>
					<c:forEach var="cart" items="${list }" >
					
					<c:if test="${cart.DELIVERY == 0}">
						<tr id="${cart.NUM }" >
							<td><input type="checkbox" name="num" id="num" onclick="cartUpdateCheckAll()" value="${cart.NUM }"></td>
							<td>
								<a href="javascript:void(0)" style="text-decoration-line : none; color:black;" 
								onclick="getProductCodeANDtoDetail('${cart.PRODUCT}')"><img src="${imgPaths[i]}" width="50"/></a>	
							</td>
							<td>
								<a href="javascript:void(0)" style="text-decoration-line : none; color:black;" 
								onclick="getProductCodeANDtoDetail('${cart.PRODUCT}')">${cart.PRODUCT }</a>
							</td>
							<td>
								<c:if test="${cart.SALE!=0}">
								<span style="color:gray;text-decoration: line-through;">${cart.ORIPRICE}</span><br/><span style="color:red">${cart.SALE}%</span> 
								</c:if>
								${cart.PRICE }
							</td>
							<td>
								<button type="button" class="btn btn-outline-dark" onclick="cartQuantityDown('${cart.NUM}')">-</button> 
								<span id="${cart.NUM }_quantity" >${cart.QUANTITY }</span>
								<button type="button" class="btn btn-outline-dark" onclick="cartQuantityUp('${cart.NUM}')">+</button>
							</td>
							<td>
								<span id="${cart.NUM }_price" >${cart.PRICE*cart.QUANTITY }</span>
							</td>
							<td>
								<a href="javascript:void(0);" onclick="deleteCart('${cart.NUM}')" ><img src="/resources/img/free-icon-x-mark-11147352.png" width=15 /></a> 
							</td>
						</tr>
					</c:if>
					<c:set var="i" value="${i+1 }"/>
					<input type="hidden" id="delivery" value="0"/>
				</c:forEach>
			</table>
			</div>
		</div>
		<div>
			<div style="float: right;">
				총 상품 : <span id="totalQuantity"> 0</span>
				총 가격 : <span id="amout">0</span>
				<button type="button" class="btn btn-secondary" onclick="toOrder()">주문하기</button>
			</div>
		</div>
	</div>
	</c:if>
	</div>
</body>
</html>