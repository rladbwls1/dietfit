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
		<script src="/resources/js/member2.js"></script>
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		<script src="/resources/js/food.js"></script>
    	<style>
    		.boardname{
			    white-space: nowrap;
			    overflow: hidden;
			    text-overflow: ellipsis;
    		}
    		.wish{
    			text-align: right;
    		}
    		.product{
			    width: fit-content;
			}
			.images{
			    width: -webkit-fill-available;
			}
			.image{
			    width: 100%;
			}
			#top_Con{
				display: flex;
			}
			#top_Div{
			    width: 50%;
			}
			#content{
				background: rgba(0,0,0,.03);
				width: 100%;
			}
			#box{
				display: flex;
			}
			.box_box{
				flex: 1;
			}
			.product_img{
				width: 80px;
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
        <jsp:include page="../../navbar.jsp"/>
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
                        <h1 class="mb-5 display-3 text-primary">하루 세끼 영양밸런스</h1>
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
        	<div>
        	 <div class="container-fluid service py-5" style="padding-bottom: 0 !important;">
            	<div id="content" class="container py-5">
            	<button onclick="window.location.href='/member/eat?kcal=${kc}'">전체 상품 변경</button>
            	<div id="box">
            	<div class="box_box">
				<c:forEach var="food" items="${mo_re}" varStatus="loop">
				    <h2>아침</h2>
				    <div id="mo_${loop.index}">
				    <div class="product" onclick="management('${food.pimg.companyid}','${food.pimg.category}','${food.pimg.category2}','${food.pimg.flavor}');">
				    <img class="product_img" src="/resources/p_img/${food.pimg.companyid}${food.pimg.category}${food.pimg.category2}${food.pimg.flavor}F${food.pimg.num}${food.pimg.ext}"/>
				    <div>${food.product}</div>
				    </div>
				    <div id="mo_${loop.index}_m">${food.productinfo.kcal}</div>
				    <div id="mo_${loop.index}_p">${food.price}</div>
				    <input type="hidden" name="fonum" value="${food.pimg.companyid}${food.pimg.category}${food.pimg.category2}${food.pimg.flavor}">
				    </div>
				    <div><button type="button" onclick="modify('${mo_minkcal}', '${mo_maxkcal}', '${food.productinfo.productid}','mo_${loop.index}', 'mo');" id="modify">다른 식품 추천</button></div>
				    <c:set var="totalKcal" value="${totalKcal + food.productinfo.kcal}" scope="page" />
				    <div id="result"></div>
				</c:forEach>
				</div>
				<hr>
				<div class="box_box">
				<c:forEach var="food" items="${br_re}" varStatus="loop">
				    <h2>점심</h2>
				    <div id="br_${loop.index}">
				    <div class="product" onclick="management('${food.pimg.companyid}','${food.pimg.category}','${food.pimg.category2}','${food.pimg.flavor}');">
				    <img class="product_img" src="/resources/p_img/${food.pimg.companyid}${food.pimg.category}${food.pimg.category2}${food.pimg.flavor}F${food.pimg.num}${food.pimg.ext}"/>
				    <div>${food.product}</div>
				    </div>
				    <div id="br_${loop.index}_m">${food.productinfo.kcal}</div>
				    <div id="mo_${loop.index}_p">${food.price}</div>
				    <input type="hidden" name="fonum" value="${food.pimg.companyid}${food.pimg.category}${food.pimg.category2}${food.pimg.flavor}">
				    </div>
				    <div><button type="button" onclick="modify('${br_minkcal}', '${br_maxkcal}', '${food.productinfo.productid}','br_${loop.index}', 'br');" id="modify">다른 식품 추천</button></div>
				    <input type="hidden" id="mo" value="${food.productinfo.productid}"/>
				    <c:set var="totalKcal" value="${totalKcal + food.productinfo.kcal}" scope="page" />
				</c:forEach>
				</div>
				<hr>
				<div class="box_box">
				<c:forEach var="food" items="${de_re}" varStatus="loop">
				    <h2>저녁</h2>
				    <div id="de_${loop.index}">
				    <div class="product" onclick="management('${food.pimg.companyid}','${food.pimg.category}','${food.pimg.category2}','${food.pimg.flavor}');">
				    <img class="product_img" src="/resources/p_img/${food.pimg.companyid}${food.pimg.category}${food.pimg.category2}${food.pimg.flavor}F${food.pimg.num}${food.pimg.ext}"/>
				    <div>${food.product}</div>
				    </div>
				    <div id="de_${loop.index}_m">${food.productinfo.kcal}</div>
				    <div id="mo_${loop.index}_p">${food.price}</div>
				    <input type="hidden" name="fonum" value="${food.pimg.companyid}${food.pimg.category}${food.pimg.category2}${food.pimg.flavor}">
				    </div>
				    <div><button type="button" onclick="modify('${de_minkcal}', '${de_maxkcal}', '${food.productinfo.productid}','de_${loop.index}', 'de');" id="modify">다른 식품 추천</button></div>
				    <c:set var="totalKcal" value="${totalKcal + food.productinfo.kcal}" scope="page" />
				</c:forEach>
				</div>
				<hr>
				<div class="box_box">
				<c:forEach var="food" items="${se_re}" varStatus="loop">
				    <h2>간식</h2>
				    <div id="se_${loop.index}">
				    <div class="product" onclick="management('${food.pimg.companyid}','${food.pimg.category}','${food.pimg.category2}','${food.pimg.flavor}');">
				    <img class="product_img" src="/resources/p_img/${food.pimg.companyid}${food.pimg.category}${food.pimg.category2}${food.pimg.flavor}F${food.pimg.num}${food.pimg.ext}"/>
				    <div>${food.product}</div>
				    </div>
				    <div id="se_${loop.index}_m">${food.productinfo.kcal}</div>
				    <div id="mo_${loop.index}_p">${food.price}</div>
				    <input type="hidden" name="fonum" value="${food.pimg.companyid}${food.pimg.category}${food.pimg.category2}${food.pimg.flavor}">
				    </div>
				    <div><button type="button" onclick="modify('${se_minkcal}', '${se_maxkcal}', '${food.productinfo.productid}','se_${loop.index}', 'se');" id="modify">다른 식품 추천</button></div>
				    <c:set var="totalKcal" value="${totalKcal + food.productinfo.kcal}" scope="page" />
				</c:forEach>
				</div>
				</div>
				<hr>
				<div style="display: flex;">
				Total Kcal: 
				<div id="totalKcal">
				${totalKcal}
				</div>
				</div>
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
			    <div class="modal-dialog modal-lg" role="document">
			        <div class="modal-content">
			            <div class="modal-header">
			                <h5 class="modal-title" id="myModalLabel">다른 제품 추천</h5>
			                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                    <span aria-hidden="true">&times;</span>
			                </button>
			            </div>
			            <div class="modal-body" id="modalBody">
			            </div>
			        </div>
			    </div>
			</div>
			<input type="checkbox" id="chk">정기배송으로 받아보시겠어요?
			<button onclick="cartSelectedItems2();">전체 상품 장바구니 담기</button>
			</div>
		  </div>	
        </div>
        <!-- Featurs Section End -->
        <!-- Footer Start -->
        <jsp:include page="../../footer.jsp"/>
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