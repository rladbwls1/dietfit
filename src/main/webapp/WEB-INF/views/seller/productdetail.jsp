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
    
    
    
    <!-- 페이지 상단에 다음과 같이 스크립트를 추가합니다. -->
<script>
    // 최근 본 상품 정보를 가져오는 함수
    function getRecentlyViewedProducts() {
        var recentlyViewedProducts = [];
        var cookieValue = document.cookie.replace(/(?:(?:^|.*;\s*)recentlyViewedProducts\s*=\s*([^;]*).*$)|^.*$/, "$1");

        if (cookieValue) {
            try {
                recentlyViewedProducts = JSON.parse(decodeURIComponent(cookieValue));
            } catch (e) {
                console.error("Error parsing recently viewed products JSON:", e);
            }
        }

        return recentlyViewedProducts;
    }

    // 최근 본 상품 정보를 쿠키에 저장하는 함수
    function setRecentlyViewedProducts(recentlyViewedProducts) {
        var cookieExpirationDays = 7; // 쿠키 유효 기간 설정 (일 단위)
        var expirationDate = new Date();
        expirationDate.setDate(expirationDate.getDate() + cookieExpirationDays);

        document.cookie = "recentlyViewedProducts=" + encodeURIComponent(JSON.stringify(recentlyViewedProducts)) + "; expires=" + expirationDate.toUTCString() + "; path=/";
    }

    // 상품 페이지가 로드될 때 실행되는 함수
    function onProductPageLoad(productId, productName, productUrl) {
        var recentlyViewedProducts = getRecentlyViewedProducts();

        // 중복 상품 체크
        var existingProductIndex = recentlyViewedProducts.findIndex(function (product) {
            return product.id === productId;
        });

        // 중복된 상품이 없으면 최근 본 상품에 추가
        if (existingProductIndex === -1) {
            recentlyViewedProducts.unshift({ id: productId, name: productName, url: productUrl });
            // 최근 본 상품을 최대 5개까지 유지하도록 설정
            if (recentlyViewedProducts.length > 5) {
                recentlyViewedProducts.pop();
            }

            // 최근 본 상품 정보를 쿠키에 저장
            setRecentlyViewedProducts(recentlyViewedProducts);
        }
    }
</script>
    
    
</body>
</html>