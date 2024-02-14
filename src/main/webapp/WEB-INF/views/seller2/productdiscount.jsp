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
        	/* 버튼 기본 스타일 */
			button {
			    display: inline-block;
			    padding: 8px 18px;
			    font-size: 13px;
			    text-align: center;
			    text-decoration: none;
			    cursor: pointer;
			    border: none;
			    color: #fff;
			    background-color: #355FAD;
			    border-radius: 5px;
			    transition: background-color 0.3s, color 0.3s;
			}
			
			/* 버튼 호버 효과 */
			button:hover {
			    background-color: #2B4C8A;
			    color: #fff;
			}
        </style>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/seller/home">판매자 관리 페이지</a>
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
                        <h1 class="mt-4">할인 설정</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                할인
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
							                <th>상품이름</th>
							                <th>카테고리</th>
							                <th>재고</th>
							                <th>유통기한</th>
							                <th>가격</th>
							                <th>할인</th>
							            </tr>
                                    </thead>
                                    <tbody>
							            <c:forEach var="product" items="${companyProducts}">
							                <tr>
							                    <td>${product.product}</td>
							                    <c:choose>
								                    <c:when test="${product.category == 11}">
								                         <td>도시락</td>
								                    </c:when>
								                    <c:when test="${product.category == 12}">
								                         <td>밥</td>
								                    </c:when>
								                    <c:when test="${product.category == 13}">
								                         <td>죽</td>
								                    </c:when>
								                    <c:when test="${product.category == 14}">
								                         <td>면</td>
								                    </c:when>
								                    <c:when test="${product.category == 15}">
								                         <td>밀키트</td>
								                    </c:when>
								                    <c:when test="${product.category == 21}">
								                         <td>샐러드</td>
								                    </c:when>
								                    <c:when test="${product.category == 22}">
								                         <td>닭가슴살</td>
								                    </c:when>
								                    <c:when test="${product.category == 23}">
								                         <td>가공품(핫바/소시지/핫도그)</td>
								                    </c:when>
								                    <c:when test="${product.category == 24}">
								                         <td>분식,만두</td>
								                    </c:when>
								                    <c:when test="${product.category == 25}">
								                         <td>식재료</td>
								                    </c:when>
								                    <c:when test="${product.category == 26}">
								                         <td>계란</td>
								                    </c:when>
								                    <c:when test="${product.category == 29}">
								                         <td>식사대용 기타</td>
								                    </c:when>
								                    <c:when test="${product.category == 31}">
								                         <td>쿠키, 칩등</td>
								                    </c:when>
								                    <c:when test="${product.category == 32}">
								                         <td>초콜릿</td>
								                    </c:when>
								                    <c:when test="${product.category == 33}">
								                         <td>떡</td>
								                    </c:when>
								                    <c:when test="${product.category == 34}">
								                         <td>빵</td>
								                    </c:when>
								                    <c:when test="${product.category == 35}">
								                         <td>구황작물</td>
								                    </c:when>
								                    <c:when test="${product.category == 36}">
								                         <td>프로틴바 등 견과류(오트밀)</td>
								                    </c:when>
								                    <c:when test="${product.category == 39}">
								                         <td>간식 기타</td>
								                    </c:when>
								                    <c:when test="${product.category == 41}">
								                         <td>쉐이크</td>
								                    </c:when>
								                    <c:when test="${product.category == 42}">
								                         <td>주스</td>
								                    </c:when>
								                    <c:when test="${product.category == 43}">
								                         <td>티</td>
								                    </c:when>
								                    <c:when test="${product.category == 44}">
								                         <td>탄산수</td>
								                    </c:when>
								                    <c:when test="${product.category == 49}">
								                         <td>음료 기타</td>
								                    </c:when>
								                </c:choose>
							                    <td>${product.stock}</td>
							                    <td>
							                        <fmt:formatDate value="${product.expiry}" pattern="yyyy-MM-dd"/>
							                    </td>
							                    <td>${product.price}</td>
							                    <td><button onclick="openDiscountFormPopup('${product.num}')">할인율 설정</button></td>
							                </tr>
							            </c:forEach>
							        </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="/resources/js/datatables-simple-demo.js"></script>
        <script>
	        function openDiscountFormPopup(num) {
	            var popupUrl = '/seller/discountForm?num=' + num;
	            var popupWindow = window.open(popupUrl, '_blank', 'width=600, height=450, scrollbars=yes');
	            
	            if (popupWindow) {
	                popupWindow.focus();
	            }
	        }
	    </script>
    </body>
</html>
