<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
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
</head>
<body>
<input type="hidden" value="${id }" id="id" />
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
                <div>
                	<c:if test="${review.id eq id }">
                		<button type="button" >삭제</button>
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
</body>
</html>
