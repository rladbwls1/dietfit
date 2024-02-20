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
        <script type="text/javascript">
		    window.onload = function() {
		        var message = "${successMessage}";
		        if(message) {
		            alert(message);
		        }
		    }
		</script>
        <style>
	        body {
	            font-family: Arial, sans-serif;
	        }
	        table {
	            width: 100%;
	            border-collapse: collapse;
	            margin-top: 20px;
	        }
	        th, td {
	            border: 1px solid #ddd;
	            padding: 8px;
	            text-align: left;
	        }
	        th {
	            background-color: #f2f2f2;
	        }
	        button {
	            background-color: #355FAD;
	            color: white;
	            padding: 5px 10px;
	            border: none;
	            border-radius: 4px;
	            cursor: pointer;
	            text-align: center;
	            text-decoration: none;
	            display: inline-block;
	            font-size: 14px;
	            margin-top:3px;
	        }
	        button:hover {
	            background-color: #2B4C8A;
	        }
	        img {
	            width: 100px;
	            height: auto;
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
                        <h1 class="mt-4">광고 신청</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <a href="seller/commercail?companyid=${companyid}"><button>광고 신청하기</button></a>
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
							            <tr>
							                <th>숫자</th>
											<th>광고명</th>
											<th>광고 시작일</th>
											<th>광고 종료일</th>
											<th>광고 이미지</th>
											<th>관리자 승인</th>
							            </tr>
							        </thead>
							        <tbody>
									    <c:forEach var="commercail" items="${commercail}">
											<tr>
												<td>${commercail.num}</td>
												<td>${commercail.comname}</td>
												<td><fmt:formatDate value="${commercail.startdate}" pattern="yyyy-MM-dd"/></td>
												<td><fmt:formatDate value="${commercail.enddate}" pattern="yyyy-MM-dd"/></td>
												<td>
													<img src="/resources/comimg/${commercail.comfile}"/>
												</td>
												<td>
													<c:choose>
									                     <c:when test="${commercail.admincheck == 0}">
									                         접수 완료
									                         <form action="commdelect" method="post">
									                         	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
									                         	<input type="hidden" name="companyid" value="${companyid}">
																<input type="hidden" name="num" value="${commercail.num}">
																<input type="hidden" name="comfile" value="${commercail.comfile}">
													            <button type="submit" name="action">취소하기</button>
													        </form>
													        <form action="commupdate" method="post">
													        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
													        	<input type="hidden" name="companyid" value="${companyid}">
																<input type="hidden" name="num" value="${commercail.num}">
																<input type="hidden" name="comfile" value="${commercail.comfile}">
													            <button type="submit" name="action">수정하기</button>
													        </form>
									                     </c:when>
									                     <c:when test="${commercail.admincheck == 1}">
									                         승인 완료
									                     </c:when>
									                     <c:when test="${commercail.admincheck == 2}">
									                         승인 거부 
									                     </c:when>
									                     <c:when test="${commercail.admincheck == 3}">
									                         취소 접수
									                     </c:when>
									                     <c:when test="${commercail.admincheck == 4}">
									                         취소 완료 
									                     </c:when>
								                	</c:choose>
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
        
    </body>
</html>