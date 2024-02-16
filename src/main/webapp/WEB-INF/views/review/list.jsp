<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
<<<<<<< HEAD
        .love-icon {
            margin-left: 30px;
        }
=======
>>>>>>> branch 'main' of https://github.com/rladbwls1/dietfit.git
    </style>
<<<<<<< HEAD
    <script>
    function addWishList(product){
		$.ajax({
			url:'/member/addWishList',
			type:'post',
			data:{product:product},
			success:function(a){
				window.open("wishConfirm","관심목록에 추가하기", "width = 400, height = 200, top = 100, left = 200, location = no");
				window.location.reload();
			}
		});
		
	}
	function removeWishList(product){
		$.ajax({
			url:'/member/removeWishList',
			type:'post',
			data:{product:product},
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
=======
>>>>>>> branch 'main' of https://github.com/rladbwls1/dietfit.git
</head>
<body>
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
                    <div>❤   ${review.recommend} </div>
                </div>
                <div class="review">
				    <div class="love-icon">
				        	<img src="/resources/img/free-icon-love-7476962.png" width="20px"/>
				    </div>
				</div>
            </div>
            <div class="clear-fix"></div>
        </div>
    </c:forEach>
</body>
</html>
