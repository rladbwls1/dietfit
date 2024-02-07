<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>판매자 관리페이지</title>
        <link href="/resources/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <style>
		    .form-container {
		        max-width: 480px;
		        margin: 90px auto 0; /* 20px의 top margin을 추가하였습니다. */
		        padding: 20px;
		        border-radius: 16px;
		        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		        background-color: #fff;
		    }
		
		    form {
		        display: flex;
		        flex-direction: column;
		        align-items: center;
		    }
		
		    label {
		        margin-bottom: 8px;
		        color: #333;
		        font-weight: bold;
		    }
		
		    input {
		        width: 100%;
		        box-sizing: border-box;
		        padding: 10px;
		        margin-bottom: 15px;
		        border: 1px solid #ccc;
		        border-radius: 4px;
		        font-size: 14px;
		    }
		
		    input[type="password"] {
		        margin-bottom: 20px;
		    }
		
		    button {
		        width: 100%;
		        padding: 12px;
		        border: none;
		        border-radius: 4px;
		        cursor: pointer;
		        font-size: 16px;
		        color: #fff;
		        transition: background-color 0.3s ease;
		    }
		
		    button[type="button"] {
		        background-color: #AE1A1A;
		    }
		
		    button[type="button"]:hover {
		        background-color: #8A1515;
		    }
		
		    button[type="submit"] {
		        background-color: #355FAD;
		    }
		
		    button[type="submit"]:hover {
		        background-color: #2B4C8A;
		    }
		</style>
    </head>
    <body>
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
                            <a class="nav-link" href="/seller/calculate">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
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
                        <h1 class="mt-4">판매자 정보수정</h1>
					    <div class="form-container">
					        <form action="/seller/modifyPro" method="post">
					            <label for="id">ID</label>
					            <input type="text" id="id" name="id" value="${id}" readonly>
					
					            <label for="pw">비밀번호</label>
					            <input type="password" id="pw" name="pw" placeholder="비밀번호를 변경하실 경우에만 변경하실 비밀번호를 입력해주세요">
					
					            <label for="name">이름</label>
					            <input type="text" id="name" name="name" value="${name}" required>
					
					            <label for="nic">닉네임</label>
					            <input type="text" id="nic" name="nic" value="${nic}" required>
					
					            <label for="email">이메일</label>
					            <input type="email" id="email" name="email" value="${email}" required>
					
					            <button type="submit">수정</button>
					            <a type="button" onclick="location.href='/seller/withdrawpro';">탈퇴</a>
					        </form>
					    </div>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/resources/js/scripts.js"></script>
    </body>
</html>