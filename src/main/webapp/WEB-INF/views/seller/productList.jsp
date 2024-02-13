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
        <style>
        	.deletebutton {
        		background-color: #ff4500;
	            color: white;
	            padding: 8px 11px;
	            border: none;
	            border-radius: 4px;	
	            cursor: pointer;
	            font-size: 14px;
        	}
	        table {
	            width: 100%;
	            border-collapse: collapse;
	            margin-top: 20px;
	        }
	        th, td {
	            border: 1px solid #dddddd;
	            text-align: left;
	            padding: 8px;
	        }
	        img {
	            display: block;
	            margin: 0 auto;
	            max-width: 100px;
	            max-height: 100px;
	        }
	        /* 상품 추가 링크 스타일 */
			a.product-add-link {
			    display: inline-block;
			    padding: 5px 10px;
			    background-color: #355FAD; /* 배경색 */
			    color: #fff; /* 글자색 */
			    text-decoration: none;
			    border-radius: 4px;
			    transition: background-color 0.3s ease;
			}
			
			a.product-add-link:hover {
			    background-color: #2B4C8A; /* 호버 시 배경색 변경 */
			}
			/* 재고 버튼 스타일 */
			button.stockbutton {
			    padding: 5px 10px;
			    background-color: #355FAD; /* 배경색 */
			    color: #fff; /* 글자색 */
			    border: none;
			    border-radius: 4px;
			    cursor: pointer;
			    transition: background-color 0.3s ease;
			}
			
			button.stockbutton:hover {
			    background-color: #2B4C8A; /* 호버 시 배경색 변경 */
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
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                정산
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/seller/sales">순매출현황</a>
                                    <a class="nav-link" href="/seller/salesranking">판매량순위</a>
                                </nav>
                            </div>
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
                        <h1 class="mt-4">상품 목록</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <a href="<c:url value='productadd?companyid=${companyid}'/>" class="product-add-link">상품추가</a>
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
							            <tr>
							                <th>Image</th>
							                <th>Product Name</th>
							                <th>Price</th>
							                <th>Stock</th>
							                <th>Delete</th>
							            </tr>
							        </thead>
							        <tbody>
									    <c:forEach var="product" items="${products}">
									        <tr>
									            <td>
									                <img src="${product.imagePath}" alt="${product.product}">
									            </td>
									            <td><a href="<c:url value='/seller/product/details/${product.companyid}/${product.category}/${product.category2}/${product.flavor}'/>">${product.product}</a></td>
									            <td>${product.price}</td>
									            <td>
												   <button class="stockbutton" type="button" onclick="stockbutton('${product.companyid}${product.category}${product.category2}${product.flavor}');">${product.stock}</button>
												<td>
													<button type="button" class="deletebutton" onclick="deleteProduct('${product.companyid}', '${product.category}', '${product.category2}', '${product.flavor}');">상품삭제</button>
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
