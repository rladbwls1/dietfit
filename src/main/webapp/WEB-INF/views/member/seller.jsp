<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>판매자 페이지</title>
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
            flex-direction: column;
        }

        h1 {
            color: #333;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            width: 300px;
            margin-top: 20px;
        }

        form {
            margin: 0;
        }

        input[type="submit"] {
            background-color: #848482;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #61615F;
        }
    </style>
</head>
<body>
    <h1>판매자</h1>

    <div class="button-container">
        <form action="/logout" method="post">
            <input type="submit" value="로그아웃"/>
        </form>

        <form action="/seller/mypage" method="post">
            <input type="submit" value="마이페이지"/>
        </form>
    </div>
</body>
</html>
