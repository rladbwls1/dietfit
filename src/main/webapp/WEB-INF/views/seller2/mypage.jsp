<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <title>Seller Mypage</title>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }

        .container {
            margin-top: 50px;
        }

        h1 {
            color: #007bff;
            text-align: center;
        }

        p {
            font-size: 1.2em;
            color: #6c757d;
            text-align: center;
        }

        form {
            margin: 15px 0;
            text-align: center;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</head>
<body>
<<<<<<< HEAD
    <div class="container">
        <h1>Seller Mypage</h1>
        <p>${id}님, 환영합니다.</p>
        <form action="/seller/modify" method="post">
            <button class="btn btn-primary" type="submit">정보 수정</button>
        </form>
        <form action="/seller/productdiscount" method="post">
            <button class="btn btn-primary" type="submit">상품 할인율 조정</button>
        </form>
        <form action="/seller/coupon/request" method="post">
            <button class="btn btn-primary" type="submit">쿠폰 요청</button>
        </form>
        <form action="/seller/sellerchatlist" method="post">
            <button class="btn btn-primary" type="submit">상품 문의 목록</button>
        </form>
        <form action="/seller/orderhome" method="post">
            <button class="btn btn-primary" type="submit">상품 주문 목록</button>
        </form>
        <form action="/seller/store/home" method="post">
            <button class="btn btn-primary" type="submit">상품 목록</button>
        </form>
        <form action="/seller/calculatehome" method="post">
            <button class="btn btn-primary" type="submit">정산</button>
        </form>
        <form action="/seller/Advertising" method="post">
            <button class="btn btn-primary" type="submit">광고 신청</button>
        </form>
    </div>

    <!-- Bootstrap JS 및 jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
=======
<h1>seller mypage</h1>
<p>${id}님 환영합니다.</p>
<br>
<form action="/seller/modify" method="post">
    <input type="submit" value="정보수정"/>
</form>
<br>
<form action="/seller/productdiscount" method="post">
    <input type="submit" value="상품할인율조정"/>
</form>
<form action="/seller/coupon/request" method="post">
    <input type="submit" value="쿠폰요청"/>
</form>
<br>
<form action="/seller/sellerchatlist" method="post">
    <input type="submit" value="상품문의 목록"/>
</form>
<br>
<form action="/seller/order" method="post">
	<input type="hidden" name="companyid" value="${companyid}"/>
    <input type="submit" value="상품주문 목록"/>
</form>
<br>
<form action="/seller/store" method="post">
	<input type="hidden" name="companyid" value="${companyid}"/>
    <input type="submit" value="상품 목록"/>
</form>
<br>
<form action="/seller/calculate" method="post">
	<input type="hidden" name="companyid" value="${companyid}"/>
    <input type="submit" value="정산"/>
</form>
<br>
<form action="/seller/commercailhome" method="post">
	<input type="hidden" name="companyid" value="${companyid}"/>
    <input type="submit" value="광고 신청"/>
</form>
>>>>>>> branch 'main' of https://github.com/rladbwls1/dietfit.git
</body>
</html>
