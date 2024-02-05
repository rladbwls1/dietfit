<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>판매자 정보수정</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .form-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 450px; /* 수정: 폼의 넓이를 늘림 */
            text-align: center;
            margin-bottom: 20px; /* 수정폼과 탈퇴폼 사이 간격 조절 */
        }

        h2 {
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
        }

        input {
            width: calc(100% - 16px);
            box-sizing: border-box;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        .form-container form button[type="submit"] {
            background-color: #4caf50; /* 수정: 수정버튼 파란색 */
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 13px;
            margin-top: 8px; /* 버튼 상단 간격 조절 */
        }

        .form-container form button[type="submit"]:hover {
            background-color: #45a049;
        }

        .form-container form button[type="button"] {
            background-color: #ff0000; /* 수정: 탈퇴버튼 빨간색 */
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 13px;
            margin-top: 8px; /* 버튼 상단 간격 조절 */
        }

        .form-container form button[type="button"]:hover {
            background-color: #ff3333;
        }
        .myPageButton{
        	background-color: #286FAE;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 10px;
            margin-bottom: 20px;
        }
        .myPageButton:hover {
            background-color: #20588A;
        }
    </style>
</head>
<body>
    <div class="form-container">
    <button class="myPageButton" onclick="goToMyPage()">MYPAGE</button>
        <form action="/seller/modifyPro" method="post">
            <h2>판매자 정보 수정</h2>
            <label for="id">ID:</label>
            <input type="text" id="id" name="id" value="${id}" readonly>

            <label for="pw">비밀번호:</label>
            <input type="password" id="pw" name="pw" placeholder="비밀번호를 변경하실 경우에만 변경하실 비밀번호를 입력해주세요">

            <label for="name">이름:</label>
            <input type="text" id="name" name="name" value="${name}" required>

            <label for="nic">닉네임:</label>
            <input type="text" id="nic" name="nic" value="${nic}" required>

            <label for="email">이메일:</label>
            <input type="email" id="email" name="email" value="${email}" required>

            <button type="button" onclick="location.href='/seller/withdrawpro';">탈퇴</button>
            <button type="submit">수정</button>
        </form>
    </div>
</body>
	<script>
        // my페이지로 이동하는 함수
        function goToMyPage() {
            window.location.href = '/seller/mypage'; // 원하는 경로로 변경
        }
    </script>
</html>
