<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<style>
	#content{
		padding: 0 15px;
	}
	#user{
		background-color: #007bff;
		color: white;
		padding: 5px 0 5px 10px;
		margin: 0 0 20px 0;
	}
	#coupon th, #coupon td{
		border: 1px solid lightgray;
		padding: 5px;
	}
	#title{
		margin: 10px 0;
	}
	.btn1{
		padding: 3px 12px;
   		border: 1px solid #007bff;
   		border-radius: 5px;
   		background-color: #007bff;
   		color: white;
	}
	.btn2{
		padding: 3px 12px;
   		border: 1px solid gray;
   		border-radius: 5px;
   		background-color: white;
   		color: gray;
	}
	#coupon{
		width: 100%;
		text-align: center;
	}
  .review-container {
           margin-bottom: 20px;
           border: 1px solid #ccc;
           padding: 10px;
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
       .btn{
       		padding: 5px 15px;
	   		border: 1px solid gray;
	   		border-radius: 5px;
	   		background-color: white;
	   		color: gray;
       }
</style>
</head>
<body>
	<div id="user">${info.id}(${info.name}) 님의 회원정보입니다.</div>
	<div id="content">
	<ul class="nav nav-tabs">
	  <li class="nav-item">
	    <a class="nav-link" aria-current="page" href="/admin/management?id=${info.id}">회원정보</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="/admin/Usercoupon?id=${info.id}">쿠폰내역</a>
	  </li>
	  <li class="nav-item">
	  	<a class="nav-link active" href="/admin/Userreview?id=${info.id}">리뷰목록</a>
	  </li>
	</ul>
	<h4 id="title">리뷰 내역</h4>
		<input type="hidden" value="${id }" id="id" />
    <c:forEach var="review" items="${review}">
        <div class="review-container" id="review_${review.num}" >
            <div class="review-header">
                <div class="review-image">
                    <c:choose>
                        <c:when test="${not empty review.attatch}">
                            <img src="/resources/review/${review.attatch}" style="width: 130px; height: 130px;"/>
                        </c:when>
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
                    <div>리뷰 내용: ${review.content}</div>
                    <div class="authorName">작성자 : <span class="writerFullName">${review.writer}</span></div>
                    <div>❤   <span id="recommend_${review.num}">${review.recommend}</span> </div>
                </div>
                <div>
                	<c:if test="${review.id eq id }">
                		<button class="btn" type="button" onclick="deleteReview('${review.num}')">삭제</button>
                	</c:if>
               	</div>
            </div>
            <div class="clear-fix"></div>
        </div>
    </c:forEach>
		</div>
</body>
</html>