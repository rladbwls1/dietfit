<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	        body {
	            font-family: 'Arial', sans-serif;
	            background-color: #f8f9fa;
	        }
	
	        .form-container {
	            max-width: 600px;
	            margin: 0 auto;
	            background-color: #fff;
	            padding: 20px;
	            border-radius: 8px;
	            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	            margin-top: 32px;
	        }
	
	        form {
	            display: flex;
	            flex-direction: column;
	        }
	
	        label {
	            margin-bottom: 8px;
	            font-weight: bold;
	        }
	
	        input, select, textarea {
	            margin-bottom: 16px;
	            padding: 10px;
	            width: 100%; /* 입력 칸 크기 통일을 위한 설정 */
	            border: 1px solid #ccc;
	            border-radius: 4px;
	            box-sizing: border-box;
	        }
	
	        textarea {
	            resize: vertical;
	            height : 80px;
	        }
	
	        input[type="submit"] {
	            background-color: #355FAD;
	            color: #fff;
	            cursor: pointer;
	            padding: 10px 20px;
	            border: none;
	            border-radius: 4px;
	        }
	        input[type="submit"]:hover{
		        background-color: #2B4C8A;
	        }
	    </style>
    </head>
    <body>
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
                        <h1 class="mt-4">쿠폰요청</h1>
					    <div class="form-container">
							    <form action="/seller/coupon/requestPro" method="post">
							        <table>
								        <tr>
								            <td><label for="coupon">쿠폰이름</label></td>
								            <td><input type="text" id="coupon" name="coupon" required></td>
								        </tr>
								        <tr>
								            <td><label for="createdate">사용시작일</label></td>
								            <td><input type="date" id="createdate" name="createdate" required></td>
								        </tr>
								        <tr>
								            <td><label for="deletedate">만료일</label></td>
								            <td><input type="date" id="deletedate" name="deletedate" required></td>
								        </tr>
								        <tr>
								            <td><label for="companyid">회사id</label></td>
								            <td><input type="text" id="companyid" name="companyid" value="${companyId}" readonly></td>
								        </tr>
								        <tr>
								            <td><label for="download">총다운로드횟수</label></td>
								            <td><input type="number" id="download" name="download" required></td>
								        </tr>
								        <tr>
								            <td><label for="minprice">최소주문금액</label></td>
								            <td><input type="number" id="minprice" name="minprice" required></td>
								        </tr>
								        <tr>
								            <td><label for="discount">할인율(%)</label></td>
								            <td><input type="number" id="discount" name="discount" required></td>
								        </tr>
								        <tr>
								            <td><label for="boardnums">적용가능상품</label></td>
								            <td>
								                <select id="boardnums" name="boardnums" required>
								                    <optgroup label="전체 상품">
								                        <option value="all">전체 상품</option>
								                    </optgroup>
										            <optgroup label="식사">
										                <option value="11">도시락</option>
										                <option value="12">밥</option>
										                <option value="13">죽</option>
										                <option value="14">면</option>
										                <option value="15">밀키트</option>
										            </optgroup>
										            <optgroup label="식사대용">
											            <option value="21">샐러드</option>
											            <option value="22">닭가슴살</option>
											            <option value="23">가공품(핫바/소시지/핫도그)</option>
											            <option value="24">분식,만두</option>
											            <option value="25">식재료</option>
											            <option value="26">계란</option>
											            <option value="29">기타</option>
										            </optgroup>
										            <optgroup label="간식">
											            <option value="31">쿠키,칩등</option>
											            <option value="32">초콜릿</option>
											            <option value="33">떡</option>
											            <option value="34">빵</option>
											            <option value="35">구황작물</option>
											            <option value="36">프로틴바 등 견과류(오트밀)</option>
											            <option value="39">기타</option>
										            </optgroup>
										            <optgroup label="음료">
											            <option value="41">쉐이크</option>
											            <option value="42">주스</option>
											            <option value="43">티종류</option>
											            <option value="44">탄산수</option>
											            <option value="49">기타</option>
										            </optgroup>
										        </select>
									        </td>
								        </tr>
								        <tr>
								            <td><label for="content">상세설명</label></td>
								            <td><textarea id="content" name="content" required></textarea></td>
								        </tr>
								    </table>
								    <br>
								    <input type='submit' value='신청하기'>
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