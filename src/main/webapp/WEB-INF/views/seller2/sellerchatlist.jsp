<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<script src="/resources/js/jquery-1.10.2.min.js"></script>
		<script src="/resources/js/socket.io.js"></script>
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
			.reportButton {
	            background-color: #ff4500;
	            color: white;
	            padding: 8px 12px;
	            border: none;
	            border-radius: 4px;
	            cursor: pointer;
	            font-size: 14px;
	        }
	
	        .reportButton:hover {
	            background-color: #d14836;
	        }
        </style>
    </head>
    <body class="sb-nav-fixed">
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
                        <h1 class="mt-4">상품 문의 목록</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                문의
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
							        <thead>
							            <tr>
							                <th>방번호</th>
							                <th>채팅방</th>
							                <th>문의상품</th>
							                <th>신고하기</th>
							            </tr>
							        </thead>
							        <tbody>
							            <c:forEach var="chat" items="${chatlist}">
							                <tr>
							                    <td>${chat.roomnum}(${chat.id})</td>
							                    <td>
							                        <button class="chatroomButton" type="button" onclick="openchatroom('${chat.roomnum}');">문의 입장</button>
							                    </td>
							                    <td>${chat.product}</td>
							                    <td>
							                        <button class="reportButton" type="button" onclick="openDiscountFormPopup('${chat.roomnum}');">신고</button>
							                    </td>
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
	        function openDiscountFormPopup(roomnum) {
	            var popupUrl = '/seller/chatreport?roomnum=' + roomnum;
	            var popupWindow = window.open(popupUrl, '_blank', 'width=600, height=400, scrollbars=yes');
	
	            if (popupWindow) {
	                popupWindow.focus();
	            }
	        }
	        
	        function openchatroom(roomnum) {
	            var popupUrl = '/seller/SELLERCHAT?roomnum=' + roomnum;
	            var popupWindow = window.open(popupUrl, '_blank', 'width=900, height=500, scrollbars=yes');
	
	            if (popupWindow) {
	                popupWindow.focus();
	            }
	        }
	    </script>
    </body>
</html>