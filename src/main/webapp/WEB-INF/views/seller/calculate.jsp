<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
	<head>
		
	</head>
	
	<body>
		<h2>${companyid }님 어서오세요</h2>
        <form action="seller/sales" method="post">
			<input type="hidden" name="companyid" value="${companyid}"/>
		    <input type="submit" value="순매출 현황"/>
		</form>
        <form action="seller/salesranking" method="post">
			<input type="hidden" name="companyid" value="${companyid}"/>
		    <input type="submit" value="판매량 순위"/>
		</form>
	</body>
</html>