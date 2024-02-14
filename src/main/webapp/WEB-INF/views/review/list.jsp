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
        .review-image {
            float: left;
            margin-right: 10px;
        }
        .review-details {
            overflow: hidden;
        }
        .review-details div {
            margin-bottom: 5px;
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
            float: right;
        }
    </style>
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
</script>
</head>
<body>
    <c:forEach var="reviewImage" items="${reviewImages}">
        <div class="review-container">
            <div class="review-image">
                <c:choose>
                    <c:when test="${not empty reviewImage.attatch}">
                        <img src="/resources/review/${reviewImage.attatch}" style="width: 100px; height: 100px;"/>
                    </c:when>
                    <c:otherwise>
                        이미지 없음
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="review-details">
                <div>${reviewImage.boardname }</div>
                <div>평점: 
                    <span class="star-rating">
                        <c:forEach begin="1" end="5" var="i">
                            <c:choose>
                                <c:when test="${i <= reviewImage.starscore}">
                                    <span class="filled">★</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="empty">☆</span>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </span>
                </div>
                <div>리뷰 내용: ${reviewImage.content}</div>
            </div>
            <div class="clear-fix"></div>
        </div>
    </c:forEach>
</body>
</html>
