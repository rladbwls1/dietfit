<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<script src="/resources/js/member2.js"></script>
<script src="/resources/js/food.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<html>
<head>
    <title>Product List</title>
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
        table {
            width: 100%;
            border-collapse: collapse;
           	margin-top: 200px;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        img {
            display: block;
            margin: 0 auto;
        }
        #content{
        	width: 60%;
        	margin: 0 auto;
        }
        .aa{
        	margin-top: 150px;
        }
        .product_img img{
        	width: -webkit-fill-available !important;
        	height: 215px !important;
        }
        #page{
        	display: flex;
        	justify-content: center;
        	margin-top: 30px;
        }
        #page button{
        	width: 35px;
        	height: 35px;
        	border: 1px solid lightgray;
        	background-color: white;
        	font-weight: 600;
        }
        .cart_h{
        	display: flex;
        	justify-content: right;
        }
        .boardname{
		    white-space: nowrap;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    text-align: center;
		    text-decoration: none !important;
			margin-top: 15px;	    
   		}
   		.heart{
   			margin-left: 10px;
   		}
   		.hr{
   			margin: 10px 0 30px 0;
   		}
   		.price{
   			text-align: center;
   		}
   		#title{
   			text-align: center;
   			font-size: 25px;
   			margin-bottom: 20px;
   		}
   		#title i{
   			color: #50AB89;
   			font-weight: 600; 
   		}
   		#category{
   			display: flex;
   		}
   		#category a button{
   			background-color: white;
   			border: none;
   			padding: 0 15px;
   		}
   		#category a button:not(:last-child){
   			border-right: 1px solid lightgray;
   		}
   		#cate2{
   			display: flex;
   			list-style: none;
   			padding-left: 15px !important;
   		}
   		.active2{
   			background-color: #FFDB58 !important;
   		}
   		.active2 span{
   			color: white !important;
   		}
   		.big_cate{
   			
   		}
   		.li1{
   			background-color: #F4F6F8;
   			margin-right: 10px;
   			width: 130px !important;
   			height: 40px !important;
   			border-radius: 20px;
   			padding: 7px 12px;
   			text-align: center;
   		}
   		.li1{
   		
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
        
        <div class="container-fluid py-5 mb-5 hero-header">
            <div class="container py-5">
                <div class="row g-5 align-items-center">
                    <div class="col-md-12 col-lg-7">
                        <h4 class="mb-3 text-secondary">DIETFIT</h4>
                        <h1 class="mb-5 display-3 text-primary">전체상품</h1>
                    </div>
                    <div class="col-md-12 col-lg-5">
                        <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active rounded">
                                    <img src="/resources/img/dietfitmain1.jpg" class="img-fluid w-100 h-100 bg-secondary rounded" alt="First slide">
                                </div>
                                <div class="carousel-item rounded">
                                    <img src="/resources/img/dietfitmain2.jpg" class="img-fluid w-100 h-100 rounded" alt="Second slide">
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
        
        
        <!-- Modal Search End -->
    <div id="content">    
	<div class="container aa">
		  <div>
                        <div class="col-lg-4 text-start">
                            <h1>Our Products</h1>
                        </div>
                        <div class="big_cate">
                            <div id="cate2">
                                <div>
                                    <a href="/member/productList/popular">
                                        <div class="li1" style="width: 130px;${category == null ? 'background-color: #FFDB58; color:white;' : ''}">전체상품</div>
                                    </a>
                                </div>
                                <div>
                                    <a href="/member/productList/popular/1">
                                        <div class="li1" style="width: 130px; ${category == 1 ? 'background-color: #FFDB58; color:white;' : ''}">식사</div>
                                    </a>
                                </div>
                                <div>
                                    <a href="/member/productList/popular/2">
                                        <div class="li1" style="width: 130px; ${category == 2 ? 'background-color: #FFDB58; color:white;' : ''}">식사대용</div>
                                    </a>
                                </div>
                                <div>
                                    <a href="/member/productList/popular/3">
                                        <div class="li1" style="width: 130px; ${category == 3 ? 'background-color: #FFDB58; color:white;' : ''}">간식</div>
                                    </a>
                                </div>
                                <div>
                                    <a href="/member/productList/popular/4">
                                        <div class="li1" style="width: 130px; ${category == 4 ? 'background-color: #FFDB58; color:white;' : ''}">음료</div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
		<div id="title">전체 상품 카테고리에 <i>${count}</i> 개의 상품이 등록되어 있습니다</div>
		<hr>
		<div id="category">
			<a href ="/member/productList/popular/${category}"><button>인기순</button></a>
			<a href ="/member/productList/recent/${category}"><button>신상품순</button></a>
			<a href ="/member/productList/priceLow/${category}"><button>낮은가격순</button></a>
			<a href ="/member/productList/priceHigh/${category}"><button>높은가격순</button></a>
		</div>
		<hr>
	    <ul class="list-unstyled row">
	         <c:forEach var="product" items="${products}" varStatus="loop">
	            <li class="col-md-3">
	            	<a href="javascript:void(0)" onclick="toDetail('${product.COMPANYID}','${product.CATEGORY}','${product.CATEGORY2}','${product.FLAVOR}')">
	            	<div class="product_img"><img src="${product.IMAGEPATH}" alt="${product.PRODUCT}"></div>
	                <div class="boardname">${product.PRODUCT}</div>
	                </a>
	            	<div class="cart_h">
		            	<div>
		            		<sec:authorize access="isAuthenticated()">
			             	<a href="javascript:void(0)" onclick="openCart('${product.NUM}')"><img src="/resources/img/free-icon-shopping-bag-7688439.png" width="20px" /></a>
			            	</sec:authorize>
		            		<sec:authorize access="isAnonymous()">
			             	<a href="javascript:void(0)" onclick="gotologin()"><img src="/resources/img/free-icon-shopping-bag-7688439.png" width="20px" /></a>
		            		</sec:authorize>
		            	</div>
		            	<div class="heart">
		            		<sec:authorize access="isAnonymous()">
					            <a href="javascript:void(0)" onclick="gotologin()" >
				            		<img src="/resources/img/free-icon-love-7476962.png" width="20px"/>
		            			</a>
				            </sec:authorize>
				            <sec:authorize access="isAuthenticated()">
				            	<c:choose>
				            	<c:when test="${wishList.contains(product.PRODUCT)}">
						            <a href="javascript:void(0)" onclick="removeWishList('${product.PRODUCT}')" >
						            <img src="/resources/img/free-icon-love-4397571.png" width="20px"/>
						            </a>
				            	</c:when>
				            	<c:otherwise>
						            <a href="javascript:void(0)" onclick="addWishList('${product.PRODUCT}')" >
				           		 	<img src="/resources/img/free-icon-love-7476962.png" width="20px"/>
						            </a>
				            	</c:otherwise>
				            	</c:choose>
				            	
				            </sec:authorize>
		            	</div>
		            </div>	
	            	<div class="price">
	            		<c:if test="${product.SALE!=0}">
						<span style="color:gray;text-decoration: line-through;"><fmt:formatNumber value="${product.ORIPRICE}" type="number" pattern="#,###원"/></span><br/><span style="color:red">${product.SALE}%</span> 
						</c:if><fmt:formatNumber value="${product.PRICE }" type="number" pattern="#,###원"/>
	            	</div>
	            </li>
	             <c:if test="${loop.count % 4 == 0 && loop.count != 0}">
			        <hr class="hr">
			    </c:if>
	        </c:forEach>
	    </ul>
	</div>
	<!-- 페이지 -->
	<div id="page">
    <c:if test="${count>0 }">
		<c:if test="${endPage > pageCount }">
			<c:set var="endPage" value="${pageCount}"/>
		</c:if>
       	<c:if test="${startPage > 10 }">
                   <a href="javascript:window.location='/member/productList/${orderBy}/${category}?pageNum=${startPage - 10}'" style="text-decoration-line : none; color:black;" ><button>이전</button></a>
       	</c:if>
       
       	<c:forEach var="i" begin="${startPage}" end="${endPage}">
       		<c:choose>
       			<c:when test="${i==currentPage}">
                        <a href="javascript:window.location='/member/productList/${orderBy}/${category}?pageNum=${i}'"><button style="text-decoration-line : none; color:#50AB89;">${i}</button></a>
       			</c:when>
       			<c:otherwise>
                        <a href="javascript:window.location='/member/productList/${orderBy}/${category}?pageNum=${i}'"><button style="text-decoration-line : none; color:gray;">${i}</button></a>
       			</c:otherwise>
       		</c:choose>
       	</c:forEach>
      		<c:if test="${endPage < pageCount }">
                   <a href="javascript:window.location='/member/productList/${orderBy}/${category}?pageNum=${startPage + 10}'" style="text-decoration-line : none; color:black;" ><button>다음</button></a>
      		</c:if>
    </c:if>
    </div>
    </div>
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
