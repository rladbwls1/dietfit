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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="/resources/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <style>
        	table {
			    display: none;
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
                        <h1 class="mt-4">${id}님 안녕하세요!</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active"></li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        순수 매출액
                                    </div>
                                    <div class="card-body"><canvas id="salesChart"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        최고 판매 상품
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart"></canvas></div>
                                    <table >
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
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script>
		    document.addEventListener('DOMContentLoaded', (event) => {
		        // 판매 매출액 그래프
		        var ctxSales = document.getElementById('salesChart').getContext('2d');
		        var salesChart = new Chart(ctxSales, {
		            type: 'bar',
		            data: {
		                labels: ['오늘', '어제', '그제'],
		                datasets: [{
		                    label: '총 매출액',
		                    data: [${todaySales}, ${weeklySales}, ${monthlySales}],
		                    backgroundColor: [
		                        'rgba(255, 99, 132, 0.2)',
		                        'rgba(255, 99, 132, 0.2)',
		                        'rgba(255, 99, 132, 0.2)'
		                    ],
		                    borderColor: [
		                        'rgba(255, 99, 132, 1)',
		                        'rgba(255, 99, 132, 1)',
		                        'rgba(255, 99, 132, 1)'
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
		            type: 'bar',
		            data: {
		                labels: ['오늘', '어제', '그제'],
		                datasets: [{
		                    label: '순수 매출액',
		                    data: [${todayNetSales}, ${weeklyNetSales}, ${monthlyNetSales}],
		                    backgroundColor: [
		                        'rgba(153, 102, 255, 0.2)',
		                        'rgba(153, 102, 255, 0.2)',
		                        'rgba(153, 102, 255, 0.2)'
		                    ],
		                    borderColor: [
		                        'rgba(153, 102, 255, 1)',
		                        'rgba(153, 102, 255, 1)',
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
		     // 수수료 그래프
		        var ctxFee = document.getElementById('feeChart').getContext('2d');
		        var feeChart = new Chart(ctxFee, {
		            type: 'bar',
		            data: {
		                labels: ['오늘', '어제', '그제'],
		                datasets: [{
		                    label: '수수료',
		                    data: [${todayFee}, ${weeklyFee}, ${monthlyFee}],
		                    backgroundColor: [
		                        'rgba(255, 159, 64, 0.2)',
		                        'rgba(255, 159, 64, 0.2)',
		                        'rgba(255, 159, 64, 0.2)'
		                    ],
		                    borderColor: [
		                        'rgba(255, 159, 64, 1)',
		                        'rgba(255, 159, 64, 1)',
		                        'rgba(255, 159, 64, 1)'
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
	    <script>

	 // HTML 테이블에서 데이터 가져오기
	    var tableRows = document.querySelectorAll('table tr');
	    var labels = [];
	    var data = [];

	    // 테이블의 각 행을 반복하며 데이터 추출
	    for (var i = 1; i < tableRows.length; i++) { // 첫 번째 행은 헤더이므로 건너뜀
	        var columns = tableRows[i].querySelectorAll('td');
	        labels.push(columns[0].textContent);
	        data.push(parseInt(columns[1].textContent)); // 숫자로 변환하여 데이터 배열에 추가
	    }

	    // Chart.js로 그래프 생성
	    var ctx = document.getElementById("myAreaChart");
	    var myLineChart = new Chart(ctx, {
	        type: 'bar',
	        data: {
	            labels: labels,
	            datasets: [{
	                label: "Sales",
	                lineTension: 0.3,
	                backgroundColor: "rgba(2,117,216,0.2)",
	                borderColor: "rgba(2,117,216,1)",
	                pointRadius: 5,
	                pointBackgroundColor: "rgba(2,117,216,1)",
	                pointBorderColor: "rgba(255,255,255,0.8)",
	                pointHoverRadius: 5,
	                pointHoverBackgroundColor: "rgba(2,117,216,1)",
	                pointHitRadius: 50,
	                pointBorderWidth: 2,
	                data: data,
	            }],
	        },
	        options: {
	            scales: {
	                xAxes: [{
	                    time: {
	                        unit: 'date'
	                    },
	                    gridLines: {
	                        display: false
	                    },
	                    ticks: {
	                        maxTicksLimit: 7
	                    }
	                }],
	                yAxes: [{
	                    ticks: {
	                        min: 0,
	                        max: Math.max(...data) + 1000, // 데이터의 최대값에 1000을 추가하여 여유를 줌
	                        maxTicksLimit: 5
	                    },
	                    gridLines: {
	                        color: "rgba(0, 0, 0, .125)",
	                    }
	                }],
	            },
	            legend: {
	                display: false
	            }
	        }
	    });

	    </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/resources/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    </body>
</html>
