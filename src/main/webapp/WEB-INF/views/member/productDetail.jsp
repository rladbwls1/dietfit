<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

    <title>Product Details</title>
    <script src="/resources/js/review.js"></script>
</head>
<body>
    <h2>Product Details</h2>
    <table>
    	<tr>
    		<td>
    			<c:forEach var="thumbnailPath" items="${thumbnailPaths}">
				    <img src="${thumbnailPath}" width="300"> 
				</c:forEach>
    		</td>
    	</tr>	
        <tr>
            <td>상품이름:</td>
            <td>${product.PRODUCT}</td>
        </tr>
        <tr>
            <td>가격:</td>
           	<td>
				<c:if test="${product.SALE!=0}">
				<span style="color:gray;text-decoration: line-through;">${product.ORIPRICE}</span><br/><span style="color:red">${product.SALE}%</span> 
				</c:if>
				${product.PRICE }
			</td>
        </tr>
        <tr>
            <td>상세설명:</td>
            <td>${product.DETAIL}</td>
            <td>
            	<c:forEach var="imagePath" items="${imagePaths}">
		            <div>
		                <img src="${imagePath}" width="400"> 
		            </div>
		        </c:forEach>
            </td>
        </tr>
        <tr>
            <td>배송정보:</td>
            <td>
				<c:choose>
			        <c:when test="${product.DELIVERY == 0}">
			            일반배송, 정기배송
			        </c:when>
			        <c:when test="${product.DELIVERY == 1}">
			            일반배송
			        </c:when>
			        <c:otherwise>
			            기타 배송 옵션
			        </c:otherwise>
			    </c:choose>
            </td>
        </tr>
        <!-- 
        <tr>
            <td>조회수:</td>
            <td>${product.count}</td>
        </tr>
         -->
        <tr>
            <td>유통기한:</td>
            <td>
            	<fmt:formatDate value="${product.EXPIRY}" pattern="yyyy-MM-dd"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <form action="/sellerchat/chat" method="post">
                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="hidden" name="product" value="${product.PRODUCT}">
                    <input type="hidden" name="companyid" value="${product.COMPANYID}">
                    <button type="submit">상품 문의</button>
                </form>
            </td>
        </tr>
    </table>
    <!-- 리뷰 -->
    <input type="hidden" value="${id }" id="id" />
    <table>
    <c:forEach var="review" items="${review}">
        <div class="review-container" id="review_${review.num}">
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
                    <div>❤   <span id="recommend_${review.num}">${review.recommend}</span> </div>
                </div>
                <div>
                	<c:set var="status">
                		<sec:authentication property='principal.dto.status'/>
                	</c:set>
                
                	<c:if test="${review.id eq id or status eq '999' or companyid eq product.COMPANYID}">
                		<button type="button" onclick="deleteReview('${review.num}')" >삭제</button>
                	</c:if>
               	</div>
               	<c:choose>
               	<c:when test="${!recommendNums.contains(review.num) }">
                <div class="review">
				    <div class="love-icon">
				    	<a href="javascript:void(0)" onclick="good('${review.num}')" id="event_${review.num }">
			        		<img src="/resources/img/free-icon-love-7476962.png" width="20px" id="review_${review.num }"/>
	        			</a>
				    </div>
				</div>
               	</c:when>
               	<c:otherwise>
                <div class="review">
				    <div class="love-icon">
				    	<a href="javascript:void(0)" onclick="bye('${review.num}')" id="event_${review.num }">
				        	<img src="/resources/img/free-icon-love-4397571.png" width="20px" id="review_${review.num }"/>
			        	</a>
				    </div>
				</div>
               	</c:otherwise>
               	</c:choose>
            </div>
            <div class="clear-fix"></div>
        </div>
    </c:forEach>
    </table>

</body>
</html>