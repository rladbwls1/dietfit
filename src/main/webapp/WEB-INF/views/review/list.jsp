<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<html>
<head>
    <style>
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
    </style>
    <script>
	function good(reviewnum){
		var id=$('#id').val();
		if(id==""){
			alert("로그인 후 이용하세요.");
		}else{
			
			$.ajax({
				url:'/review/Good',
				type:'post',
				data:{reviewnum:reviewnum,id:id},
				async:false,
				success:function(a){
					window.location.reload();
				}
			});
		
		}
	}
	function bye(reviewnum){
		var id=$('#id').val();
		$.ajax({
			url:'/review/Bye',
			type:'post',
			data:{reviewnum:reviewnum,id:id},
			async:false,
			success:function(a){
				window.location.reload();
			}
		});
		
	}
	window.onload = function() {
	    var writerFullNameElements = document.querySelectorAll(".writerFullName");
	    writerFullNameElements.forEach(function(writerFullNameElement) {
	        var writerFullName = writerFullNameElement.textContent;
	        if (writerFullName.length > 3) {
	            var maskedName = writerFullName.substring(0, 3) + '*'.repeat(writerFullName.length - 3);
	            writerFullNameElement.textContent = maskedName;
	        }
	    });
	};
    </script>
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

<div class="container-fluid py-5 mb-5 hero-header" >
	<div class="d-grid gap-2 col-6 mx-auto">
		<h4 class="text-primary" >REVIEW</h4>
	    <h1 class="display-5 mb-5 text-dark">리뷰 모음</h1>
    </div>
</div>
        
<input type="hidden" value="${id }" id="id" />
<div class="d-grid gap-2 col-6 mx-auto">
    <c:forEach var="review" items="${review}">
        <div class="review-container">
            <div class="review-header">
                <div class="review-image">
                    <c:choose>
                        <c:when test="${not empty review.attatch}">
                            <img src="/resources/review/${review.attatch}" style="width: 130px; height: 130px;"/>
                        </c:when>
                        <c:otherwise>
                            이미지 없음
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="review-details">
                    <div> 
                    	<h5>${review.boardname }</h5>
                   	</div>
                   	<div class="authorName">
                   		<span class="writerFullName">${review.writer}</span>
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
                    	<b>${review.content}</b>
                    </div>
                    <div>❤   ${review.recommend} </div>
                </div>
                
                
                <div>
                	<c:if test="${review.id eq id }">
                		<button type="button" class = "btn btn-outline-danger">삭제</button>
                	</c:if>
               	</div>
               	<c:choose>
               	<c:when test="${!recommendNums.contains(review.num) }">
                <div class="review">
				    <div class="love-icon">
				    	<a href="javascript:void(0)" onclick="good('${review.num}')" >
			        		<img src="/resources/img/free-icon-love-7476962.png" width="20px"/>
	        			</a>
				    </div>
				</div>
               	</c:when>
               	<c:otherwise>
                <div class="review">
				    <div class="love-icon">
				    	<a href="javascript:void(0)" onclick="bye('${review.num}')" >
				        	<img src="/resources/img/free-icon-love-4397571.png" width="20px"/>
			        	</a>
				    </div>
				</div>
               	</c:otherwise>
               	</c:choose>
            </div>
            <div class="clear-fix"></div>
        </div>
    </c:forEach>
    </div>
    </div>
    </div>
</div>
    <jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>
