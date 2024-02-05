<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Product List</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        img {
            display: block;
            margin: 0 auto;
            max-width: 100px;
            max-height: 100px;
        }
    </style>
</head>
<body>
    <h2>Product List</h2>
    <a href="<c:url value='productadd?companyid=${companyid}'/>">상품추가</a>
    <input type="hidden" name="companyid" value="${product.companyid}">
    <input type="hidden" name="product" value="${product.product}">
    <input type="hidden" name="category" value="${product.category}"/>
    <input type="hidden" name="category2" value="${product.category2}"/>
    <input type="hidden" name="flavor" value="${product.flavor}"/>
<<<<<<< HEAD
    <table>
=======
>>>>>>> branch 'main' of https://github.com/rladbwls1/dietfit.git
    <input type="hidden" name="companyid" value="${companyid}">
    <table>	
        <thead>
            <tr>
                <th>Product Name</th>
                <th>Price</th>
                <th>Image</th>
                <th>재고</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
		    <c:forEach var="product" items="${products}">
		        <tr>
		            <td><a href="<c:url value='/seller/product/details/${product.companyid}/${product.category}/${product.category2}/${product.flavor}'/>">${product.product}</a></td>
		            <td>${product.price}</td>
		            <td>
		                <img src="${product.imagePath}" alt="${product.product}">
		            </td>
		            <td>
					   <a href="/seller/sellerstock?productId=${product.companyid}${product.category}${product.category2}${product.flavor}">${product.stock}</a></td>
					<td>
						<button type="button" onclick="deleteProduct('${product.companyid}', '${product.category}', '${product.category2}', '${product.flavor}');">상품삭제</button>
					</td>
		        </tr>
		    </c:forEach>
		</tbody>
    </table>
</body>
<script>
function deleteProduct(companyid, category, category2, flavor) {
    if (confirm('정말로 상품을 삭제하시겠습니까?')) {
        // 확인 눌렀을 때 삭제 요청 보내기
        location.href = "/seller/productdelete?companyid=" + companyid +
            "&category=" + category +
            "&category2=" + category2 +
            "&flavor=" + flavor;
    }
}

</script>
</html>
