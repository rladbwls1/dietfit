<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>판매량 순위</title>
</head>
<body>
	<h2>하루 판매량 순위</h2>
    <table>
		<tr>
			<td>상품</td>
			<td>수량</td>
		</tr>
        <c:forEach var="item" items="${dailySalesRank}">
            <tr>
                <td>${item.product}</td>
                <td>${item.totalSold}</td>
            </tr>
        </c:forEach>
    </table>

    <h2>일주일 판매량 순위</h2>
    <table>
    	<tr>
			<td>상품</td>
			<td>수량</td>
		</tr>
        <c:forEach var="item" items="${weeklySalesRank}">
            <tr>
                <td>${item.product}</td>
                <td>${item.totalSold}</td>
            </tr>
        </c:forEach>
    </table>

    <h2>한달 판매량 순위</h2>
    <table>
    	<tr>
			<td>상품</td>
			<td>수량</td>
		</tr>
        <c:forEach var="item" items="${monthlySalesRank}">
            <tr>
                <td>${item.product}</td>
                <td>${item.totalSold}</td>
            </tr>
        </c:forEach>
    </table>

    <h2>전체 판매량 순위</h2>
    <table>
    	<tr>
			<td>상품</td>
			<td>수량</td>
		</tr>
        <c:forEach var="item" items="${allSalesRank}">
            <tr>
                <td>${item.product}</td>
                <td>${item.totalSold}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
