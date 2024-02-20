<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dietfit(Admin)</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="/resources/js/jquery-3.7.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="/resources/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body>
	<div id="layoutSidenav_content">
		<div class="container-fluid px-4">
		    <h1 class="mt-4">판매목록보기</h1>
       	<c:if test="${productcount == 0}">
			<h5> 판매상품이 없습니다. </h5>
		</c:if>
		<c:if test="${productcount > 0}">
    	<div class="card mb-4">
        	<div class="card-header">
           		<i class="fas fa-table me-1"></i>
            		Product
       		</div>
			<div class="card-body">
				<table id="datatablesSimple">
	                <thead>
	                   <tr>
			               <th>상품이름</th>
			                <th>가격</th>
			                <th>조회수</th>
			                <th>재고수</th>
			                <th>유통기한</th>
	                     </tr>
	                 </thead>
	                 <tbody>
	                     <c:forEach var="product" items="${productList}">
						   <tr>
						   	<td>${product.product}</td>
		                    <td>${product.price}</td>
		                    <td>${product.count}</td>
		                    <td>${product.stock}</td>
		                    <td>
		                    	<fmt:formatDate value= "${product.expiry}" pattern="yyyy-MM-dd"/>
		                    </td>
						   </tr>
						</c:forEach>	
	                </tbody>
	            </table>
	          </div>
	          </div>
            </c:if>
            </div>
            </div>
            
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="/resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    <script src="/resources/js/datatables-simple-demo.js"></script>
    
</body>
</html>