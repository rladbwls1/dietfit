<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dietfit - mypage</title>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
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
			<h3><sec:authentication property="principal.dto.name"/>님(<sec:authentication property="principal.dto.id"/>) 안녕하세요! </h3>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			  <button type="button" class="btn btn-primary" onclick="javascript:window.location='/member/modifyForm'">정보수정</button>
			  <form action="/logout" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="submit" class="btn btn-primary" value="로그아웃"/>
			  </form>
			</div>
			<sec:authentication property="principal.dto.status" var="statusValue" />
		    <c:if test="${statusValue < 5}"> 
				<div class="card text-center">
				  <div class="card-body">
				    <h5 class="card-title">
						<c:choose>
						    <c:when test="${statusValue eq 1}">
						        <p>NEW 등급</p>
						    </c:when>
						    <c:when test="${statusValue eq 2}">
						        <p>BRONZE 등급</p>
						    </c:when>
						    <c:when test="${statusValue eq 3}">
						        <p>SILVER 등급</p>
						    </c:when>
						    <c:when test="${statusValue eq 4}">
						        <p>GOLD 등급</p>
						    </c:when>
						    <c:otherwise>
						        <p>STOP</p>
						    </c:otherwise>
						</c:choose>
				    </h5>
				    
				    <p class="card-text">
				    	NEW(최초가입) | BRONZE(5만원이상) | SILVER(10만원 이상) | GOLD(20만원 이상)
				    </p>
				    <button type="button" class="btn btn-warning" onclick="window.open('/member/coupondownload', '쿠폰 다운로드','width=800,height=400,location=no,status=no,scrollbars=yes')">쿠폰 다운받기</button>
				    <button type="button" class="btn btn-warning" onclick="window.open('/member/myCoupon', '내 쿠폰','width=450,height=300,location=no,status=no,scrollbars=yes')">쿠폰함</button>
				    <button type="button" class="btn btn-warning" onclick="window.open('/member/myPoint', '내 적립금','width=450,height=300,location=no,status=no,scrollbars=yes')">보유 적립금</button>
				  </div>
				  <div class="card-footer text-body-secondary">
				    가입날짜 : <sec:authentication property="principal.dto.reg"/>
				  </div>
				</div>
				</c:if>
				<c:if test="${statusValue eq 99}">
					<p>탈퇴된 사용자 입니다. 다시 가입해주세요</p>
				</c:if> 
			</div>
		</div>
	
	<c:if test="${statusValue < 5}">
	<div class="d-grid gap-2 col-6 mx-auto">
		<div class="accordion accordion-flush" id="accordionFlushExample">
		  <div class="accordion-item">
		    <h2 class="accordion-header">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
		        주문목록
		      </button>
		    </h2>
		    <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
		      <div class="accordion-body">
		      	<button type="button" class="btn btn-outline-warning" onclick="javascript:window.location='/member/myOrder'">주문 목록</button>
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
		        쇼핑
		      </button>
		    </h2>
		    <div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
		      <div class="accordion-body">
		      	<button type="button" class="btn btn-outline-warning" onclick="javascript:window.location='/member/RecentViewProduct'">최근본상품</button>
				<button type="button" class="btn btn-outline-warning" onclick="javascript:window.location='/member/wishList'">관심상품</button>
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
				내가 쓴 리뷰
		      </button>
		    </h2>
		    <div id="flush-collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
		      <div class="accordion-body">
		      	<button type="button" class="btn btn-outline-warning" onclick="javascript:window.location='/review/myReview'">나의 리뷰</button>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
	</c:if>
</body>
</html>