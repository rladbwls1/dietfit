<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h2>Product Details</h2>
    <table>
    	<tr>
    		<td>
    			<c:forEach var="thumbnailPath" items="${thumbnailPaths}">
				    <img src="${thumbnailPath}"> 
				</c:forEach>
    		</td>
    	</tr>	
        <tr>
            <td>상품이름:</td>
            <td>${product.product}</td>
        </tr>
        <tr>
            <td>가격:</td>
            <td>${product.price}</td>
        </tr>
        <tr>
            <td>상세설명:</td>
            <td>${product.detail}</td>
            <td>
            	<c:forEach var="imagePath" items="${imagePaths}">
		            <div>
		                <img src="${imagePath}"> 
		            </div>
		        </c:forEach>
            </td>
        </tr>
        <tr>
            <td>배송정보:</td>
            <td>${product.delivery}</td>
        </tr>
        <tr>
            <td>조회수:</td>
            <td>${product.count}</td>
        </tr>
        <tr>
            <td>유통기한:</td>
            <td>
            	<fmt:formatDate value="${product.expiry}" pattern="yyyy-MM-dd"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <form action="/sellerchat/chat" method="post">
                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="hidden" name="product" value="${product.product}">
                    <input type="hidden" name="companyid" value="${product.companyid}">
                    <button type="submit">상품 문의</button>
                </form>
            </td>
        </tr>
    </table>
    
    <!-- 상품 수정 버튼 -->
    <form action="/seller/store/Update" method="post">
	    <input type="hidden" name="companyid" value="${product.companyid}">
	    <input type="hidden" name="num" value="${product.num}">
	    <input type="hidden" name="isfile" value="${product.isfile}">
	    <input type="hidden" name="category" value="${product.category}">
        <input type="hidden" name="category2" value="${product.category2}">
        <input type="hidden" name="flavor" value="${product.flavor}">
	    <button type="submit">상품 수정</button>
	</form>

    <!-- 상품 삭제 버튼 -->
    <form action="seller/store/Delete" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="hidden" name="companyid" value="${product.companyid}">
    	<input type="hidden" name="category" value="${product.category}">
    	<input type="hidden" name="category2" value="${product.category2}">
    	<input type="hidden" name="flavor" value="${product.flavor}">
        <button type="submit" onclick="return confirm('상품을 삭제하시겠습니까?');">상품 삭제</button>
    </form>
    
    
    


</body>
</html>