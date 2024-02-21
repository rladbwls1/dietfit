<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="/resources/js/review.js"></script>
<html>
<head>
	<title>나의 리뷰</title>
    <style>
        .review-container {
            border: 1px solid #50ab89;
            padding: 10px;
            width :60%;
            margin: 0 auto;
			margin-bottom: 10px;            
        }
        .review-header {
            display: flex;
            align-items: center;
        }
        .review-image {
            margin-right: 10px;
        }
        .review-details {
            flex-grow: 1;
        }
        .clear-fix {
            clear: both;
        }
        .star-rating .filled {
            color: #FFC107;
        }
        .star-rating .empty {
            color: #ccc;
        }
        .love-icon {
            margin-left: 30px;
        }
        .delete{
        	
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
			<h1>나의 리뷰</h1>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			</div>
		</div>
	</div>
	<input type="hidden" value="${id }" id="id" />
    <c:forEach var="review" items="${review}">
        <div class="review-container" id="review_${review.num}" >
            <div class="review-header">
                <div class="review-image">
                    <c:choose>
                        <c:when test="${not empty review.attatch}">
                            <img src="/resources/review/${review.attatch}" style="width: 130px; height: 130px;"/>
                        </c:when>
                        <c:otherwise>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="review-details">
                    <div>${review.boardname }</div>
                    <div>평점:
                        <span class="star-rating">
                            <c:forEach begin="1" end="5" var="i">
                                <c:choose>
                                    <c:when test="${i <= review.starscore}">
                                        <span class="filled">★</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="empty">☆</span>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </span>
                    </div>
                    <div>
                    리뷰 내용:
                    <br>
                    ${review.content}</div>
                    <div class="authorName">작성자 : <span class="writerFullName">${review.writer}</span></div>
                    <div>❤   <span id="recommend_${review.num}">${review.recommend}</span> </div>
                </div>
                <div>
                	<c:if test="${review.id eq id }">
                		<button type="button" class ="delete btn btn-outline-primary" onclick="deleteReview('${review.num}')">삭제</button>
                	</c:if>
               	</div>
               	<c:choose>
               	<c:when test="${!recommendNums.contains(review.num) }">
                <div class="review">
				    <div class="love-icon">
				    	<a href="javascript:void(0)" onclick="good('${review.num}')" id="event_${review.num }">
			        		<img src="/resources/img/free-icon-love-7476962.png" width="20px" id="review_${review.num }" />
	        			</a>
				    </div>
				</div>
               	</c:when>
               	<c:otherwise>
                <div class="review">
				    <div class="love-icon">
				    	<a href="javascript:void(0)" onclick="bye('${review.num}')" id="event_${review.num }">
				        	<img src="/resources/img/free-icon-love-4397571.png" width="20px" id="review_${review.num }" />
			        	</a>
				    </div>
				</div>
               	</c:otherwise>
               	</c:choose>
            </div>
            <div class="clear-fix"></div>
        </div>
    </c:forEach>
</body>
</html>
