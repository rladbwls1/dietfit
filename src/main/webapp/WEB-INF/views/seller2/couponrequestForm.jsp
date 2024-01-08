<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쿠폰요청</title>
</head>
<body>
    <h2>쿠폰요청</h2>
    <form action="#" th:action="@{/coupon/request}" th:object="${couponRequest}" method="post">
        <label for="coupon">쿠폰이름</label>
        <input type="text" id="coupon" th:field="*{coupon}" required>
        <br>
        <label for="description">쿠폰id:</label>
        <textarea id="description" th:field="*{description}" required></textarea>
        <br>
        <!-- 나머지 필드들 추가 -->
        <label for="createdate">생성일:</label>
        <input type="date" id="createdate" th:field="*{createdate}" required>
        <br>
        <label for="deletedate">만료일:</label>
        <input type="date" id="deletedate" th:field="*{deletedate}" required>
        <br>
        <label for="company">회사id:</label>
        <input type="text" id="company" th:field="*{company}" required>
        <br>
        <label for="download">다운로드횟수:</label>
        <input type="number" id="download" th:field="*{download}" required>
        <br>
        <label for="discount">할인율:</label>
        <input type="number" id="discount" th:field="*{discount}" required>
        <br>
        <label for="boardnums">적용가능상품:</label>
        <input type="text" id="boardnums" th:field="*{boardnums}" required>
        <br>

        <button type="submit">신청하기</button>
    </form>
</body>
</html>
