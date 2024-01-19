<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> 
	</head>
	<body>
	<form action="seller/purchasepro">
		<label>택배사 <br>
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
        </label><br>
		<label>송장번호 <br>
			<input type ="text" name="tracking" id = "tracking" required>
		</label><br>
			<input type="hidden" name="orderid" value="${orderid}">
			<input type="hidden" name="companyid" value="${companyid}">
			<input type="submit"  value="등록">
			
		</form>
	</body>               
</html>
