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
<<<<<<< HEAD
     <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
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
		<!-- Bootstrap JS 및 Popper.js -->
		<script src="https://code.jquery.com/jquery-3.7.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		        
        <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.6.0/kakao.min.js"
      		integrity="sha384-6MFdIr0zOira1CHQkedUqJVql0YtcZA1P0nbPrQYJXVJZUkTk/oX4U9GhUIs3/z8" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
    	#deli{
				display: flex;
			}
			.dlfqks{
				background-color: #ff8942;
				color: white;
				padding: 3px 6px;
				border-radius: 10px;
			}
			.wjdrl{
				background-color: #f374b7;
				color: white;
				padding: 3px 6px;
				border-radius: 10px;
				margin-left: 5px;
			}
			#content{
				width: 55%;
				margin: 0 auto;
				margin-top: 300px;
			}
			#thum{
				display: flex;
			}
			.content_img{
				text-align: center;
			}
			.content_img img{
				width: 100%;
			}
			#hr{
				border: 1px solid #50AB89;
				margin: 50px 0;
			}
			.td1{
				flex: 1;
			}
			#img1{
				text-align: center;
			}
			#product_name{
				font-size: 30px;
			}
			#product_price{
				font-size: 25px;
				font-weight: 700;
				color: #e02020;
			}
    </style>
=======
    <script src="/resources/js/review.js"></script>
>>>>>>> refs/remotes/origin/main
</head>
<body>
	 <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->

        <!-- Navbar start -->
        <jsp:include page="../navbar.jsp"/>
        <!-- Navbar End -->

        <!-- Modal Search Start -->
        <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content rounded-0">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex align-items-center">
                        <div class="input-group w-75 mx-auto d-flex">
                            <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                            <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Search End -->

        <!-- Hero Start -->
    <div id="content">
    	<div id="thum">
    			<c:forEach var="thumbnailPath" items="${thumbnailPaths}">
				  <div class="td1" id="img1"><img src="${thumbnailPath}" width="300"></div>
				</c:forEach>
	    <table class="td1">
        <tr>
            <td id="product_name">${product.PRODUCT}</td>
        </tr>
        <tr>
           	<td id="product_price">
				<c:if test="${product.SALE!=0}">
				<span style="color:gray;text-decoration: line-through;">${product.ORIPRICE}</span><br/><span style="color:red">${product.SALE}%</span> 
				</c:if>
				<fmt:formatNumber value="${product.PRICE }" type="number" pattern="#,###원"/>
			</td>
        </tr>
        <tr>
<<<<<<< HEAD
=======
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
>>>>>>> refs/remotes/origin/main
            <td>
				<c:choose>
			        <c:when test="${product.DELIVERY == 0}">
					<div id="deli">
			            <div class="dlfqks">일반배송</div> 
			            <div class="wjdrl">정기배송</div>
			        </div>
			        </c:when>
			        <c:when test="${product.DELIVERY == 1}">
			            <div class="dlfqks">일반배송</div>
			        </c:when>
			        <c:otherwise>
			            <div>기타 배송 옵션</div>
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
<<<<<<< HEAD
    </div>
    	<hr id="hr">
         <div>${product.DETAIL}</div>
       	<c:forEach var="imagePath" items="${imagePaths}">
           <div class="content_img">
               <img src="${imagePath}"> 
           </div>
   		</c:forEach>
    </div>
     <!-- Footer Start -->
        <jsp:include page="../footer.jsp"/>
        <!-- Footer End -->
=======
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
>>>>>>> refs/remotes/origin/main

        <!-- Copyright Start -->
        <div class="container-fluid copyright bg-dark py-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        <span class="text-light"><a href="#"><i class="fas fa-copyright text-light me-2"></i>Your Site Name</a>, All right reserved.</span>
                    </div>
                    <div class="col-md-6 my-auto text-center text-md-end text-white">
                        <!--/*** This template is free as long as you keep the below author’s credit link/attribution link/backlink. ***/-->
                        <!--/*** If you'd like to use the template without the below author’s credit link/attribution link/backlink, ***/-->
                        <!--/*** you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". ***/-->
                        Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a> Distributed By <a class="border-bottom" href="https://themewagon.com">ThemeWagon</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Copyright End -->
        <!-- Back to Top -->
        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   
        
    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/lib/easing/easing.min.js"></script>
    <script src="/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="/resources/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/resources/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="/resources/js/main.js"></script>
    <script type="text/javascript">
      // 사용할 앱의 JavaScript 키를 설정해 주세요.
      Kakao.init('ce765a4e5047770d03e8b69f53f43139');
      // 채널 추가하기 버튼을 생성합니다.
      Kakao.Channel.createAddChannelButton({
        container: '#kakao-talk-channel-add-button',
        channelPublicId: '_GCliG',
        size: 'small',
        supportMultipleDensities: true,
      });
    </script>
</body>
</html>