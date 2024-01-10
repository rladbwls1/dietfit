<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/resources/js/jquery-3.7.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<c:if test="${productcount == 0}">
		<h5> 판매자가 없습니다. </h5>
	</c:if>
	<c:if test="${productcount > 0}">
	<button type="button" id="checkStock">✔상품재고✔</button>

		<table>
	        <thead>
	            <tr>
	            	<th>상품아이디</th>
	                <th>상품이름</th>
	                <th>가격</th>
	                <th>조회수</th>
	                <th>재고수</th>
	                <th>유통기한</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach var="allProduct" items="${allProduct}">
	                <tr>
	                	<td>${allProduct.companyid}${allProduct.category}${allProduct.category2}${allProduct.flavor}</td>
	                    <td>${allProduct.product}</td>
	                    <td>${allProduct.price}</td>
	                    <td>${allProduct.count}</td>
	                    <td>${allProduct.stock}</td>
	                    <td>
	                    	<fmt:formatDate value= "${allProduct.expiry}" pattern="yyyy-MM-dd"/>
	                    </td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
    </c:if>
</body>

<script>
    $(document).ready(function() {
        $("#checkStock").on("click", function() {
            // 서버로 AJAX 요청을 보냄
            $.ajax({
                url: "/admin/checkStock",
                method: "POST",
                success: function(response) {
                    alert(response); // 서버에서 받은 응답을 처리하거나 알림창 등으로 표시
                },
                error: function(error) {
                    console.error("Error occurred:", error);
                }
            });
        });
    });
</script>

</html>