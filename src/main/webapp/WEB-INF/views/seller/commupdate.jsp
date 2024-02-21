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
        <link href="/resources/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script>
	        function setMinDate() {
	            var today = new Date();
	            today.setDate(today.getDate() + 7);
	            var minDate = today.toISOString().split('T')[0];
	            document.getElementsByName("startdate")[0].setAttribute('min', minDate);
	            document.getElementsByName("enddate")[0].setAttribute('min', minDate);
	        }
	        function removeImage() {
	            document.getElementById('imagePath').style.display = 'none';
	            document.getElementById('delecte').style.display = 'none';
	            document.getElementById('imageUpload').style.display = 'block';
	            document.getElementById('imageDeleted').value = "true";
	        }
	        function previewImage(event) {
	            var reader = new FileReader();
	            reader.onload = function() {
	                var output = document.getElementById('imagePreview');
	                output.src = reader.result;
	                output.style.display = 'block';
	            };
	            reader.readAsDataURL(event.target.files[0]);
	        }
	    </script>
        <style>
		    form {
		        max-width: 480px;
		        margin: 90px auto 0;
		        padding: 20px;
		        border-radius: 9px;
		        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		        background-color: #fff;
		    }
		
		    table {
		        width: 100%;
		    }
		
		    table tr td {
		        padding: 10px 0;
		    }
		
		    input[type="text"],
		    input[type="file"],
		    input[type="date"],
		    input[type="submit"] {
		        width: calc(100% - 20px);
		        padding: 8px;
		        margin-bottom: 10px;
		        border: 1px solid #ccc;
		        border-radius: 4px;
		        box-sizing: border-box;
		    }
		
		    input[type="submit"] {
		        background-color: #355FAD;
		        color: #fff;
		        cursor: pointer;
		        transition: background-color 0.3s;
		    }
		
		    input[type="submit"]:hover {
		        background-color: #2B4C8A;
		    }
		</style>
    </head>
    <body onload="setMinDate()">
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
                        <h1 class="mt-4">광고 수정</h1>
					    <div class="form-container" onload="setMinDate()">
					        <form action="/seller/commupdatepro" method="post" enctype="multipart/form-data">
								<input type="hidden" name="companyid" value="${cdto.companyid}">
								<input type="hidden" name="num" value="${cdto.num}">
									<table>
										<tr>
											<td>광고명<input type="text" name="comname" value = "${cdto.comname }" required></td>
										</tr>
										<tr>
											<td>
												<img id="imagePath" src="${imagePath}" alt="${cdto.comfile}" />
							                    <button type="button" id = "delecte" onclick="removeImage()">❌</button>
							                    <div id="imageUpload" style="display:none;">
											        파일 <input type="file" name="comfile" onchange="previewImage(event)" />
											        <img id="imagePreview" style="display:none; width:200px; height:200px; text-align: center;" />
											    </div>
											</td>
										</tr>
										<tr>	
											<td>
							                    시작 <input type="date" name="startdate" required value="<fmt:formatDate value='${cdto.startdate}' pattern='yyyy-MM-dd' />">
							                    종료 <input type="date" name="enddate" required value="<fmt:formatDate value='${cdto.enddate}' pattern='yyyy-MM-dd' />">
							                </td>
										</tr>
									</table>
								<input type="submit" value="등록">
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