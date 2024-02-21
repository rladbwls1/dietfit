<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="/resources/js/review.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="/resources/js/member2.js"></script>
<script src="/resources/js/food.js"></script>
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
        #product_price{
				font-size: 25px;
				font-weight: 700;
				color: #e02020;
			}
			#chooseProductCart{
				margin: 15px 0 10px 0;
				width: 100%;
				height: 40px;
			}
			#clac{
				display: flex;
			}
			#clac_bg{
				background-color: rgba(0,0,0,.03);
				width: 100%;
				padding: 7px;
			}
			#clac button{
				border: 1px solid lightgray;
				width: 32px;
			}
			#product_title{
				margin-bottom: 10px;
			}
			#am{
				color: #e02020;
				font-size: 18px;
			}
			#am_hr{
				color: #e02020;
				font-weight: 600;
			}
			#am_count{
				display: flex;
				justify-content: space-between;
			}
			#addcart, #deli_chk{
				display: flex;
			}
			#addcart{
				margin-top: 10px;
			}
			#cart{
				color: white; 
				background-color: #50AB89;
				border: 1px solid #50AB89; 
				padding: 5px 10px;
				width: 50%;
			}
			#buy{
				padding: 7px 15px;
				color: #50AB89; 
				background-color: white;
				border: 1px solid #50AB89; 
				margin-left: 8px;
				width: 50%;
			}
			#delivery{
				float: right;
			}
			#deli_btn button{
				width: 300px;
				background-color: #50AB89;
				color: white;
				border: 2px solid #FFDB58; 
			}
			#change_btn{
				background-color: #50AB89;
				color: white;
				border: 2px solid #FFDB58;
				margin-left: 30px; 
				margin-bottom: 30px;
			}
    </style>

    <title>Product Details</title>
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
    <style>
    	#deli{
				display: flex;
			}
			.dlfqks{
				background-color: #ff8942;
				color: white;
				padding: 3px 6px;
				border-radius: 10px;
				width: fit-content;
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
			#goto{
				margin-top: 10px;
				width: 100%;
				height: 40px;
				background-color: #FFDB58;
				border: none;
				color: white;
			}
    </style>
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
    			<c:forEach var="thumbnailPath" items="${thumbnailPaths}" varStatus="loop" end="0">
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
        <tr>
      		<td>
      			<input type="hidden" id="price" value="${product.PRICE}" />
					<select name="chooseProductCart" id="chooseProductCart" onchange="showQuantityDiv()">
					    	<option value="${product.PRODUCT}">${product.PRODUCT}</option>
					</select> <br/>
					<div id="clac_bg">
					<div id="product_title">${product.PRODUCT}</div>
					<div id="clac">
					<button type="button" onclick="quantityDown()">-</button>
					<input type="text" id="quantity" value=1 size=3 maxlength=3 onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
					<button type="button" onclick="quantityUp()">+</button>
					</div>
					</div>
					<br/>
					<div id="am_count">
					<div id="am">상품금액 합계</div>
					<div id="amout">${product.PRICE}원</div><br/>
					</div>
					<hr id="am_hr"/>
					<div id="deli_chk"><input type="checkbox" id="chk"><div>정기배송으로 받아보시겠어요?</div></div>
					<div id="addcart">
					<sec:authorize access="isAnonymous()">
						<button id="cart" type="button" onclick="gotologin()">장바구니</button>
						<button id="buy" type="button" onclick="gotologin()">즉시구매</button>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
<<<<<<< HEAD
					<button id="cart" type="button" onclick="addCartFromList()">장바구니</button>
					<button id="buy" type="button" onclick="">즉시구매</button>
=======
						<c:set var="status">
		            		<sec:authentication property="principal.dto.status"/>
		            	</c:set>
		            	<c:if test="${status==1 }">
						<button id="cart" type="button" onclick="addCartFromList()">장바구니</button>
						<button id="buy" type="button" onclick="addCartAndOrder2()">즉시구매</button>
					</c:if>
					<c:if test="${status!=1 }">
						<button id="cart" type="button" onclick="notmember()">장바구니</button>
						<button id="buy" type="button" onclick="notmember()">즉시구매</button>
					</c:if>
>>>>>>> branch 'main' of https://github.com/rladbwls1/dietfit.git
					</sec:authorize>
<<<<<<< HEAD
					<button id="buy" type="button" onclick="addCartAndOrder2()">즉시구매</button>
=======
>>>>>>> branch 'main' of https://github.com/rladbwls1/dietfit.git
          			</div>
          		</td>
          	</tr>
        <!-- 
        <tr>
            <td>조회수:</td>
            <td>${product.count}</td>
        </tr>
         -->
        <tr>
            <td colspan="2">
                <form action="/sellerchat/chat" method="post">
                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="hidden" name="product" value="${product.PRODUCT}">
                    <input type="hidden" name="companyid" value="${product.COMPANYID}">
                    <sec:authorize access="isAnonymous()">
                    	<button type="button" onclick="gotologin()">상품 문의</button>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
                    	<button id="goto" type="submit">상품 문의</button>
                    </sec:authorize>
                </form>
            </td>
        </tr>
    </table>
    </div>
    	<hr id="hr">
        <div>${product.DETAIL}</div>
       	<c:forEach var="imagePath" items="${imagePaths}" varStatus="loop">
           <c:if test ="${loop.index == 0 }">
	           <div class="content_img">
	               <img src="${imagePath}"> 
	           </div>
           </c:if>
   		</c:forEach>
    </div>
    
    
    <!-- 리뷰 -->
    <hr />
    
    <div class="testimonial-header text-center">
        <h4 class="text-primary">REVIEW</h4>
        <h1 class="display-5 mb-5 text-dark">상품리뷰</h1>
    </div>
	
	<c:if test="${reviewcount ==0 }">
		<div class="testimonial-header text-center">
			<p class="text-primary">리뷰가 없습니다.</p>
		</div>
	</c:if>
	
	<c:if test="${reviewcount !=0 }">
    <input type="hidden" value="${id }" id="id" />
    <div class="d-grid gap-2 col-6 mx-auto">
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
                	<sec:authorize access="isAuthenticated()">
                	<c:set var="status">
                		<sec:authentication property='principal.dto.status'/>
                	</c:set>
                	</sec:authorize>
                
                	<c:if test="${review.id eq id or status eq '999' or companyid eq product.COMPANYID}">
                		<button type="button" class = "btn btn-outline-danger" onclick="deleteReview('${review.num}')" >삭제</button>
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
    </div>
    </c:if>
     <!-- Footer Start -->
        <jsp:include page="../footer.jsp"/>
        <!-- Footer End -->
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