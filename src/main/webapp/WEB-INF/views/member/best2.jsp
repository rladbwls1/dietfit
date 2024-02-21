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
		<script src="/resources/js/member2.js"></script>
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
    		#best_btn{
    			display: flex;
    			justify-content: center;
    		}
    		.b1{
    			text-align: center;
    			height: 40px;
    			width: 300px;
    			border: 1px solid lightgray;
    			line-height: 40px;
    		}
    		.b2{
    			border-width: 1px 1px 1px 0;
    			width: 300px;
    			height: 40px;
    			background-color: #50AB89;
    			border: 1px solid lightgray;
    			text-align: center;
    			line-height: 40px;
    			color: white;
    		}
    		#content{
    			padding-top: 0 !important;
    		}
    		.price{
    			display: flex;
   			    justify-content: center;
    		}
    		.sale{
    			font-size: 20px;
    			color: black;
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
                        <h1 class="mb-5 display-3 text-primary">best 상품</h1>
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
        <div id="best_btn">
        	<div onclick="window.location.href='/member/best'" class="b1">월간 베스트</div>
        	<div onclick="window.location.href='/member/best2'" class="b2">주간 베스트</div>
        </div>
        <!-- Featurs Section Start -->
        <div class="container-fluid featurs py-5" id="content">
            <div class="container py-5">
                <div class="row g-4">
                <hr>
                <h4>주간 베스트</h4>
                	<c:if test="${not empty best}">
					        <c:forEach var="best" items="${best}">
					              <div class="col-md-6 col-lg-3">
			                        <div class="featurs-item text-center rounded bg-light p-4" >
			                            <div class="featurs-content text-center">
            						        <div onclick="toDetail('${best.companyid}','${best.category}','${best.category2}','${best.flavor}')"><img style="width: -webkit-fill-available; height: 258px;" src="${best.imagePath}"/></div>
            						        <div class="wish">
							                <sec:authorize access="isAnonymous()">
								            	<a href="javascript:void(0)" class="openCart" onclick="gotologin()">
								            		<img src="/resources/img/free-icon-shopping-bag-7688439.png" width="20px" />
							            		</a>
									            <a href="javascript:void(0)" onclick="gotologin()" >
										            <img src="/resources/img/free-icon-love-7476962.png" width="20px"/>
												</a>
								            </sec:authorize>
								            <sec:authorize access="isAuthenticated()">
								            	<c:choose>
								            	<c:when test="${wishList.contains(best.product)}">
										            <a href="javascript:void(0)" onclick="removeWishList('${best.product}')" >
										            <img src="/resources/img/free-icon-love-4397571.png" width="20px"/>
										            </a>
								            	</c:when>
								            	<c:otherwise>
										            <a href="javascript:void(0)" onclick="addWishList('${best.product}')" >
								           		 	<img src="/resources/img/free-icon-love-7476962.png" width="20px"/>
										            </a>
								            	</c:otherwise>
								            	</c:choose>
								            	 <a href="javascript:void(0)" onclick="openCart('${best.num}')"><img src="/resources/img/free-icon-shopping-bag-7688439.png" width="20px" /></a>
								            	
								            </sec:authorize>
		            					</div>
							                <div class="boardname">${best.boardname}</div>
							                <div class="price">
				                                 	<c:if test="${best.sale != 0}">
					                                 <div class="sale">
					                                 	<fmt:formatNumber value="${best.price - (best.price * (best.sale / 100))}" type="number" pattern="#,###원"/>
					                            	</div>
				                            		</c:if>
							               			<div class="dis_price" style="${best.sale != 0 ? 'text-decoration: line-through;' : 'font-size: 20px; color: black;'}"><fmt:formatNumber value="${best.price}" type="number" pattern="#,###원"/></div>
					                        </div>
			                            </div>
			                        </div>
			                      </div>
					        </c:forEach>
					</c:if>
					<c:if test="${empty best}">
						<h2>베스트 상품이 존재하지 않습니다</h2>
					</c:if>
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