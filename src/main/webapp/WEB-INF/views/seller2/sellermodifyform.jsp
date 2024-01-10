<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>판매자 정보수정</title>
</head>
<body>
    <h2>판매자 정보 수정</h2>
    <form action="/seller/modifyPro" method="post">
        <label for="id">ID:</label>
        <input type="text" id="id" name="id" required><br>

        <label for="pw">Password:</label>
        <input type="password" id="pw" name="pw" required><br>

        <label for="name">이름:</label>
        <input type="text" id="name" name="name" required><br>

        <label for="nic">닉네임:</label>
        <input type="text" id="nic" name="nic" required><br>

        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" required><br>

        <button type="submit">수정</button>
    </form>
    <form action="/seller/withdrawpro" method="post">
        <button type="submit">탈퇴</button>
    </form>
</body>
</html>
