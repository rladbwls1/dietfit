<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>채팅 신고</title>
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
            margin-bottom: 10px;
            margin-top: 8px;
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

        input,textarea {
            width: calc(100% - 16px);
            box-sizing: border-box;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
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
    <h2>채팅 신고</h2>
    <form id="reportForm" action="/seller/chatreportpro" method="post">
	    <input type="hidden" name="roomnum" id="roomnum" value="${roomnum}" />
	    
	    <label for="id">사용자 아이디:</label>
	    <input type="text" id="id" name="id" value ="${id}" readonly><br>
	
	    <label for="text">신고 사유:</label>
	    <textarea id="text" name="text" rows="4" cols="50" required></textarea><br>
	
	    <input type="submit" value="신고하기" >
	</form>
</body>
</html>