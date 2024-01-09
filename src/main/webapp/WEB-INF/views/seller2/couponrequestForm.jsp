<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>쿠폰요청</title>
</head>
<body>
    <h2>쿠폰요청</h2>
    <form action="/seller/coupon/requestPro" method="post">
    
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <label for="coupon">쿠폰이름</label>
        <input type="text" id="coupon" name="coupon" required>
        <br>
        <label for="createdate">생성일:</label>
        <input type="date" id="createdate" name="createdate" required>
        <br>
        <label for="deletedate">만료일:</label>
        <input type="date" id="deletedate" name="deletedate" required>
        <br>
        <label for="companyid">회사id:</label>
        <input type="text" id="companyid" name="companyid" required>
        <br>
        <label for="download">다운로드횟수:</label>
        <input type="number" id="download" name="download" required>
        <br>
        <label for="discount">할인율:</label>
        <input type="number" id="discount" name="discount" required>
        <br>
        <label for="boardnums">적용가능상품:</label>
        <input type="text" id="boardnums" name="boardnums" required>
        <br>
        <button type="submit">신청하기</button>
    </form>
</body>
</html>
