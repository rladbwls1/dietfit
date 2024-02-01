<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>매출 그래프</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
	.chart-container {
	    width: 30%;  
	    height: auto; 
	    margin: auto; 
	    display: inline-block;
	}
	</style>
</head>
<body>
    <!-- 판매 매출액 그래프 -->
    <canvas id="salesChart" class="chart-container"></canvas>
    <!-- 순수 매출액 그래프 -->
    <canvas id="netSalesChart" class="chart-container"></canvas>
    <!-- 수수료 그래프 -->
    <canvas id="feeChart" class="chart-container"></canvas>
    <script>
    document.addEventListener('DOMContentLoaded', (event) => {
        // 판매 매출액 그래프
        var ctxSales = document.getElementById('salesChart').getContext('2d');
        var salesChart = new Chart(ctxSales, {
            type: 'bar',
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
            type: 'bar',
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
            type: 'bar',
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
</body>
</html>
