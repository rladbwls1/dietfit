<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>최근본상품</title>
    <!-- 쿠키에서 최근 본 상품 정보를 가져와서 표시하는 JavaScript 코드 추가 -->
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

        // 페이지 로드 시 실행되는 함수
        window.onload = function () {
            var id = "${id}"; // 사용자 ID
            var recentlyViewedProducts = getRecentlyViewedProducts();
            var container = document.getElementById("recentlyViewedContainer");

            // 최근 본 상품 목록을 화면에 표시
            if (recentlyViewedProducts.length > 0) {
                var ul = document.createElement("ul");

                recentlyViewedProducts.forEach(function (product) {
                    var li = document.createElement("li");
                    li.textContent = product.name + " - " + product.url;
                    ul.appendChild(li);
                });

                container.appendChild(ul);
            } else {
                container.textContent = "최근에 본 상품이 없습니다.";
            }
        };
    </script>
</head>
<body>
    <h1>${id}님이 최근에 본 상품 목록</h1>
    <div id="recentlyViewedContainer"></div>
</body>
</html>
