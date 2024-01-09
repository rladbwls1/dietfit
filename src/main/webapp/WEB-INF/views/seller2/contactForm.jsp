<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Inquiry Form</title>
</head>
<body>
    <h2>Product Inquiry Form</h2>
    <form action="/seller/submitInquiry" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="hidden" name="productId" value="${productId}"/>

        <!-- 상품 이름 (고정 값) -->
        <label for="productId">상품 이름:</label>
        <input type="text" id="productId" name="productId" value="${productId}" readonly><br>

        <!-- 작성자 -->
        <label for="id">작성자:</label>
        <input type="text" id="id" name="id" required><br>

        <!-- 문의 종류 -->
        <label for="inquire">문의 종류:</label>
        <select id="inquire" name="inquire" required>
            <option value="delivery">배송문의</option>
            <option value="product">상품문의</option>
            <option value="other">기타문의</option>
        </select><br>

        <!-- 문의 내용 -->
        <label for="content">문의 내용:</label>
        <textarea id="content" name="content" rows="4" cols="50" required></textarea><br>

        <!-- 파일 업로드 (선택 사항) -->
        <label for="file">파일 첨부:</label>
        <input type="file" id="file" name="file"><br>

        <!-- 비밀글 여부 -->
        <label for="sec">비밀글 여부:</label>
        <input type="checkbox" id="sec" name="sec"><br>

        <button type="submit">문의 제출</button>
    </form>
</body>
</html>
