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
        <link href="/resources/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	    <style>

		.chart-container-wrapper {
		    display: flex;
		    flex-direction: row;
		}
		
		.chart-container {
		    flex: 1;
		    margin-right: 10px; /* 각 차트 사이의 간격을 조절합니다. 필요에 따라 조정하세요. */
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
                        <h1 class="mt-4">정산</h1>
					    <div class="chart-container-wrapper">
						    <div class="chart-container">
						        <canvas id="salesChart"></canvas>
						    </div>
						    <div class="chart-container">
						        <canvas id="netSalesChart"></canvas>
						    </div>
						    <div class="chart-container">
						        <canvas id="feeChart"></canvas>
						    </div>
						</div><br>
						<div class="table-container">
							<table>
							<h4>하루 판매량 순위</h4>
								<tr>
									<td>상품</td>
									<td>수량</td>
								</tr>
						        <c:forEach var="item" items="${dailySalesRank}">
						            <tr>
						                <td>${item.product}</td>
						                <td>${item.totalSold}</td>
						            </tr>
						        </c:forEach>
						    </table>
						    <table>
						    <h4>일주일 판매량 순위</h4>
						    	<tr>
									<td>상품</td>
									<td>수량</td>
								</tr>
						        <c:forEach var="item" items="${weeklySalesRank}">
						            <tr>
						                <td>${item.product}</td>
						                <td>${item.totalSold}</td>
						            </tr>
						        </c:forEach>
						    </table>
						    <table>
						    <h4>한달 판매량 순위</h4>
						    	<tr>
									<td>상품</td>
									<td>수량</td>
								</tr>
						        <c:forEach var="item" items="${monthlySalesRank}">
						            <tr>
						                <td>${item.product}</td>
						                <td>${item.totalSold}</td>
						            </tr>
						        </c:forEach>
						    </table>
						    <table>
						    <h4>전체 판매량 순위</h4>
						    	<tr>
									<td>상품</td>
									<td>수량</td>
								</tr>
						        <c:forEach var="item" items="${allSalesRank}">
						            <tr>
						                <td>${item.product}</td>
						                <td>${item.totalSold}</td>
						            </tr>
						        </c:forEach>
						    </table>
					    </div>
					    <script>
					    document.addEventListener('DOMContentLoaded', (event) => {
					        // 판매 매출액 그래프
					        var ctxSales = document.getElementById('salesChart').getContext('2d');
					        var salesChart = new Chart(ctxSales, {
					            type: 'line',
					            data: {
					                labels: ['오늘', '일주일', '한달'],
					                datasets: [{
					                    label: '총 매출액',
					                    data: [${todaySales}, ${weeklySales}, ${monthlySales}],
					                    backgroundColor: [
					                        'rgba(255, 99, 132, 0.2)',
					                        'rgba(54, 162, 235, 0.2)',
					                        'rgba(255, 206, 86, 0.2)'
					                    ],
					                    borderColor: [
					                        'rgba(255, 99, 132, 1)',
					                        'rgba(54, 162, 235, 1)',
					                        'rgba(255, 206, 86, 1)'
					                    ],
					                    borderWidth: 1
					                }]
					            },
					            options: {
					                scales: {
					                    y: {
					                        beginAtZero: true
					                    }
					                }
					            }
					        });
					
					        // 순수 매출액 그래프
					        var ctxNetSales = document.getElementById('netSalesChart').getContext('2d');
					        var netSalesChart = new Chart(ctxNetSales, {
					            type: 'line',
					            data: {
					                labels: ['오늘', '일주일', '한달'],
					                datasets: [{
					                    label: '순수 매출액',
					                    data: [${todayNetSales}, ${weeklyNetSales}, ${monthlyNetSales}],
					                    backgroundColor: [
					                        'rgba(153, 102, 255, 0.2)',
					                        'rgba(255, 159, 64, 0.2)',
					                        'rgba(75, 192, 192, 0.2)'
					                    ],
					                    borderColor: [
					                        'rgba(153, 102, 255, 1)',
					                        'rgba(255, 159, 64, 1)',
					                        'rgba(75, 192, 192, 1)'
					                    ],
					                    borderWidth: 1
					                }]
					            },
					            options: {
					                scales: {
					                    y: {
					                        beginAtZero: true
					                    }
					                }
					            }
					        });
					     // 수수료 그래프
					        var ctxFee = document.getElementById('feeChart').getContext('2d');
					        var feeChart = new Chart(ctxFee, {
					            type: 'line',
					            data: {
					                labels: ['오늘', '일주일', '한달'],
					                datasets: [{
					                    label: '수수료',
					                    data: [${todayFee}, ${weeklyFee}, ${monthlyFee}],
					                    backgroundColor: [
					                        'rgba(255, 159, 64, 0.2)',
					                        'rgba(75, 192, 192, 0.2)',
					                        'rgba(153, 102, 255, 0.2)'
					                    ],
					                    borderColor: [
					                        'rgba(255, 159, 64, 1)',
					                        'rgba(75, 192, 192, 1)',
					                        'rgba(153, 102, 255, 1)'
					                    ],
					                    borderWidth: 1
					                }]
					            },
					            options: {
					                scales: {
					                    y: {
					                        beginAtZero: true
					                    }
					                }
					            }
					        });
					    });
					    </script>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/resources/js/scripts.js"></script>
    </body>
</html>
