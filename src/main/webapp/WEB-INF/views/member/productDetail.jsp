<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Product Details</title>
</head>
<body>
    <h2>Product Details</h2>
    <table>
    	<tr>
    		<td>
    			<c:forEach var="thumbnailPath" items="${thumbnailPaths}">
				    <img src="${thumbnailPath}" width="300"> 
				</c:forEach>
    		</td>
    	</tr>	
        <tr>
            <td>상품이름:</td>
            <td>${product.PRODUCT}</td>
        </tr>
        <tr>
            <td>가격:</td>
           	<td>
				<c:if test="${product.SALE!=0}">
				<span style="color:gray;text-decoration: line-through;">${product.ORIPRICE}</span><br/><span style="color:red">${product.SALE}%</span> 
				</c:if>
				${product.PRICE }
			</td>
        </tr>
        <tr>
            <td>상세설명:</td>
            <td>${product.DETAIL}</td>
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
            <td>
				<c:choose>
			        <c:when test="${product.DELIVERY == 0}">
			            일반배송, 정기배송
			        </c:when>
			        <c:when test="${product.DELIVERY == 1}">
			            일반배송
			        </c:when>
			        <c:otherwise>
			            기타 배송 옵션
			        </c:otherwise>
			    </c:choose>
            </td>
        </tr>
        <!-- 
        <tr>
            <td>조회수:</td>
            <td>${product.count}</td>
        </tr>
         -->
        <tr>
            <td>유통기한:</td>
            <td>
            	<fmt:formatDate value="${product.EXPIRY}" pattern="yyyy-MM-dd"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <form action="/sellerchat/chat" method="post">
                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="hidden" name="product" value="${product.PRODUCT}">
                    <input type="hidden" name="companyid" value="${product.COMPANYID}">
                    <button type="submit">상품 문의</button>
                </form>
            </td>
        </tr>
    </table>

</body>
</html>