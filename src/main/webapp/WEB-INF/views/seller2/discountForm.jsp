<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Discount</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
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

        input[type="date"],
        input[type="number"] {
            width: calc(100% - 16px);
        }

        input[type="submit"] {
            background-color: #286FAE;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #20588A;
        }
    </style>
</head>
<body>
    <h2>할인율</h2>
    <form action="/seller/addDiscount" method="post">

        <label for="start">시작날짜</label>
        <input type="date" id="start" name="start" required>

        <label for="end">마감날짜</label>
        <input type="date" id="end" name="end" required>

        <label for="sale">할인율(%)</label>
        <input type="number" id="sale" name="sale" min="0" max="100" required>

        <!-- 상품 번호를 전달하기 위한 hidden input -->
        <input type="hidden" id="num" name="num" value="${num}">

        <input type="submit" onclick="closewindow()" value="저장하기">
    </form>
</body>
</html>
