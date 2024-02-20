<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>판매자 관리페이지</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="/resources/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <style>
        	/* 왼쪽 제품 정보 영역 스타일 */
			.product-info {
			    float: left; /* 왼쪽에 위치시키기 */
			    width: 50%; /* 전체 너비의 절반 */
			}
			
			/* 오른쪽 상세설명 영역 스타일 */
			.description {
			    float: right; /* 오른쪽에 위치시키기 */
			    width: 50%; /* 전체 너비의 절반 */
			}
			
			/* 상세설명 타이틀 스타일 */
			.description h3 {
			    margin-top: 0; /* 상단 여백 제거 */
			}
        	/* 제품 상세 정보 컨테이너 스타일 */
			.card-body {
			    padding: 20px;
			    border: 1px solid #ddd; /* 테두리 */
			    border-radius: 5px;
			    background-color: #f9f9f9; /* 배경색 */
			}
			
			/* 제품 상세 정보 테이블 스타일 */
			#datatablesSimple {
			    width: 100%;
			    border-collapse: collapse;
			}
			
			#datatablesSimple td {
			    padding: 8px;
			    border-bottom: 1px solid #ddd; /* 테이블 셀 간의 구분선 */
			}
			
			/* 이미지 스타일 */
			.card-body img {
			    max-width: 100%; /* 이미지 크기 조정 */
			    height: auto;
			    margin-bottom: 10px; /* 이미지 아래 여백 */
			}
			
			.modifybutton button[type="submit"] {
				padding: 5px 10px;
			    background-color: #007bff; /* 파란색 배경색 */
			    color: #fff; /* 흰색 글자색 */
			    border: none;
			    border-radius: 5px;
			    cursor: pointer;
			    transition: background-color 0.3s ease;
			    margin-top: 10px; /* 버튼 위 여백 */
			}
			
			.modifybutton button[type="submit"]:hover {
			    background-color: #0056b3; /* 파란색 (호버 시 배경색 변경) */
			}
			
			.deletebutton button[type="submit"] {
				padding: 5px 10px;
			    background-color: #dc3545; /* 빨간색 배경색 */
			    color: #fff; /* 흰색 글자색 */
			    border: none;
			    border-radius: 5px;
			    cursor: pointer;
			    transition: background-color 0.3s ease;
			    margin-top: 10px; /* 버튼 위 여백 */
			}
			
			.deletebutton button[type="submit"]:hover {
			    background-color: #c82333; /* 빨간색 (호버 시 배경색 변경) */
			}
			
	    </style>
    </head>
    <body class="sb-nav-fixed">
	    <input type="hidden" name="companyid" value="${product.companyid}">
	    <input type="hidden" name="product" value="${product.product}">
	    <input type="hidden" name="category" value="${product.category}"/>
	    <input type="hidden" name="category2" value="${product.category2}"/>
	    <input type="hidden" name="flavor" value="${product.flavor}"/>
	    <input type="hidden" name="companyid" value="${companyid}">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/seller/home">판매자 관리 페이지</a>
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/dietfit/main">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">관리메뉴</div>
                            <a class="nav-link" href="/seller/modify">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                정보수정
                            </a>
                            <a class="nav-link" href="/seller/productdiscount">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                상품 할인 조정
                            </a>
                            <a class="nav-link" href="/seller/coupon/request">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                쿠폰 요청
                            </a>
                            <a class="nav-link" href="/seller/sellerchatlist">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                상품 문의 목록
                            </a>
                            <a class="nav-link" href="/seller/order">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                상품 주문 목록
                            </a>
                            <a class="nav-link" href="/seller/store">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                상품목록
                            </a>
                            <a class="nav-link" href="/seller/sales">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                정산
                            </a>
                             <a class="nav-link" href="/seller/commercailhome">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                광고 신청
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">상품상세</h1>
                        <div class="card mb-4">
                            <div class="card-body">
                            	<div class="product-info">
	                                <table id="productInfoTable">
								    	<tr>
								    		<td>
								    			<c:forEach var="thumbnailPath" items="${thumbnailPaths}">
												    <img src="${thumbnailPath}"> 
												</c:forEach>
								    		</td>
								    	</tr>	
								        <tr>
								            <td>상품이름: ${product.product}</td>
								        </tr>
								        <tr>
								            <td>가격: <fmt:formatNumber value="${product.price}" maxFractionDigits="0"/>원</td>
								        </tr>
								        
								        <tr>
								            <td>배송정보: 
											    <c:choose>
											        <c:when test="${product.delivery == 0}">
											            일반배송, 정기배송
											        </c:when>
											        <c:when test="${product.delivery == 1}">
											            일반배송
											        </c:when>
											        <c:otherwise>
											            기타 배송 옵션
											        </c:otherwise>
											    </c:choose>
											</td>
								        </tr>
								        <tr>
								            <td>조회수: ${product.count}</td>
								        </tr>
								        <tr>
								            <td>유통기한:  <fmt:formatDate value="${product.expiry}" pattern="yyyy-MM-dd"/>
								            </td>
								        </tr>
								    </table>
							    </div>
							        <div class="description">
								        <table>
									        <tr>
									            <td>
									            	<c:forEach var="imagePath" items="${imagePaths}">
											            <div>
											                <img src="${imagePath}"> 
											            </div>
											        </c:forEach>
									            </td>
									        </tr>
								        </table>
							    	</div>
                                <!-- 상품 수정 버튼 -->
							    <form action="/seller/store/Update" method="post" class="modifybutton">
								    <input type="hidden" name="companyid" value="${product.companyid}">
								    <input type="hidden" name="num" value="${product.num}">
								    <input type="hidden" name="isfile" value="${product.isfile}">
								    <input type="hidden" name="category" value="${product.category}">
							        <input type="hidden" name="category2" value="${product.category2}">
							        <input type="hidden" name="flavor" value="${product.flavor}">
								    <button type="submit">상품 수정</button>
								</form>
							
							    <!-- 상품 삭제 버튼 -->
							    <form action="seller/store/Delete" method="post" class="deletebutton">
							        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							        <input type="hidden" name="companyid" value="${product.companyid}">
							    	<input type="hidden" name="category" value="${product.category}">
							    	<input type="hidden" name="category2" value="${product.category2}">
							    	<input type="hidden" name="flavor" value="${product.flavor}">
							        <button type="submit" onclick="return confirm('상품을 삭제하시겠습니까?');">상품 삭제</button>
							    </form>
                            </div>
                        </div>
                    </div>
                    </div>
                </main>
            </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="/resources/js/datatables-simple-demo.js"></script>
        <script>
	        function closewindow2() {
	            window.location.href="/seller/sellerchatlist";
	        }
	    </script>
        <script>
			function deleteProduct(companyid, category, category2, flavor) {
			    if (confirm('정말로 상품을 삭제하시겠습니까?')) {
			        // 확인 눌렀을 때 삭제 요청 보내기
			        location.href = "/seller/productdelete?companyid=" + companyid +
			            "&category=" + category +
			            "&category2=" + category2 +
			            "&flavor=" + flavor;
			    }
			}
			function stockbutton(companyid, category, category2, flavor) {
	            var popupUrl = '/seller/sellerstock?productId=' + companyid;
	            var popupWindow = window.open(popupUrl, '_blank', 'width=900, height=500, scrollbars=yes');
	
	            if (popupWindow) {
	                popupWindow.focus();
	            }
	        }
		</script>
    </body>
</html>

    
