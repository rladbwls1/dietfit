<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Company Products</title>
</head>
<body>
    <h2>Company Products</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Product Name</th>
                <th>Category</th>
                <th>Stock</th>
                <th>Expiry Date</th>
                <th>Price</th>
                <th>discount</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="product" items="${companyProducts}">
                <tr>
                    <td>${product.product}</td>
                    <td>${product.category}</td>
                    <td>${product.stock}</td>
                    <td>
		            	<fmt:formatDate value="${product.expiry}" pattern="yyyy-MM-dd"/>
		            </td>
                    <td>${product.price}</td>
                    <td><button onclick="openDiscountFormPopup('${product.num}')">할인율 설정</button></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <script>
    function openDiscountFormPopup(num) {

        var popupUrl = '/seller/discountForm?num=' + num;
        var popupWindow = window.open(popupUrl, '_blank', 'width=600, height=400, scrollbars=yes');
        
        if (popupWindow) {
            popupWindow.focus();
        }
        
    }
    function closewindow2(){
    	window.location.href="/seller/productdiscount";
    	
    }
</script>
</body>
</html>
