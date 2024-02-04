<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>판매자 정보수정</title>
    <style>
        /* 입력 폼의 가로 길이를 조절하는 CSS */
        input {
            width: 100%;
            box-sizing: border-box; /* 입력 폼의 크기를 width와 padding 값으로 계산하도록 설정 */
            padding: 8px; /* 좌우 여백 설정 */
            margin-bottom: 10px; /* 하단 여백 설정 */
        }
    </style>
</head>
<body>
    <h2>판매자 정보 수정</h2>
    <form action="/seller/modifyPro" method="post">
        <label for="id">ID:</label>
        <input type="text" id="id" name="id" value="${id}" readonly><br>

        <label for="pw">Password:</label>
		<input type="password" id="pw" name="pw" placeholder="비밀번호를 변경하실 경우에만 변경하실 비밀번호를 입력해주세요" ><br>

        <label for="name">이름:</label>
        <input type="text" id="name" name="name" value="${name}" required><br>

        <label for="nic">닉네임:</label>
        <input type="text" id="nic" name="nic" value="${nic}" required><br>

        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" value="${email}" required><br>

        <button type="submit">수정</button>
    </form>
    <form action="/seller/withdrawpro" method="post">
        <button type="submit">탈퇴</button>
    </form>
</body>
</html>
