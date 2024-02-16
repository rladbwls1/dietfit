<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
  
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Dietfit 다이어트핏</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
		<script src="/resources/js/jquery-3.7.1.min.js"></script> 
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
		<script src="/resources/js/member2.js"></script>
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    	<style>
    		.boardname{
			    white-space: nowrap;
			    overflow: hidden;
			    text-overflow: ellipsis;
    		}
    		.wish{
    			text-align: right;
    		}
    		.product_img{
    			text-align: center;
    			background: rgba(0,0,0,.03);
    		}
    		#content{
    			padding: 0 8% !important;
    		}
    		.liner{
    			text-decoration: line-through;
    			line-height: 34.5px;
    		}
    		#dis{
    			position: relative;
    		}
    		#countdown{
    			position: absolute;
    			top: 10px;
    			display: flex;
    			justify-content: right;
    		}
    		#time{
    			margin-left: 15px;
    			font-size: 25px;
    			font-weight: 600;
    		}
    		.discount{
    			display: flex;
    		}
    		.sale{
    			font-size: 23px;
    			font-weight: 500;
    			color: black;
    			margin-right: 7px;
    		}
    		.openCart{
    			margin-left: 7px;
    		}
    		.box{
    			margin-bottom: 20px;
    		}
    		#hr{
    			border: 1px solid #FFDB58 !important;
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
        <div class="container-fluid py-5 mb-5 hero-header">
            <div class="container py-5">
                <div class="row g-5 align-items-center">
                    <div class="col-md-12 col-lg-7">
                        <h4 class="mb-3 text-secondary">DIETFIT</h4>
                        <h1 class="mb-5 display-3 text-primary">오늘의 특가</h1>
                        <div class="position-relative mx-auto">
                            <input class="form-control border-2 border-secondary w-75 py-3 px-4 rounded-pill" type="number" placeholder="Search">
                            <button type="submit" class="btn btn-primary border-2 border-secondary py-3 px-4 position-absolute rounded-pill text-white h-100" style="top: 0; right: 25%;">Submit Now</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-5">
                        <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active rounded">
                                    <img src="img/hero-img-1.png" class="img-fluid w-100 h-100 bg-secondary rounded" alt="First slide">
                                    <a href="#" class="btn px-4 py-2 text-white rounded">Fruites</a>
                                </div>
                                <div class="carousel-item rounded">
                                    <img src="img/hero-img-2.jpg" class="img-fluid w-100 h-100 rounded" alt="Second slide">
                                    <a href="#" class="btn px-4 py-2 text-white rounded">Vesitables</a>
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->
        <!-- Featurs Section Start -->
        <div class="container-fluid featurs py-5">
            <div class="container py-5" id="content">
                <div class="row g-4" id="dis">
                	<h2>오늘의 특가</h2>
                	<hr id="hr">
				    <c:if test="${not empty discount}">
					<div class="container">
					    <ul class="list-unstyled row">
					        <c:forEach var="discount" items="${discount}">
					            <li class="col-md-6 box">
					                <div class="product_img" onclick="toDetail('${discount.companyid}','${discount.category}','${discount.category2}','${discount.flavor}')"><img style="width:200px; height:200px;" src="${discount.imagePath}"/></div>
					                <div class="wish">
							                <sec:authorize access="isAnonymous()">
								            <img src="/resources/img/free-icon-love-7476962.png" width="20px"/>
								            </sec:authorize>
								            <sec:authorize access="isAuthenticated()">
								            	<c:choose>
								            	<c:when test="${wishList.contains(discount.boardname)}">
										            <a href="javascript:void(0)" onclick="removeWishList('${discount.boardname}')" >
										            <img src="/resources/img/free-icon-love-4397571.png" width="20px"/>
										            </a>
								            	</c:when>
								            	<c:otherwise>
										            <a href="javascript:void(0)" onclick="addWishList('${discount.boardname}')" >
								           		 	<img src="/resources/img/free-icon-love-7476962.png" width="20px"/>
										            </a>
								            	</c:otherwise>
								            	</c:choose>
								            	 <a href="javascript:void(0)" class="openCart" onclick="openCart('${discount.num}')"><img src="/resources/img/free-icon-shopping-bag-7688439.png" width="20px" /></a>
								            	
								            </sec:authorize>
		            					</div>
					                <div class="boardname">${discount.boardname}</div>
					                <div class="discount">
					                <div class="sale">
					                	<fmt:formatNumber value="${discount.price - (discount.price * (discount.sale / 100))}" type="number" pattern="#,###원"/>
					                </div>	
					                <div class="liner">
					                	<fmt:formatNumber value="${discount.price}" type="number" pattern="#,###원"/>
					                </div>
					                </div>
					            </li>
					        </c:forEach>
					    </ul>
					</div>
				    </c:if>
					    <c:if test="${empty discount}">
					    	<h2>오늘의 특가 상품이 존재하지 않습니다!</h2>
					    </c:if>    
				  <label id="countdown">
				  	<img src="/resources/img/time.png" width="30px;"/>
				  	<div id="time"></div>
				  </label>
                </div>
            </div>
        </div>
        <!-- Featurs Section End -->
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

      <script>
	  $(document).ready(function() {
		    var currentTime = new Date();
		    var countdownEndTime = new Date(currentTime);
		    countdownEndTime.setHours(24, 0, 0, 0);
	
		    function updateCountdown() {
		      currentTime = new Date();
		      var remainingTime = countdownEndTime - currentTime;
	
		      var hours = Math.floor(remainingTime / (60 * 60 * 1000));
		      var minutes = Math.floor((remainingTime % (60 * 60 * 1000)) / (60 * 1000));
		      var seconds = Math.floor((remainingTime % (60 * 1000)) / 1000);
		      
		      hours = ('0' + hours).slice(-2);
	          minutes = ('0' + minutes).slice(-2);
	          seconds = ('0' + seconds).slice(-2);
		      $("#time").html(hours+" : " +minutes+" : "+ seconds);
		    }
	
		    setInterval(updateCountdown, 1000);
		  });
	  </script>    
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