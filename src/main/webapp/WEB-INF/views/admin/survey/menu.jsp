<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>Survey Menu</h2>
<p>Protein: ${protein}</p>

    <p>Detail Count: <span id="detailCount">${detailCount}</span></p>
    
    <ul id="productList">
        <c:forEach var="product" items="${productinfo}">
            <li>${product.productName} - ${product.protein}g Protein</li>
        </c:forEach>
    </ul>
</body>
</html>
