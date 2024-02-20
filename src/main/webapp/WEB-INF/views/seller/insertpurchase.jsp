<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>송장입력</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> 
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
            margin-bottom: 10px;
            color: #555;
        }

        input, select {
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
    <h2>송장 번호 입력</h2>
    <form action="seller/purchasepro">
		<label>택배사<br>
			<select name = "courier" id = "courier">
				<option value="04">CJ대한통운</option>
				<option value="05">한진택배</option>
				<option value="08">롯데택배</option>
				<option value="01">우체국택배</option>
				<option value="46">CU 편의점택배</option>
				<option value="24">GS Postbox 택배</option>
				<option value="53">농협택배</option>
				<option value="69">대림통운</option>
				<option value="94">카카오 T 당일배송</option>
			</select>
	       </label>
	       <br>
		<label>송장번호<br>
			<input type ="text" name="tracking" id = "tracking" required>
		</label>
		<br>
			<input type="hidden" name="orderid" value="${orderid}">
			<input type="hidden" name="companyid" value="${companyid}">
			<input type="hidden" name="memberid" value="${memberid}">
			<input type="submit"  value="등록">
	</form>
</body>
</html>