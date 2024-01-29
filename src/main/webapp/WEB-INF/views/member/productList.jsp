<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
  
<script src="/resources/js/member2.js"></script>

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
    <br/><button type="button" onclick="javascript:window.location='/member/all'">all로 가기 </button>
	<br/>
    <table>
        <thead>
            <tr>
                <th>Product Name</th>
                <th>Price</th>
                <th>Image</th>
                <th>Wish</th>
            </tr>
        </thead>
        <tbody>
		    <c:forEach var="product" items="${products}">
		        <tr>
		            <td><a href="javascript:void(0)" onclick="toDetail('${product.companyid}','${product.category}','${product.category2}','${product.flavor}')">${product.product}</a>
		             <sec:authorize access="isAuthenticated()">
		             <a href="javascript:void(0)" onclick="openCart('${product.companyid}','${product.category}','${product.category2}','${product.price}')"><img src="/resources/img/free-icon-shopping-bag-7688439.png" width="20px" /></a>
		            </sec:authorize>
		            </td>
		            <td>${product.price}</td>
		            <td>
		               <img src="${product.imagePath}" alt="${product.product}">
		            </td>
		            <!-- 찜 -->
		            <td>
		            <sec:authorize access="isAnonymous()">
		            <img src="/resources/img/free-icon-love-7476962.png" width="20px"/>
		            </sec:authorize>
		            <sec:authorize access="isAuthenticated()">
		            	<c:choose>
		            	<c:when test="${wishList.contains(product.product)}">
				            <a href="javascript:void(0)" onclick="removeWishList('${product.product}')" >
				            <img src="/resources/img/free-icon-love-4397571.png" width="20px"/>
				            </a>
		            	</c:when>
		            	<c:otherwise>
				            <a href="javascript:void(0)" onclick="addWishList('${product.product}')" >
		           		 	<img src="/resources/img/free-icon-love-7476962.png" width="20px"/>
				            </a>
		            	</c:otherwise>
		            	</c:choose>
		            	
		            </sec:authorize>
		            </td>
		            <!-- 찜 -->
		        </tr>
		    </c:forEach>
		    
		    
		</tbody>
    </table>

	<!-- 페이지 -->
    <table>
    <c:if test="${count>0 }">
		<c:if test="${endPage > pageCount }">
			<c:set var="endPage" value="${pageCount}"/>
		</c:if>
       	<c:if test="${startPage > 10 }">
                   <a href="javascript:window.location='/member/productList?pageNum=${startPage - 10}'" style="text-decoration-line : none; color:black;" >이전</a>
       	</c:if>
       
       	<c:forEach var="i" begin="${startPage}" end="${endPage}">
       		<c:choose>
       			<c:when test="${i==currentPage }">
                        <a href="javascript:window.location='/member/productList?pageNum=${i}'" style="text-decoration-line : none; color:red;">${i}</a>
       			</c:when>
       			<c:otherwise>
                        <a href="javascript:window.location='/member/productList?pageNum=${i}'" style="text-decoration-line : none; color:black;">${i}</a>
       			</c:otherwise>
       		</c:choose>
       	</c:forEach>
      		<c:if test="${endPage < pageCount }">
                   <a href="javascript:window.location='/member/productList?pageNum=${startPage + 10}'" style="text-decoration-line : none; color:black;" >다음</a>
      		</c:if>
    </c:if>
    </table>
    
    
    
</body>

</html>
