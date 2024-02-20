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
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
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
    	<input type="hidden" name="companyid" id="companyid" value="${companyid}" />
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
                        <h1 class="mt-4">주문 목록</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                주문
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
	                                <thead>
										<tr>
											<th>회원아이디</th>
											<th>주문번호</th>
											<th>결제 날짜</th>
											<th>상품 이름</th>
											<th>상품 가격</th>
											<th>상품 수량</th>
											<th>할인률</th>
											<th>결제 방법</th>
											<th>택배사</th>
											<th>배송</th>
											<th>구매확정여부</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="order" items="${orderDetails}"  varStatus="status">
											<tr>
												<td>${order.memberid }</td>
												<td>${order.orderid }</td>
												<td><fmt:formatDate value="${order.purdate}" pattern="yyyy-MM-dd"/></td>
												<td>${order.product}</td>
												<td><fmt:formatNumber value="${order.price}" maxFractionDigits="0"/>원</td>
												<td>${order.quantity }</td>
												<td>${order.discount } 원</td>
												<td>${order.pay }</td>
												<td>
													<c:choose>
													    <c:when test="${order.courier == null}">
													        송장번호를 먼저 입력해주세요
													    </c:when>
													    <c:otherwise>
														    <c:choose>
														        <c:when test="${order.courier == '04'}">CJ대한통운</c:when>
														        <c:when test="${order.courier == '05'}">한진택배</c:when>
														        <c:when test="${order.courier == '08'}">롯데택배</c:when>
														        <c:when test="${order.courier == '01'}">우체국택배</c:when>
														        <c:when test="${order.courier == '46'}">CU 편의점택배</c:when>
														        <c:when test="${order.courier == '24'}">GS Postbox 택배</c:when>
														        <c:when test="${order.courier == '53'}">농협택배</c:when>
														        <c:when test="${order.courier == '69'}">대림통운</c:when>
														        <c:when test="${order.courier == '94'}">카카오 T 당일배송</c:when>
														    </c:choose>
													    </c:otherwise>
													</c:choose>
												</td>
												<td>
													<c:choose>
													    <c:when test="${order.tracking == null}">
													        <button onclick="openInvoiceInputPopup('${order.orderid}', '${order.productid}', '${order.memberid}')">송장번호 입력</button>
													    </c:when>
													    <c:otherwise>
													        <button onclick="openTracking('${order.courier}', '${order.tracking}')">배송조회</button>
													    </c:otherwise>
													</c:choose>
												</td>
												<td>
												<c:choose>
								                     <c:when test="${order.purchase == 0}">
								                         미확정
								                     </c:when>
								                     <c:when test="${order.purchase == 9}">
								                         확정
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
        <script>
	        function openInvoiceInputPopup(orderid, productid, memberid) {
	            var cid = $('#companyid').val().substr(0, 2);
	            var popupUrl = '/seller/insertpurchase?orderid=' + orderid + '&companyid=' + cid + '&memberid=' + memberid;
	            var popupWindow = window.open(popupUrl, '_blank', 'width=600, height=400, scrollbars=yes');
	
	            var checkPopupClosed = setInterval(function() {
	                if (popupWindow.closed) {
	                    clearInterval(checkPopupClosed);
	                    window.location.reload(); 
	                }
	            }, 500); // 500ms 마다 확인
	
	            if (popupWindow) {
	                popupWindow.focus();
	            }
	        }
	
	        function windowclose2(){
	        	window.location.href="/seller/orderlist";
	        }
	        </script>
	        <script>
	        function openTracking(courier, tracking) {
	            var form = document.createElement("form");
	            form.setAttribute("method", "post");
	            form.setAttribute("action", "http://info.sweettracker.co.kr/tracking/4");
	            form.setAttribute("target", "popupWindow");
	
	            var tKeyField = document.createElement("input");
	            tKeyField.setAttribute("type", "hidden");
	            tKeyField.setAttribute("name", "t_key");
	            tKeyField.setAttribute("value", "O67C0pIqRFuCtfaclrXlxg"); 
	
	            var tCodeField = document.createElement("input");
	            tCodeField.setAttribute("type", "hidden");
	            tCodeField.setAttribute("name", "t_code");
	            tCodeField.setAttribute("value", courier);
	
	            var tInvoiceField = document.createElement("input");
	            tInvoiceField.setAttribute("type", "hidden");
	            tInvoiceField.setAttribute("name", "t_invoice");
	            tInvoiceField.setAttribute("value", tracking);
	
	            form.appendChild(tKeyField);
	            form.appendChild(tCodeField);
	            form.appendChild(tInvoiceField);
	
	            document.body.appendChild(form);
	
	            window.open('', 'popupWindow', 'width=450, height=930, scrollbars=yes');
	            form.submit();
	        }
	        
	        $(document).ready(function() {
	            var lastOrderId = null;
	            var mergeCount = 0;
	            var firstRow = null;
	
	            $("table tr").each(function(index) {
	                // 첫 번째 행(헤더)은 건너뛰기
	                if (index === 0) return;
	
	                var $this = $(this);
	                var orderId = $.trim($this.find("td:eq(1)").text()); // 주문번호가 있는 칼럼 인덱스
	
	                if (orderId === lastOrderId) {
	                    // 동일한 주문번호를 가진 행 발견
	                    mergeCount++;
	
	                    // 현재 행의 주문번호, 택배사, 배송, 구매 확정여부 셀을 제거
	                    $this.find("td:eq(1), td:eq(8), td:eq(9), td:eq(10)").remove();
	                } else {
	                    // 새로운 주문번호 처리 시작
	                    if (mergeCount > 0) {
	                        // 이전에 병합했던 셀의 rowspan 크기 조정
	                        firstRow.find("td:eq(1), td:eq(8), td:eq(9), td:eq(10)").attr("rowspan", mergeCount + 1);
	                    }
	                    mergeCount = 0;
	                    firstRow = $this;
	                }
	
	                lastOrderId = orderId;
	            });
	
	            // 마지막 그룹의 rowspan 조정
	            if (mergeCount > 0) {
	                firstRow.find("td:eq(1), td:eq(8), td:eq(9), td:eq(10)").attr("rowspan", mergeCount + 1);
	            }
	        });
			</script>
    </body>
</html>